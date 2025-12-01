-- ============================================================================
-- 野百灵餐饮集团 - 门店采购价格记录表
-- ============================================================================
-- 版本: v1.0.0
-- 创建日期: 2025-11-25
-- 用途: 记录各门店的实际采购价格，支持纵向/横向价格对比分析
--
-- 核心功能:
-- 1. 纵向比对: 实际采购价 vs 标准核定价
-- 2. 横向比对: 不同门店同一SKU的采购价格
-- 3. 基础单位价格换算: 统一换算到元/g便于比对
-- 4. 价格差异自动计算: 触发器自动计算差异率
-- ============================================================================

-- ----------------------------------------------------------------------------
-- store_purchase_price - 门店采购价格记录表
-- ----------------------------------------------------------------------------
CREATE TABLE store_purchase_price (
    price_id BIGSERIAL PRIMARY KEY,

    -- ═══════════════════════════════════════════════════════════════════════
    -- 关联维度
    -- ═══════════════════════════════════════════════════════════════════════
    store_id INT NOT NULL,                        -- 门店ID
    sku_id INT NOT NULL,                          -- SKU规格ID（关联product_sku）
    supplier_id INT,                              -- 供应商ID（可选）

    -- ═══════════════════════════════════════════════════════════════════════
    -- 时间维度
    -- ═══════════════════════════════════════════════════════════════════════
    price_date DATE NOT NULL,                     -- 价格日期

    -- ═══════════════════════════════════════════════════════════════════════
    -- 采购价格数据
    -- ═══════════════════════════════════════════════════════════════════════
    purchase_price DECIMAL(10,4) NOT NULL,        -- 采购单价（按采购单位）
    purchase_unit_id INT NOT NULL,                -- 采购单位(斤/kg/袋等)
    purchase_quantity DECIMAL(10,3),              -- 采购数量（可选）

    -- 换算到基础单位
    base_unit_price DECIMAL(10,6),                -- 基础单位价格(元/g 或 元/ml)
    base_unit_id INT,                             -- 基础单位(g/ml/piece)

    -- ═══════════════════════════════════════════════════════════════════════
    -- 标准价对比（自动计算）
    -- ═══════════════════════════════════════════════════════════════════════
    standard_price DECIMAL(10,4),                 -- 标准核定价（元/基础单位）
    price_variance DECIMAL(10,4),                 -- 价格差异 = 采购价 - 标准价
    variance_rate DECIMAL(6,2),                   -- 差异率(%) = (采购价-标准价)/标准价×100

    -- 差异分级（自动计算）
    variance_level VARCHAR(20),                   -- 差异等级: critical/high/medium/normal/low

    -- ═══════════════════════════════════════════════════════════════════════
    -- 来源信息
    -- ═══════════════════════════════════════════════════════════════════════
    source_type VARCHAR(30) DEFAULT 'manual_input'
        CHECK (source_type IN (
            'manual_input',       -- 手动录入
            'invoice_scan',       -- 发票扫描
            'purchase_order',     -- 采购订单同步
            'spreadsheet_import', -- 表格导入
            'supplier_quote'      -- 供应商报价
        )),

    -- 附加信息
    package_spec VARCHAR(200),                    -- 包装规格（冗余存储便于查询）
    brand_name VARCHAR(100),                      -- 品牌名称
    batch_number VARCHAR(100),                    -- 批次号

    -- ═══════════════════════════════════════════════════════════════════════
    -- 状态与审核
    -- ═══════════════════════════════════════════════════════════════════════
    status VARCHAR(20) DEFAULT 'pending'
        CHECK (status IN (
            'pending',    -- 待审核
            'approved',   -- 已审核
            'rejected',   -- 已拒绝
            'archived'    -- 已归档
        )),

    -- 审核信息
    approved_by INT,
    approved_at TIMESTAMP,
    rejection_reason TEXT,

    -- 备注
    notes TEXT,

    -- ═══════════════════════════════════════════════════════════════════════
    -- 审计字段
    -- ═══════════════════════════════════════════════════════════════════════
    created_by INT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_by INT,
    updated_at TIMESTAMP,

    -- ═══════════════════════════════════════════════════════════════════════
    -- 外键约束
    -- ═══════════════════════════════════════════════════════════════════════
    CONSTRAINT fk_spp_store
        FOREIGN KEY (store_id)
        REFERENCES store(store_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_spp_sku
        FOREIGN KEY (sku_id)
        REFERENCES product_sku(sku_id)
        ON DELETE RESTRICT,

    CONSTRAINT fk_spp_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id),

    CONSTRAINT fk_spp_purchase_unit
        FOREIGN KEY (purchase_unit_id)
        REFERENCES unit_of_measure(unit_id),

    CONSTRAINT fk_spp_base_unit
        FOREIGN KEY (base_unit_id)
        REFERENCES unit_of_measure(unit_id),

    CONSTRAINT fk_spp_approved_by
        FOREIGN KEY (approved_by)
        REFERENCES employee(employee_id),

    CONSTRAINT fk_spp_created_by
        FOREIGN KEY (created_by)
        REFERENCES employee(employee_id),

    CONSTRAINT fk_spp_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES employee(employee_id),

    -- ═══════════════════════════════════════════════════════════════════════
    -- 唯一约束
    -- ═══════════════════════════════════════════════════════════════════════
    -- 同一门店+SKU+日期只能有一条记录
    CONSTRAINT uk_store_sku_date
        UNIQUE (store_id, sku_id, price_date),

    -- ═══════════════════════════════════════════════════════════════════════
    -- 检查约束
    -- ═══════════════════════════════════════════════════════════════════════
    CONSTRAINT ck_purchase_price_positive
        CHECK (purchase_price > 0),

    CONSTRAINT ck_purchase_quantity_positive
        CHECK (purchase_quantity IS NULL OR purchase_quantity > 0)
);

