-- ============================================================================
-- 野百灵餐饮集团 - 产品SKU规格表
-- ============================================================================
-- 版本: v1.0.0
-- 创建日期: 2025-11-25
-- 用途: 支持同一原材料的多规格管理（如：盐-小袋500g、盐-大袋25kg）
--
-- 设计原则:
-- 1. 每个原材料(product)至少有一个默认SKU(is_default=TRUE)
-- 2. 发现新规格时按需添加新SKU
-- 3. 采购价格表(store_purchase_price)关联到SKU级别
-- 4. 所有价格换算到基础单位(元/g 或 元/ml)便于跨规格比对
-- ============================================================================

-- ----------------------------------------------------------------------------
-- product_sku - 产品SKU规格表
-- ----------------------------------------------------------------------------
CREATE TABLE product_sku (
    sku_id SERIAL PRIMARY KEY,

    -- 关联基础原材料
    product_id INT NOT NULL,

    -- SKU标识
    sku_code VARCHAR(50) UNIQUE NOT NULL,     -- SKU编码(如 RM-101-SKU-01)
    sku_name VARCHAR(200) NOT NULL,           -- 规格名称(如"盐-大袋25kg")

    -- 包装规格
    package_spec VARCHAR(200),                -- 规格描述(如"25kg/袋")
    package_quantity DECIMAL(10,3),           -- 每包装含量数值(如25000)
    package_unit_id INT,                      -- 包装单位(袋/桶/箱等)
    base_unit_quantity DECIMAL(10,3),         -- 换算后基础单位数量(g/ml/piece)

    -- 供应商/品牌
    default_supplier_id INT,                  -- 默认供应商
    brand_name VARCHAR(100),                  -- 品牌名称（如"中盐"）

    -- 状态标记
    is_default BOOLEAN DEFAULT FALSE,         -- 是否默认SKU（首选规格）
    is_active BOOLEAN DEFAULT TRUE,           -- 是否启用

    -- 参考价格（可选，便于快速查询）
    reference_price DECIMAL(10,4),            -- 参考采购价格
    reference_price_unit_id INT,              -- 参考价格单位
    reference_base_unit_price DECIMAL(10,6),  -- 参考基础单位价格(元/g)

    -- 排序
    sort_order INT DEFAULT 0,

    -- 备注
    notes TEXT,

    -- 审计字段
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT,

    -- 外键约束
    CONSTRAINT fk_sku_product
        FOREIGN KEY (product_id)
        REFERENCES product(product_id)
        ON DELETE RESTRICT,
    CONSTRAINT fk_sku_package_unit
        FOREIGN KEY (package_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_sku_supplier
        FOREIGN KEY (default_supplier_id)
        REFERENCES supplier(supplier_id),
    CONSTRAINT fk_sku_ref_price_unit
        FOREIGN KEY (reference_price_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_sku_created_by
        FOREIGN KEY (created_by)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_sku_updated_by
        FOREIGN KEY (updated_by)
        REFERENCES employee(employee_id)
);

-- ----------------------------------------------------------------------------
-- 索引优化
-- ----------------------------------------------------------------------------
-- 按产品查询SKU列表
CREATE INDEX idx_sku_product ON product_sku(product_id);

-- 按SKU编码查询
CREATE INDEX idx_sku_code ON product_sku(sku_code);

-- 查询活跃的默认SKU
CREATE INDEX idx_sku_default ON product_sku(product_id, is_default)
    WHERE is_default = TRUE AND is_active = TRUE;

-- 按供应商查询
CREATE INDEX idx_sku_supplier ON product_sku(default_supplier_id)
    WHERE default_supplier_id IS NOT NULL;

-- 按品牌查询
CREATE INDEX idx_sku_brand ON product_sku(brand_name)
    WHERE brand_name IS NOT NULL;

-- 按状态筛选
CREATE INDEX idx_sku_active ON product_sku(is_active)
    WHERE is_active = TRUE;

-- ----------------------------------------------------------------------------
-- 注释说明
-- ----------------------------------------------------------------------------
COMMENT ON TABLE product_sku IS
    '产品SKU规格表 - 支持同一原材料的多规格管理，采购价格关联到SKU级别';

COMMENT ON COLUMN product_sku.sku_code IS
    'SKU编码，格式：{产品编码}-SKU-{序号}，如 RM-SALT-SKU-01';

COMMENT ON COLUMN product_sku.sku_name IS
    'SKU规格名称，如"盐-大袋25kg"、"盐-小袋500g"';

COMMENT ON COLUMN product_sku.package_spec IS
    '包装规格描述，如"25kg/袋"、"5L/桶"';

COMMENT ON COLUMN product_sku.package_quantity IS
    '每包装含量数值，如25000(表示25kg=25000g)';

COMMENT ON COLUMN product_sku.base_unit_quantity IS
    '换算后的基础单位数量，用于统一比对(g/ml/piece)';

COMMENT ON COLUMN product_sku.is_default IS
    '是否默认SKU - 每个原材料至少有一个默认SKU，用于日常采购';

COMMENT ON COLUMN product_sku.reference_base_unit_price IS
    '参考基础单位价格(元/g)，用于快速比对不同规格';

-- ----------------------------------------------------------------------------
-- 约束：确保每个产品至少有一个活跃的默认SKU
-- ----------------------------------------------------------------------------
-- 注：此约束通过触发器实现，避免复杂的表级约束

-- ----------------------------------------------------------------------------
-- 函数：生成SKU编码
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION generate_sku_code(
    p_product_id INT
) RETURNS VARCHAR(50) AS $$
DECLARE
    v_product_code VARCHAR(50);
    v_sku_count INT;
    v_sku_code VARCHAR(50);
BEGIN
    -- 获取产品编码
    SELECT product_code INTO v_product_code
    FROM product
    WHERE product_id = p_product_id;

    -- 计算已有SKU数量
    SELECT COUNT(*) INTO v_sku_count
    FROM product_sku
    WHERE product_id = p_product_id;

    -- 生成SKU编码
    v_sku_code := v_product_code || '-SKU-' || LPAD((v_sku_count + 1)::TEXT, 2, '0');

    RETURN v_sku_code;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION generate_sku_code(INT) IS
    '根据产品ID自动生成SKU编码';

-- ----------------------------------------------------------------------------
-- 函数：计算基础单位价格
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calculate_sku_base_unit_price(
    p_price DECIMAL(10,4),
    p_price_unit_id INT,
    p_base_unit_quantity DECIMAL(10,3)
) RETURNS DECIMAL(10,6) AS $$
DECLARE
    v_base_unit_price DECIMAL(10,6);
BEGIN
    -- 如果基础单位数量有效，则计算基础单位价格
    IF p_base_unit_quantity IS NOT NULL AND p_base_unit_quantity > 0 THEN
        v_base_unit_price := p_price / p_base_unit_quantity;
    ELSE
        v_base_unit_price := NULL;
    END IF;

    RETURN v_base_unit_price;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION calculate_sku_base_unit_price(DECIMAL, INT, DECIMAL) IS
    '计算SKU的基础单位价格（元/g 或 元/ml）';

-- ----------------------------------------------------------------------------
-- 触发器：更新时间戳
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_sku_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_sku_updated_at
    BEFORE UPDATE ON product_sku
    FOR EACH ROW
    EXECUTE FUNCTION update_sku_timestamp();

-- ----------------------------------------------------------------------------
-- 触发器：自动计算参考基础单位价格
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION auto_calc_sku_base_price()
RETURNS TRIGGER AS $$
BEGIN
    -- 如果有参考价格和基础单位数量，自动计算基础单位价格
    IF NEW.reference_price IS NOT NULL
       AND NEW.base_unit_quantity IS NOT NULL
       AND NEW.base_unit_quantity > 0 THEN
        NEW.reference_base_unit_price := NEW.reference_price / NEW.base_unit_quantity;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_sku_auto_calc_base_price
    BEFORE INSERT OR UPDATE ON product_sku
    FOR EACH ROW
    EXECUTE FUNCTION auto_calc_sku_base_price();

-- ============================================================================
-- 脚本完成
-- ============================================================================
--
-- 使用示例:
--
-- 1. 为原材料"盐"创建两个SKU规格:
-- INSERT INTO product_sku (product_id, sku_code, sku_name, package_spec, package_quantity, base_unit_quantity, is_default)
-- VALUES
--   (101, 'RM-SALT-SKU-01', '盐-小袋500g', '500g/袋', 500, 500, TRUE),
--   (101, 'RM-SALT-SKU-02', '盐-大袋25kg', '25kg/袋', 25000, 25000, FALSE);
--
-- 2. 查询某原材料的所有SKU:
-- SELECT * FROM product_sku WHERE product_id = 101 AND is_active = TRUE ORDER BY sort_order;
--
-- 3. 获取默认SKU:
-- SELECT * FROM product_sku WHERE product_id = 101 AND is_default = TRUE AND is_active = TRUE;
--
-- ============================================================================
