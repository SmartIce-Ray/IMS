-- ============================================================================
-- 野百灵餐饮集团 - 价格计算触发器
-- ============================================================================
-- 版本: v1.0.0
-- 创建日期: 2025-11-25
-- 用途: 自动计算采购价格相关字段，支持价格对比分析
--
-- 包含触发器:
-- 1. 单位换算与基础价格计算
-- 2. 标准价格同步
-- 3. 差异计算与分级
-- 4. 品类阈值判断
-- ============================================================================

-- ============================================================================
-- 第一部分: 品类预警阈值配置表
-- ============================================================================

-- ----------------------------------------------------------------------------
-- price_variance_threshold - 价格差异阈值配置表
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS price_variance_threshold (
    threshold_id SERIAL PRIMARY KEY,

    -- 品类范围
    category_id INT,                           -- 品类ID（NULL表示全局默认）
    category_name VARCHAR(100),                -- 品类名称（冗余存储）

    -- 上浮阈值
    warning_upper_rate DECIMAL(5,2) DEFAULT 10.00,    -- 警告阈值(%)
    critical_upper_rate DECIMAL(5,2) DEFAULT 20.00,   -- 严重阈值(%)

    -- 下浮阈值
    warning_lower_rate DECIMAL(5,2) DEFAULT -10.00,   -- 警告阈值(%)
    critical_lower_rate DECIMAL(5,2) DEFAULT -20.00,  -- 严重阈值(%)

    -- 状态
    is_active BOOLEAN DEFAULT TRUE,

    -- 审计
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,

    CONSTRAINT fk_threshold_category
        FOREIGN KEY (category_id)
        REFERENCES product_category(category_id)
);

CREATE INDEX idx_threshold_category ON price_variance_threshold(category_id);
CREATE INDEX idx_threshold_active ON price_variance_threshold(is_active) WHERE is_active = TRUE;

COMMENT ON TABLE price_variance_threshold IS
    '价格差异阈值配置表 - 按品类设置不同的预警阈值';

-- ----------------------------------------------------------------------------
-- 初始化默认阈值配置
-- ----------------------------------------------------------------------------
INSERT INTO price_variance_threshold (category_id, category_name, warning_upper_rate, critical_upper_rate, warning_lower_rate, critical_lower_rate)
VALUES
    (NULL, '默认', 10.00, 20.00, -10.00, -20.00)
ON CONFLICT DO NOTHING;

-- ============================================================================
-- 第二部分: 辅助函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 函数：获取品类的预警阈值
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_category_threshold(
    p_category_id INT
) RETURNS TABLE (
    warning_upper DECIMAL(5,2),
    critical_upper DECIMAL(5,2),
    warning_lower DECIMAL(5,2),
    critical_lower DECIMAL(5,2)
) AS $$
BEGIN
    -- 先尝试获取品类特定阈值
    RETURN QUERY
    SELECT
        t.warning_upper_rate,
        t.critical_upper_rate,
        t.warning_lower_rate,
        t.critical_lower_rate
    FROM price_variance_threshold t
    WHERE t.category_id = p_category_id
      AND t.is_active = TRUE
    LIMIT 1;

    -- 如果没有找到，返回默认阈值
    IF NOT FOUND THEN
        RETURN QUERY
        SELECT
            t.warning_upper_rate,
            t.critical_upper_rate,
            t.warning_lower_rate,
            t.critical_lower_rate
        FROM price_variance_threshold t
        WHERE t.category_id IS NULL
          AND t.is_active = TRUE
        LIMIT 1;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- 函数：根据品类和差异率计算差异等级
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calc_variance_level_by_category(
    p_variance_rate DECIMAL(6,2),
    p_sku_id INT
) RETURNS VARCHAR(20) AS $$
DECLARE
    v_category_id INT;
    v_threshold RECORD;
BEGIN
    IF p_variance_rate IS NULL THEN
        RETURN NULL;
    END IF;

    -- 获取SKU对应的品类ID
    SELECT pc.category_id INTO v_category_id
    FROM product_sku ps
    JOIN product p ON ps.product_id = p.product_id
    LEFT JOIN product_category pc ON p.category_id = pc.category_id
    WHERE ps.sku_id = p_sku_id;

    -- 获取阈值
    SELECT * INTO v_threshold
    FROM get_category_threshold(v_category_id);

    -- 根据阈值判断等级
    IF p_variance_rate >= v_threshold.critical_upper THEN
        RETURN 'critical';      -- 严重超标
    ELSIF p_variance_rate >= v_threshold.warning_upper THEN
        RETURN 'high';          -- 超标
    ELSIF p_variance_rate <= v_threshold.critical_lower THEN
        RETURN 'critical_low';  -- 严重偏低
    ELSIF p_variance_rate <= v_threshold.warning_lower THEN
        RETURN 'low';           -- 偏低
    ELSIF p_variance_rate >= 5 THEN
        RETURN 'medium';        -- 轻度偏高
    ELSIF p_variance_rate <= -5 THEN
        RETURN 'medium_low';    -- 轻度偏低
    ELSE
        RETURN 'normal';        -- 正常
    END IF;
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- 函数：获取单位换算系数
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_unit_conversion_factor(
    p_from_unit_id INT,
    p_to_unit_id INT,
    p_product_id INT DEFAULT NULL
) RETURNS DECIMAL(10,4) AS $$
DECLARE
    v_factor DECIMAL(10,4);