-- ----------------------------------------------------------------------------
-- 索引优化
-- ----------------------------------------------------------------------------
-- 按门店+日期查询（最常用）
CREATE INDEX idx_spp_store_date ON store_purchase_price(store_id, price_date DESC);

-- 按SKU查询
CREATE INDEX idx_spp_sku ON store_purchase_price(sku_id);

-- 按供应商查询
CREATE INDEX idx_spp_supplier ON store_purchase_price(supplier_id)
    WHERE supplier_id IS NOT NULL;

-- 按差异率筛选异常价格
CREATE INDEX idx_spp_variance ON store_purchase_price(variance_rate)
    WHERE variance_rate IS NOT NULL;

-- 按差异等级筛选
CREATE INDEX idx_spp_variance_level ON store_purchase_price(variance_level)
    WHERE variance_level IN ('critical', 'high');

-- 按日期范围查询
CREATE INDEX idx_spp_date ON store_purchase_price(price_date DESC);

-- 按状态筛选
CREATE INDEX idx_spp_status ON store_purchase_price(status);

-- 复合索引：SKU+日期（用于横向对比）
CREATE INDEX idx_spp_sku_date ON store_purchase_price(sku_id, price_date DESC);

-- ----------------------------------------------------------------------------
-- 注释说明
-- ----------------------------------------------------------------------------
COMMENT ON TABLE store_purchase_price IS
    '门店采购价格记录表 - 记录各门店的实际采购价格，支持价格对比分析和异常检测';

COMMENT ON COLUMN store_purchase_price.sku_id IS
    'SKU规格ID - 关联product_sku表，支持同一原材料不同规格的价格记录';

COMMENT ON COLUMN store_purchase_price.purchase_price IS
    '采购单价 - 按采购单位计算的价格';

COMMENT ON COLUMN store_purchase_price.base_unit_price IS
    '基础单位价格 - 换算到元/g或元/ml，便于跨规格、跨门店比对';

COMMENT ON COLUMN store_purchase_price.standard_price IS
    '标准核定价 - 从product表同步，用于纵向对比';

COMMENT ON COLUMN store_purchase_price.variance_rate IS
    '差异率(%) - 自动计算：(采购价-标准价)/标准价×100';

