-- ============================================================================
-- 野百灵餐饮集团 - 核心业务函数与触发器
-- 版本: 1.0.0
-- 说明: 本脚本包含所有核心业务逻辑的存储过程、函数和触发器
-- 依赖: schema.sql (必须先执行基础表创建脚本)
-- ============================================================================

\c ye_bai_ling_db

SET search_path = public;

-- ============================================================================
-- 第一部分: 成本加密/解密函数
-- ============================================================================

-- 加密成本数据
CREATE OR REPLACE FUNCTION encrypt_cost(p_cost DECIMAL)
RETURNS BYTEA AS $$
BEGIN
    RETURN pgp_sym_encrypt(p_cost::TEXT, current_setting('app.encryption_key'));
EXCEPTION WHEN OTHERS THEN
    RAISE WARNING '成本加密失败: %', SQLERRM;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION encrypt_cost IS '加密成本数据-使用app.encryption_key配置的密钥';

-- 解密成本数据
CREATE OR REPLACE FUNCTION decrypt_cost(p_encrypted BYTEA)
RETURNS DECIMAL AS $$
BEGIN
    IF p_encrypted IS NULL THEN
        RETURN NULL;
    END IF;
    RETURN pgp_sym_decrypt(p_encrypted, current_setting('app.encryption_key'))::DECIMAL;
EXCEPTION WHEN OTHERS THEN
    RAISE WARNING '成本解密失败: %', SQLERRM;
    RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION decrypt_cost IS '解密成本数据-需要正确的密钥才能解密';

-- ============================================================================
-- 第二部分: 单位换算函数
-- ============================================================================

-- 单位换算函数
CREATE OR REPLACE FUNCTION convert_unit(
    p_quantity DECIMAL,
    p_from_unit_id INT,
    p_to_unit_id INT,
    p_product_id INT DEFAULT NULL
)
RETURNS DECIMAL AS $$
DECLARE
    v_factor DECIMAL(10,4);
BEGIN
    -- 相同单位直接返回
    IF p_from_unit_id = p_to_unit_id THEN
        RETURN p_quantity;
    END IF;

    -- 查找换算系数 (优先产品特定,再找通用)
    SELECT conversion_factor INTO v_factor
    FROM unit_conversion
    WHERE from_unit_id = p_from_unit_id
      AND to_unit_id = p_to_unit_id
      AND (product_id = p_product_id OR product_id IS NULL)
    ORDER BY product_id DESC NULLS LAST
    LIMIT 1;

    IF v_factor IS NULL THEN
        RAISE EXCEPTION '无法找到从单位%到单位%的换算规则', p_from_unit_id, p_to_unit_id;
    END IF;

    RETURN p_quantity * v_factor;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION convert_unit IS '单位换算-支持通用换算和产品特定换算';

-- ============================================================================
-- 第三部分: BOM递归分解函数 ⭐核心业务逻辑
-- ============================================================================