BEGIN
    -- 相同单位无需换算
    IF p_from_unit_id = p_to_unit_id THEN
        RETURN 1.0;
    END IF;

    -- 先尝试产品特定换算
    IF p_product_id IS NOT NULL THEN
        SELECT conversion_factor INTO v_factor
        FROM unit_conversion
        WHERE from_unit_id = p_from_unit_id
          AND to_unit_id = p_to_unit_id
          AND product_id = p_product_id;

        IF v_factor IS NOT NULL THEN
            RETURN v_factor;
        END IF;
    END IF;

    -- 使用通用换算
    SELECT conversion_factor INTO v_factor
    FROM unit_conversion
    WHERE from_unit_id = p_from_unit_id
      AND to_unit_id = p_to_unit_id
      AND product_id IS NULL;

    RETURN v_factor;
END;
$$ LANGUAGE plpgsql;

-- ----------------------------------------------------------------------------
-- 函数：获取SKU的基础单位数量
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_sku_base_unit_quantity(
    p_sku_id INT
) RETURNS DECIMAL(10,3) AS $$
DECLARE
    v_quantity DECIMAL(10,3);
BEGIN
    SELECT base_unit_quantity INTO v_quantity
    FROM product_sku
    WHERE sku_id = p_sku_id;

    RETURN COALESCE(v_quantity, 0);
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 第三部分: 核心触发器函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 触发器函数：采购价格自动计算（增强版）
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION trg_purchase_price_auto_calc()
RETURNS TRIGGER AS $$
DECLARE
    v_sku RECORD;
    v_product RECORD;
    v_base_unit_quantity DECIMAL(10,3);
    v_base_unit_price DECIMAL(10,6);
    v_standard_price DECIMAL(10,4);
    v_variance DECIMAL(10,4);
    v_variance_rate DECIMAL(6,2);
    v_conversion_factor DECIMAL(10,4);
BEGIN
    -- 1. 获取SKU信息
    SELECT
        ps.sku_id,
        ps.product_id,
        ps.sku_name,
        ps.package_spec,
        ps.package_quantity,
        ps.base_unit_quantity,
        ps.brand_name,
        ps.default_supplier_id
    INTO v_sku
    FROM product_sku ps
    WHERE ps.sku_id = NEW.sku_id;

    -- 2. 获取产品信息
    SELECT
        p.product_id,
        p.product_name,
        p.category_id,
        p.base_unit_id,
        p.current_cost_encrypted
    INTO v_product
    FROM product p
    WHERE p.product_id = v_sku.product_id;

    -- 3. 计算基础单位价格
    v_base_unit_quantity := COALESCE(v_sku.base_unit_quantity, 0);

    IF v_base_unit_quantity > 0 THEN
        -- 如果SKU有基础单位数量，直接计算
        v_base_unit_price := NEW.purchase_price / v_base_unit_quantity;
    ELSE
        -- 尝试使用单位换算
        v_conversion_factor := get_unit_conversion_factor(
            NEW.purchase_unit_id,
            v_product.base_unit_id,
            v_product.product_id
        );

        IF v_conversion_factor IS NOT NULL AND v_conversion_factor > 0 THEN
            v_base_unit_price := NEW.purchase_price / v_conversion_factor;
        END IF;
    END IF;

    NEW.base_unit_price := v_base_unit_price;
    NEW.base_unit_id := v_product.base_unit_id;

    -- 4. 获取标准价格（从product表解密）
    BEGIN
        IF v_product.current_cost_encrypted IS NOT NULL THEN
            v_standard_price := pgp_sym_decrypt(
                v_product.current_cost_encrypted,
                COALESCE(current_setting('app.encryption_key', true), '')
            )::DECIMAL(10,4);
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            v_standard_price := NULL;
    END;

    NEW.standard_price := v_standard_price;

    -- 5. 计算价格差异
    IF v_standard_price IS NOT NULL AND v_standard_price > 0 AND v_base_unit_price IS NOT NULL THEN
        v_variance := v_base_unit_price - v_standard_price;
        v_variance_rate := (v_variance / v_standard_price) * 100;

        NEW.price_variance := v_variance;
        NEW.variance_rate := ROUND(v_variance_rate, 2);

        -- 6. 计算差异等级（考虑品类阈值）
        NEW.variance_level := calc_variance_level_by_category(NEW.variance_rate, NEW.sku_id);
    END IF;

    -- 7. 同步SKU的包装规格和品牌（如果未填写）
    IF NEW.package_spec IS NULL THEN
        NEW.package_spec := v_sku.package_spec;
    END IF;

    IF NEW.brand_name IS NULL THEN
        NEW.brand_name := v_sku.brand_name;
    END IF;

    -- 8. 更新时间戳
    IF TG_OP = 'UPDATE' THEN
        NEW.updated_at := NOW();
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 删除旧触发器（如果存在）并创建新触发器
DROP TRIGGER IF EXISTS trg_spp_before_insert_update ON store_purchase_price;