COMMENT ON COLUMN store_purchase_price.variance_level IS
    '差异等级 - critical(>20%)/high(15-20%)/medium(10-15%)/normal(5-10%)/low(<5%)';

COMMENT ON COLUMN store_purchase_price.source_type IS
    '数据来源类型 - 用于追溯和区分不同录入渠道';

-- ============================================================================
-- 辅助函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 函数：计算基础单位价格
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calc_base_unit_price(
    p_purchase_price DECIMAL(10,4),
    p_purchase_unit_id INT,
    p_sku_id INT
) RETURNS DECIMAL(10,6) AS $$
DECLARE
    v_base_unit_quantity DECIMAL(10,3);
    v_conversion_factor DECIMAL(10,4);
    v_base_unit_price DECIMAL(10,6);
BEGIN
    -- 从SKU获取基础单位数量
    SELECT base_unit_quantity INTO v_base_unit_quantity
    FROM product_sku
    WHERE sku_id = p_sku_id;

    -- 如果SKU有基础单位数量，直接计算
    IF v_base_unit_quantity IS NOT NULL AND v_base_unit_quantity > 0 THEN
        v_base_unit_price := p_purchase_price / v_base_unit_quantity;
        RETURN v_base_unit_price;
    END IF;

    -- 否则尝试从单位换算表获取换算系数
    SELECT conversion_factor INTO v_conversion_factor
    FROM unit_conversion
    WHERE from_unit_id = p_purchase_unit_id
      AND product_id IS NULL  -- 通用换算规则
    LIMIT 1;

    IF v_conversion_factor IS NOT NULL AND v_conversion_factor > 0 THEN
        v_base_unit_price := p_purchase_price / v_conversion_factor;
        RETURN v_base_unit_price;
    END IF;

    -- 无法计算时返回NULL
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION calc_base_unit_price(DECIMAL, INT, INT) IS
    '计算采购价格的基础单位价格（元/g 或 元/ml）';

-- ----------------------------------------------------------------------------
-- 函数：获取标准价格
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_standard_price(
    p_sku_id INT
) RETURNS DECIMAL(10,4) AS $$
DECLARE
    v_product_id INT;
    v_standard_cost DECIMAL(10,4);
BEGIN
    -- 获取产品ID
    SELECT product_id INTO v_product_id
    FROM product_sku
    WHERE sku_id = p_sku_id;

    -- 从product表获取标准成本（需要解密）
    -- 注意：这里假设已经有解密函数 decrypt_cost
    SELECT
        CASE
            WHEN current_cost_encrypted IS NOT NULL THEN
                pgp_sym_decrypt(
                    current_cost_encrypted,
                    COALESCE(current_setting('app.encryption_key', true), '')
                )::DECIMAL(10,4)
            ELSE NULL
        END
    INTO v_standard_cost
    FROM product
    WHERE product_id = v_product_id;

    RETURN v_standard_cost;
EXCEPTION
    WHEN OTHERS THEN
        -- 解密失败时返回NULL
        RETURN NULL;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION get_standard_price(INT) IS
    '获取SKU对应产品的标准核定价（从product表解密获取）';

-- ----------------------------------------------------------------------------
-- 函数：计算差异等级
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calc_variance_level(
    p_variance_rate DECIMAL(6,2)
) RETURNS VARCHAR(20) AS $$
BEGIN
    IF p_variance_rate IS NULL THEN
        RETURN NULL;
    END IF;

    -- 根据差异率绝对值判断等级
    IF ABS(p_variance_rate) > 20 THEN
        RETURN 'critical';   -- 严重异常 >20%
    ELSIF ABS(p_variance_rate) > 15 THEN
        RETURN 'high';       -- 高度偏离 15-20%
    ELSIF ABS(p_variance_rate) > 10 THEN
        RETURN 'medium';     -- 中度偏离 10-15%
    ELSIF ABS(p_variance_rate) > 5 THEN
        RETURN 'normal';     -- 轻度偏离 5-10%
    ELSE
        RETURN 'low';        -- 正常范围 <5%
    END IF;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION calc_variance_level(DECIMAL) IS
    '根据差异率计算差异等级';