-- 完全分解BOM到原材料
CREATE OR REPLACE FUNCTION explode_bom(
    p_product_id INT,
    p_quantity DECIMAL DEFAULT 1.0,
    p_brand_id INT DEFAULT NULL,
    p_max_level INT DEFAULT 10
)
RETURNS TABLE (
    level INT,
    ingredient_id INT,
    ingredient_code VARCHAR,
    ingredient_name VARCHAR,
    ingredient_type VARCHAR,
    total_quantity DECIMAL,
    unit_name VARCHAR,
    unit_cost DECIMAL,
    total_cost DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE bom_explosion AS (
        -- Level 1: 产品的直接原材料
        SELECT
            1 AS level,
            ri.ingredient_id,
            p.product_code AS ingredient_code,
            p.product_name AS ingredient_name,
            p.product_type AS ingredient_type,
            ri.net_quantity * p_quantity AS total_quantity,
            u.unit_name,
            decrypt_cost(ri.unit_price_encrypted) AS unit_cost,
            decrypt_cost(ri.subtotal_cost_encrypted) * p_quantity AS total_cost,
            ri.recipe_id,
            p.product_id AS parent_product_id
        FROM recipe r
        JOIN recipe_item ri ON r.recipe_id = ri.recipe_id
        JOIN product p ON ri.ingredient_id = p.product_id
        JOIN unit_of_measure u ON ri.unit_id = u.unit_id
        WHERE r.product_id = p_product_id
          AND r.is_current = TRUE
          AND r.status = 'approved'
          AND (p_brand_id IS NULL OR r.brand_id = p_brand_id)

        UNION ALL

        -- Level N: 递归分解半成品
        SELECT
            be.level + 1,
            ri.ingredient_id,
            p.product_code,
            p.product_name,
            p.product_type,
            ri.net_quantity * be.total_quantity / NULLIF(r.yield_quantity, 0) AS total_quantity,
            u.unit_name,
            decrypt_cost(ri.unit_price_encrypted) AS unit_cost,
            decrypt_cost(ri.subtotal_cost_encrypted) * be.total_quantity / NULLIF(r.yield_quantity, 0) AS total_cost,
            ri.recipe_id,
            be.ingredient_id AS parent_product_id
        FROM bom_explosion be
        JOIN recipe r ON r.product_id = be.ingredient_id
                      AND r.is_current = TRUE
                      AND r.status = 'approved'
        JOIN recipe_item ri ON r.recipe_id = ri.recipe_id
        JOIN product p ON ri.ingredient_id = p.product_id
        JOIN unit_of_measure u ON ri.unit_id = u.unit_id
        WHERE be.ingredient_type = 'semi_finished'
          AND be.level < p_max_level
          AND (p_brand_id IS NULL OR r.brand_id = p_brand_id)
    )
    SELECT
        be.level,
        be.ingredient_id,
        be.ingredient_code::VARCHAR,
        be.ingredient_name::VARCHAR,
        be.ingredient_type::VARCHAR,
        SUM(be.total_quantity)::DECIMAL,
        be.unit_name::VARCHAR,
        AVG(be.unit_cost)::DECIMAL,
        SUM(be.total_cost)::DECIMAL
    FROM bom_explosion be
    WHERE be.ingredient_type = 'raw_material'
    GROUP BY be.level, be.ingredient_id, be.ingredient_code,
             be.ingredient_name, be.ingredient_type, be.unit_name
    ORDER BY be.level, be.ingredient_name;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION explode_bom IS 'BOM递归分解-完全分解到原材料,支持10层嵌套';

-- 计算产品总成本
CREATE OR REPLACE FUNCTION calculate_product_total_cost(
    p_product_id INT,
    p_brand_id INT DEFAULT NULL
)
RETURNS DECIMAL AS $$
DECLARE
    v_total_cost DECIMAL;
BEGIN
    SELECT SUM(total_cost) INTO v_total_cost
    FROM explode_bom(p_product_id, 1.0, p_brand_id);

    RETURN COALESCE(v_total_cost, 0);
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION calculate_product_total_cost IS '计算产品总成本-基于当前配方';

-- ============================================================================
-- 第四部分: 财务指标计算函数 (双成本率体系)
-- ============================================================================

-- 自动计算财务指标触发器
CREATE OR REPLACE FUNCTION calculate_financial_metrics()
RETURNS TRIGGER AS $$
BEGIN
    -- 计算标准成本率 (折前基准)
    NEW.standard_cost_rate := CASE
        WHEN NEW.sales_amount_before_discount > 0
        THEN (NEW.theoretical_cost / NEW.sales_amount_before_discount * 100)
        ELSE 0
    END;

    -- 计算实际成本率 (折后基准) ⭐ 关键
    NEW.actual_cost_rate := CASE
        WHEN NEW.sales_revenue > 0
        THEN (NEW.theoretical_cost / NEW.sales_revenue * 100)
        ELSE 0
    END;

    -- 成本率差异
    NEW.cost_rate_variance := NEW.actual_cost_rate - NEW.standard_cost_rate;

    -- 折扣影响度
    NEW.discount_impact := CASE
        WHEN NEW.discount_rate > 0
        THEN (NEW.cost_rate_variance / NEW.discount_rate)
        ELSE 0
    END;

    -- 标准毛利率
    NEW.standard_gross_margin := CASE
        WHEN NEW.sales_amount_before_discount > 0
        THEN ((NEW.sales_amount_before_discount - NEW.theoretical_cost) / NEW.sales_amount_before_discount * 100)
        ELSE 0
    END;

    -- 实际毛利率 ⭐ 关键
    NEW.actual_gross_margin := CASE
        WHEN NEW.sales_revenue > 0
        THEN ((NEW.sales_revenue - NEW.theoretical_cost) / NEW.sales_revenue * 100)
        ELSE 0
    END;

    -- 利润侵蚀
    NEW.margin_erosion := NEW.standard_gross_margin - NEW.actual_gross_margin;

    -- 理论vs实际成本差异
    NEW.cost_variance := NEW.actual_cost - NEW.theoretical_cost;
    NEW.cost_variance_rate := CASE
        WHEN NEW.theoretical_cost > 0
        THEN (NEW.cost_variance / NEW.theoretical_cost * 100)
        ELSE 0
    END;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 应用触发器到sales_summary表
DROP TRIGGER IF EXISTS trg_calculate_metrics ON sales_summary;
CREATE TRIGGER trg_calculate_metrics
BEFORE INSERT OR UPDATE ON sales_summary
FOR EACH ROW EXECUTE FUNCTION calculate_financial_metrics();

COMMENT ON FUNCTION calculate_financial_metrics IS '自动计算双成本率和双毛利率指标';

-- ============================================================================
-- 第五部分: 库存管理触发器
-- ============================================================================

-- 自动更新库存余额触发器
CREATE OR REPLACE FUNCTION update_inventory_balance()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        -- 更新库存余额
        UPDATE inventory
        SET
            quantity_on_hand = quantity_on_hand + NEW.quantity,
            quantity_available = quantity_available + NEW.quantity,
            -- 加权平均成本计算
            avg_cost = CASE
                WHEN NEW.quantity > 0 AND NEW.unit_price IS NOT NULL THEN
                    (quantity_on_hand * COALESCE(avg_cost, 0) + NEW.quantity * NEW.unit_price) /
                    (quantity_on_hand + NEW.quantity)
                ELSE avg_cost
            END,
            last_purchase_price = CASE
                WHEN NEW.transaction_type = 'purchase' THEN NEW.unit_price
                ELSE last_purchase_price
            END,
            last_updated = NOW()
        WHERE warehouse_id = NEW.warehouse_id
          AND product_id = NEW.product_id
          AND COALESCE(batch_number, '') = COALESCE(NEW.batch_number, '');

        -- 如果库存记录不存在,创建新记录
        IF NOT FOUND THEN
            INSERT INTO inventory (
                warehouse_id,
                product_id,
                quantity_on_hand,
                quantity_available,
                unit_id,
                avg_cost,
                last_purchase_price,
                batch_number,
                production_date,
                expiry_date
            ) VALUES (
                NEW.warehouse_id,
                NEW.product_id,
                NEW.quantity,
                NEW.quantity,
                NEW.unit_id,
                NEW.unit_price,
                NEW.unit_price,
                NEW.batch_number,
                COALESCE(NEW.expiry_date - (SELECT shelf_life_days FROM product WHERE product_id = NEW.product_id), CURRENT_DATE),
                NEW.expiry_date
            );
        END IF;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 应用触发器
DROP TRIGGER IF EXISTS trg_update_inventory ON inventory_transaction;
CREATE TRIGGER trg_update_inventory
AFTER INSERT ON inventory_transaction
FOR EACH ROW EXECUTE FUNCTION update_inventory_balance();

COMMENT ON FUNCTION update_inventory_balance IS '自动更新库存余额-基于库存流水';

-- 库存负数检查触发器
CREATE OR REPLACE FUNCTION check_inventory_balance()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.quantity_on_hand < 0 THEN
        RAISE EXCEPTION '库存不能为负数: 仓库ID=%, 产品ID=%, 当前库存=%',
            NEW.warehouse_id, NEW.product_id, NEW.quantity_on_hand;
    END IF;

    -- 更新可用库存
    NEW.quantity_available := NEW.quantity_on_hand - COALESCE(NEW.quantity_reserved, 0);

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_check_inventory ON inventory;
CREATE TRIGGER trg_check_inventory
BEFORE INSERT OR UPDATE ON inventory
FOR EACH ROW EXECUTE FUNCTION check_inventory_balance();

-- ============================================================================
-- 第六部分: 配方管理触发器
-- ============================================================================

-- 自动计算净用量触发器
CREATE OR REPLACE FUNCTION calculate_net_quantity()
RETURNS TRIGGER AS $$
BEGIN
    NEW.net_quantity := NEW.quantity * (1 - COALESCE(NEW.waste_rate, 0));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_calculate_net_quantity ON recipe_item;
CREATE TRIGGER trg_calculate_net_quantity
BEFORE INSERT OR UPDATE ON recipe_item
FOR EACH ROW EXECUTE FUNCTION calculate_net_quantity();

-- 配方版本管理触发器
CREATE OR REPLACE FUNCTION manage_recipe_version()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.is_current = TRUE THEN
        -- 将同产品同品牌的其他版本设为非当前
        UPDATE recipe
        SET is_current = FALSE
        WHERE product_id = NEW.product_id
          AND COALESCE(brand_id, 0) = COALESCE(NEW.brand_id, 0)
          AND recipe_id != NEW.recipe_id
          AND is_current = TRUE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

DROP TRIGGER IF EXISTS trg_manage_recipe_version ON recipe;
CREATE TRIGGER trg_manage_recipe_version
AFTER INSERT OR UPDATE ON recipe
FOR EACH ROW EXECUTE FUNCTION manage_recipe_version();

-- ============================================================================
-- 第七部分: 审计日志触发器
-- ============================================================================

-- 通用审计日志函数
CREATE OR REPLACE FUNCTION audit_trigger()
RETURNS TRIGGER AS $$
DECLARE
    v_employee_id INT;
    v_record_id BIGINT;
BEGIN
    -- 获取当前员工ID (从session变量)
    BEGIN
        v_employee_id := current_setting('app.current_employee_id')::INT;
    EXCEPTION WHEN OTHERS THEN
        v_employee_id := NULL;
    END;

    -- 获取记录ID
    IF TG_OP = 'DELETE' THEN
        v_record_id := OLD.id;
    ELSE
        v_record_id := NEW.id;
    END IF;

    -- 插入审计日志
    IF TG_OP = 'DELETE' THEN
        INSERT INTO audit_log (
            table_name,
            record_id,
            operation,
            old_values,
            employee_id,
            ip_address
        ) VALUES (
            TG_TABLE_NAME,
            v_record_id,
            'DELETE',
            row_to_json(OLD)::JSONB,
            v_employee_id,
            inet_client_addr()
        );
        RETURN OLD;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit_log (
            table_name,
            record_id,
            operation,
            old_values,
            new_values,
            employee_id,
            ip_address
        ) VALUES (
            TG_TABLE_NAME,
            v_record_id,
            'UPDATE',
            row_to_json(OLD)::JSONB,
            row_to_json(NEW)::JSONB,
            v_employee_id,
            inet_client_addr()
        );
        RETURN NEW;

    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO audit_log (
            table_name,
            record_id,
            operation,
            new_values,
            employee_id,
            ip_address
        ) VALUES (
            TG_TABLE_NAME,
            v_record_id,
            'INSERT',
            row_to_json(NEW)::JSONB,
            v_employee_id,
            inet_client_addr()
        );
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION audit_trigger IS '通用审计日志触发器-记录所有增删改操作';

-- 为关键表创建审计触发器
DO $$
DECLARE
    table_name_var TEXT;
BEGIN
    FOR table_name_var IN
        SELECT table_name
        FROM unnest(ARRAY[
            'product', 'recipe', 'recipe_item',
            'purchase_order', 'sales_order',
            'inventory_transaction', 'employee'
        ]) AS table_name
    LOOP
        EXECUTE format('
            DROP TRIGGER IF EXISTS trg_audit_%I ON %I;
            CREATE TRIGGER trg_audit_%I
            AFTER INSERT OR UPDATE OR DELETE ON %I
            FOR EACH ROW EXECUTE FUNCTION audit_trigger();
        ', table_name_var, table_name_var, table_name_var, table_name_var);
    END LOOP;
END $$;

-- ============================================================================
-- 第八部分: 权限控制函数
-- ============================================================================

-- 检查员工权限
CREATE OR REPLACE FUNCTION check_permission(
    p_employee_id INT,
    p_permission_code VARCHAR,
    p_store_id INT DEFAULT NULL
)
RETURNS BOOLEAN AS $$
DECLARE
    v_has_permission BOOLEAN;
BEGIN
    SELECT EXISTS (
        SELECT 1
        FROM employee_role er
        JOIN role_permission rp ON er.role_id = rp.role_id
        JOIN permission perm ON rp.permission_id = perm.permission_id
        WHERE er.employee_id = p_employee_id
          AND perm.permission_code = p_permission_code
          AND er.is_active = TRUE
          AND (er.effective_date IS NULL OR er.effective_date <= CURRENT_DATE)
          AND (er.expiry_date IS NULL OR er.expiry_date >= CURRENT_DATE)
          AND (er.scope_type = 'global'
               OR (er.scope_type = 'store' AND er.scope_id = p_store_id))
    ) INTO v_has_permission;

    RETURN v_has_permission;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION check_permission IS '检查员工权限-支持门店级数据隔离';

-- 获取员工可访问的门店列表
CREATE OR REPLACE FUNCTION get_accessible_stores(p_employee_id INT)
RETURNS TABLE (
    store_id INT,
    store_code VARCHAR,
    store_name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        s.store_id,
        s.store_code,
        s.store_name
    FROM employee_role er
    JOIN store s ON (
        er.scope_type = 'global'
        OR (er.scope_type = 'store' AND er.scope_id = s.store_id)
        OR (er.scope_type = 'brand' AND er.scope_id = s.brand_id)
    )
    WHERE er.employee_id = p_employee_id
      AND er.is_active = TRUE
      AND s.is_active = TRUE
    GROUP BY s.store_id, s.store_code, s.store_name
    ORDER BY s.store_code;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION get_accessible_stores IS '获取员工可访问的门店列表';

-- ============================================================================
-- 第九部分: 促销效果分析函数
-- ============================================================================

-- 促销方案模拟函数
CREATE OR REPLACE FUNCTION simulate_promotion(
    p_product_id INT,
    p_current_price DECIMAL,
    p_discount_rate DECIMAL
)
RETURNS TABLE (
    折后价格 DECIMAL,
    预测实际成本率 DECIMAL,
    预测实际毛利率 DECIMAL,
    利润侵蚀程度 DECIMAL,
    保本销量 INT,
    决策建议 VARCHAR
) AS $$
DECLARE
    v_cost DECIMAL;
    v_standard_margin DECIMAL;
BEGIN
    -- 获取产品成本
    SELECT calculate_product_total_cost(p_product_id) INTO v_cost;

    IF v_cost IS NULL OR v_cost = 0 THEN
        RAISE EXCEPTION '产品%无有效配方成本', p_product_id;
    END IF;

    -- 计算标准毛利率
    v_standard_margin := (p_current_price - v_cost) / p_current_price * 100;

    RETURN QUERY
    SELECT
        (p_current_price * (1 - p_discount_rate / 100))::DECIMAL AS 折后价格,
        (v_cost / (p_current_price * (1 - p_discount_rate / 100)) * 100)::DECIMAL AS 预测实际成本率,
        (((p_current_price * (1 - p_discount_rate / 100)) - v_cost) /
         (p_current_price * (1 - p_discount_rate / 100)) * 100)::DECIMAL AS 预测实际毛利率,
        (v_standard_margin -
         ((p_current_price * (1 - p_discount_rate / 100) - v_cost) /
          (p_current_price * (1 - p_discount_rate / 100)) * 100))::DECIMAL AS 利润侵蚀程度,
        CEIL(1000 / NULLIF(p_current_price * (1 - p_discount_rate / 100) - v_cost, 0))::INT AS 保本销量,
        CASE
            WHEN ((p_current_price * (1 - p_discount_rate / 100) - v_cost) /
                  (p_current_price * (1 - p_discount_rate / 100)) * 100) < 30 THEN 'reject'
            WHEN (v_standard_margin -
                  ((p_current_price * (1 - p_discount_rate / 100) - v_cost) /
                   (p_current_price * (1 - p_discount_rate / 100)) * 100)) > 15 THEN 'revise'
            ELSE 'approve'
        END::VARCHAR AS 决策建议;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION simulate_promotion IS '促销方案模拟-预测促销对成本率和利润的影响';

-- ============================================================================
-- 完成函数与触发器创建
-- ============================================================================

-- 输出统计信息
DO $$
DECLARE
    function_count INT;
    trigger_count INT;
BEGIN
    SELECT COUNT(*) INTO function_count
    FROM information_schema.routines
    WHERE routine_schema = 'public'
      AND routine_type = 'FUNCTION';

    SELECT COUNT(*) INTO trigger_count
    FROM information_schema.triggers
    WHERE trigger_schema = 'public';

    RAISE NOTICE '✓ 核心业务函数与触发器创建完成!';
    RAISE NOTICE '  - 函数数量: %', function_count;
    RAISE NOTICE '  - 触发器数量: %', trigger_count;
END $$;

-- 授权设置 (根据实际角色调整)
-- GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA public TO role_finance_manager;
-- GRANT EXECUTE ON FUNCTION decrypt_cost TO role_finance_manager;
-- REVOKE EXECUTE ON FUNCTION decrypt_cost FROM role_waiter;