CREATE TRIGGER trg_spp_auto_calc
    BEFORE INSERT OR UPDATE ON store_purchase_price
    FOR EACH ROW
    EXECUTE FUNCTION trg_purchase_price_auto_calc();

-- ============================================================================
-- 第四部分: SKU表触发器
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 触发器函数：SKU参考价格自动计算基础单位价格
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION trg_sku_calc_base_price()
RETURNS TRIGGER AS $$
BEGIN
    -- 如果有参考价格和基础单位数量，自动计算基础单位价格
    IF NEW.reference_price IS NOT NULL
       AND NEW.base_unit_quantity IS NOT NULL
       AND NEW.base_unit_quantity > 0 THEN
        NEW.reference_base_unit_price := NEW.reference_price / NEW.base_unit_quantity;
    END IF;

    -- 更新时间戳
    IF TG_OP = 'UPDATE' THEN
        NEW.updated_at := NOW();
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 创建触发器
DROP TRIGGER IF EXISTS trg_sku_auto_calc_base_price ON product_sku;

CREATE TRIGGER trg_sku_calc_base_price
    BEFORE INSERT OR UPDATE ON product_sku
    FOR EACH ROW
    EXECUTE FUNCTION trg_sku_calc_base_price();

-- ============================================================================
-- 第五部分: 辅助存储过程
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 过程：批量更新标准价格差异（当标准价格变动时调用）
-- ----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE refresh_price_variance(
    p_product_id INT DEFAULT NULL
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_affected_count INT;
BEGIN
    -- 更新所有相关记录的标准价格和差异
    UPDATE store_purchase_price spp
    SET
        standard_price = (
            SELECT
                CASE
                    WHEN p.current_cost_encrypted IS NOT NULL THEN
                        pgp_sym_decrypt(
                            p.current_cost_encrypted,
                            COALESCE(current_setting('app.encryption_key', true), '')
                        )::DECIMAL(10,4)
                    ELSE NULL
                END
            FROM product_sku ps
            JOIN product p ON ps.product_id = p.product_id
            WHERE ps.sku_id = spp.sku_id
        ),
        price_variance = NULL,  -- 触发器会重新计算
        variance_rate = NULL,
        variance_level = NULL,
        updated_at = NOW()
    WHERE (p_product_id IS NULL
           OR EXISTS (
               SELECT 1 FROM product_sku ps
               WHERE ps.sku_id = spp.sku_id AND ps.product_id = p_product_id
           ));

    GET DIAGNOSTICS v_affected_count = ROW_COUNT;

    RAISE NOTICE '已更新 % 条采购价格记录的标准价格差异', v_affected_count;
END;
$$;

-- ----------------------------------------------------------------------------
-- 过程：重新计算所有价格差异（数据修复用）
-- ----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE recalc_all_variance()
LANGUAGE plpgsql
AS $$
DECLARE
    v_rec RECORD;
    v_count INT := 0;
BEGIN
    -- 遍历所有采购价格记录，触发重新计算
    FOR v_rec IN
        SELECT price_id FROM store_purchase_price
    LOOP
        UPDATE store_purchase_price
        SET updated_at = NOW()  -- 触发触发器重新计算
        WHERE price_id = v_rec.price_id;

        v_count := v_count + 1;

        -- 每1000条提交一次
        IF v_count % 1000 = 0 THEN
            RAISE NOTICE '已处理 % 条记录...', v_count;
        END IF;
    END LOOP;

    RAISE NOTICE '完成，共处理 % 条记录', v_count;
END;
$$;

-- ============================================================================
-- 第六部分: 预警阈值管理函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 函数：设置品类预警阈值
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION set_category_threshold(
    p_category_id INT,
    p_category_name VARCHAR(100),
    p_warning_upper DECIMAL(5,2),
    p_critical_upper DECIMAL(5,2),
    p_warning_lower DECIMAL(5,2),
    p_critical_lower DECIMAL(5,2)
) RETURNS BOOLEAN AS $$
BEGIN
    -- 使用UPSERT
    INSERT INTO price_variance_threshold (
        category_id, category_name,
        warning_upper_rate, critical_upper_rate,
        warning_lower_rate, critical_lower_rate
    ) VALUES (
        p_category_id, p_category_name,
        p_warning_upper, p_critical_upper,
        p_warning_lower, p_critical_lower
    )
    ON CONFLICT (category_id) DO UPDATE SET
        category_name = EXCLUDED.category_name,
        warning_upper_rate = EXCLUDED.warning_upper_rate,
        critical_upper_rate = EXCLUDED.critical_upper_rate,
        warning_lower_rate = EXCLUDED.warning_lower_rate,
        critical_lower_rate = EXCLUDED.critical_lower_rate,
        updated_at = NOW();

    RETURN TRUE;
END;
$$ LANGUAGE plpgsql;

-- ============================================================================
-- 初始化品类阈值（根据计划文档中的建议值）
-- ============================================================================

-- 插入品类特定阈值
-- 注意：需要先有对应的品类记录，此处使用品类名称匹配
DO $$
DECLARE
    v_meat_category_id INT;
    v_seafood_category_id INT;
    v_vegetable_category_id INT;
    v_dry_goods_category_id INT;
    v_oil_category_id INT;
BEGIN
    -- 获取品类ID（如果存在）
    SELECT category_id INTO v_meat_category_id FROM product_category WHERE category_name LIKE '%肉%' LIMIT 1;
    SELECT category_id INTO v_seafood_category_id FROM product_category WHERE category_name LIKE '%海鲜%' LIMIT 1;
    SELECT category_id INTO v_vegetable_category_id FROM product_category WHERE category_name LIKE '%蔬菜%' LIMIT 1;
    SELECT category_id INTO v_dry_goods_category_id FROM product_category WHERE category_name LIKE '%干%' OR category_name LIKE '%调料%' LIMIT 1;
    SELECT category_id INTO v_oil_category_id FROM product_category WHERE category_name LIKE '%油%' LIMIT 1;

    -- 肉类: 上浮15%警告，下浮10%警告
    IF v_meat_category_id IS NOT NULL THEN
        PERFORM set_category_threshold(v_meat_category_id, '肉类', 15.00, 25.00, -10.00, -15.00);
    END IF;

    -- 海鲜: 上浮20%警告（波动最大）
    IF v_seafood_category_id IS NOT NULL THEN
        PERFORM set_category_threshold(v_seafood_category_id, '海鲜', 20.00, 30.00, -15.00, -25.00);
    END IF;

    -- 蔬菜: 上浮25%警告（受季节影响大）
    IF v_vegetable_category_id IS NOT NULL THEN
        PERFORM set_category_threshold(v_vegetable_category_id, '蔬菜', 25.00, 35.00, -20.00, -30.00);
    END IF;

    -- 干杂/调料: 上浮10%警告（相对稳定）
    IF v_dry_goods_category_id IS NOT NULL THEN
        PERFORM set_category_threshold(v_dry_goods_category_id, '干杂/调料', 10.00, 15.00, -5.00, -10.00);
    END IF;

    -- 油类: 上浮10%警告（相对稳定）
    IF v_oil_category_id IS NOT NULL THEN
        PERFORM set_category_threshold(v_oil_category_id, '油类', 10.00, 15.00, -5.00, -10.00);
    END IF;

    RAISE NOTICE '品类阈值初始化完成';
END $$;

-- ============================================================================
-- 脚本完成
-- ============================================================================
--
-- 使用说明:
--
-- 1. 价格录入时自动计算:
--    - base_unit_price (基础单位价格)
--    - standard_price (标准价格)
--    - price_variance (价格差异)
--    - variance_rate (差异率)
--    - variance_level (差异等级)
--
-- 2. 手动刷新所有价格差异:
--    CALL refresh_price_variance();
--
-- 3. 刷新特定产品的价格差异:
--    CALL refresh_price_variance(123);  -- 产品ID
--
-- 4. 设置品类阈值:
--    SELECT set_category_threshold(1, '肉类', 15.00, 25.00, -10.00, -15.00);
--
-- 5. 查询品类阈值:
--    SELECT * FROM get_category_threshold(1);
--
-- ============================================================================