-- ============================================================================
-- 触发器
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 触发器：插入/更新时自动计算相关字段
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION trg_spp_auto_calculate()
RETURNS TRIGGER AS $$
DECLARE
    v_base_unit_price DECIMAL(10,6);
    v_standard_price DECIMAL(10,4);
    v_variance DECIMAL(10,4);
    v_variance_rate DECIMAL(6,2);
    v_base_unit_id INT;
    v_package_spec VARCHAR(200);
    v_brand_name VARCHAR(100);
BEGIN
    -- 1. 计算基础单位价格
    v_base_unit_price := calc_base_unit_price(
        NEW.purchase_price,
        NEW.purchase_unit_id,
        NEW.sku_id
    );
    NEW.base_unit_price := v_base_unit_price;

    -- 2. 获取基础单位ID（从SKU获取产品的基础单位）
    SELECT p.base_unit_id INTO v_base_unit_id
    FROM product_sku s
    JOIN product p ON s.product_id = p.product_id
    WHERE s.sku_id = NEW.sku_id;
    NEW.base_unit_id := v_base_unit_id;

    -- 3. 获取标准价格
    v_standard_price := get_standard_price(NEW.sku_id);
    NEW.standard_price := v_standard_price;

    -- 4. 计算价格差异和差异率
    IF v_standard_price IS NOT NULL AND v_standard_price > 0 AND v_base_unit_price IS NOT NULL THEN
        v_variance := v_base_unit_price - v_standard_price;
        v_variance_rate := (v_variance / v_standard_price) * 100;

        NEW.price_variance := v_variance;
        NEW.variance_rate := ROUND(v_variance_rate, 2);
        NEW.variance_level := calc_variance_level(NEW.variance_rate);
    END IF;

    -- 5. 从SKU同步包装规格和品牌（如果未填写）
    IF NEW.package_spec IS NULL OR NEW.brand_name IS NULL THEN
        SELECT package_spec, brand_name
        INTO v_package_spec, v_brand_name
        FROM product_sku
        WHERE sku_id = NEW.sku_id;

        IF NEW.package_spec IS NULL THEN
            NEW.package_spec := v_package_spec;
        END IF;
        IF NEW.brand_name IS NULL THEN
            NEW.brand_name := v_brand_name;
        END IF;
    END IF;

    -- 6. 更新时间戳
    IF TG_OP = 'UPDATE' THEN
        NEW.updated_at := NOW();
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_spp_before_insert_update
    BEFORE INSERT OR UPDATE ON store_purchase_price
    FOR EACH ROW
    EXECUTE FUNCTION trg_spp_auto_calculate();

-- ============================================================================
-- 脚本完成
-- ============================================================================
--
-- 使用示例:
--
-- 1. 录入一条采购价格记录:
-- INSERT INTO store_purchase_price (
--     store_id, sku_id, price_date,
--     purchase_price, purchase_unit_id,
--     source_type, created_by
-- ) VALUES (
--     1,                    -- 德阳店
--     101,                  -- 盐-大袋25kg SKU
--     '2025-11-25',
--     75.00,                -- 75元/袋
--     5,                    -- 袋
--     'manual_input',
--     1
-- );
-- -- 系统自动计算: base_unit_price, standard_price, variance_rate, variance_level
--
-- 2. 查询某门店的价格异常:
-- SELECT * FROM store_purchase_price
-- WHERE store_id = 1 AND variance_level IN ('critical', 'high')
-- ORDER BY price_date DESC;
--
-- 3. 查询某SKU在所有门店的价格对比:
-- SELECT
--     s.store_name,
--     spp.purchase_price,
--     spp.base_unit_price,
--     spp.variance_rate,
--     spp.variance_level
-- FROM store_purchase_price spp
-- JOIN store s ON spp.store_id = s.store_id
-- WHERE spp.sku_id = 101
--   AND spp.price_date = '2025-11-25'
-- ORDER BY spp.base_unit_price;
--
-- ============================================================================
