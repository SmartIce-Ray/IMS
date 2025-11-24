-- ============================================================================
-- 野百灵餐饮集团 - MVP核心数据库架构 (24+3表)
-- ============================================================================
-- 版本: v1.0.0-mvp
-- 数据库: PostgreSQL 14+
-- 规范化: 第三范式 (3NF)
-- 设计日期: 2025-11-21
--
-- 核心特性:
-- 1. GENERATED列自动计算双成本率
-- 2. 数据库层面BOM递归分解(支持11个半成品)
-- 3. 全方位成本数据加密(pgcrypto)
-- 4. 临时表+5轮验证审核机制
-- 5. 跨店对比分析支持
-- ============================================================================

-- 启用必要的扩展
CREATE EXTENSION IF NOT EXISTS pgcrypto;        -- 加密支持
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";     -- UUID生成
CREATE EXTENSION IF NOT EXISTS pg_trgm;         -- 模糊查询
CREATE EXTENSION IF NOT EXISTS btree_gin;       -- GIN索引优化

-- 设置时区
SET timezone = 'Asia/Shanghai';

-- ============================================================================
-- 第一层: 基础设施表 (3张)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. brand - 品牌表
-- ----------------------------------------------------------------------------
CREATE TABLE brand (
    brand_id SERIAL PRIMARY KEY,
    brand_code VARCHAR(50) UNIQUE NOT NULL,
    brand_name VARCHAR(200) NOT NULL,
    brand_name_en VARCHAR(200),
    brand_type VARCHAR(20) CHECK (brand_type IN ('premium', 'standard', 'budget')),

    positioning VARCHAR(500),
    target_customer VARCHAR(200),
    logo_url VARCHAR(500),
    founded_date DATE,

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT
);

CREATE INDEX idx_brand_active ON brand(is_active) WHERE is_active = TRUE;
CREATE INDEX idx_brand_code ON brand(brand_code);

COMMENT ON TABLE brand IS '品牌表 - 管理集团下的多个餐饮品牌';
COMMENT ON COLUMN brand.brand_code IS '品牌编码 - 业务主键,如: YBL(野百灵)';
COMMENT ON COLUMN brand.brand_type IS '品牌类型: premium(高端), standard(标准), budget(经济)';

-- ----------------------------------------------------------------------------
-- 2. store - 门店表
-- ----------------------------------------------------------------------------
CREATE TABLE store (
    store_id SERIAL PRIMARY KEY,
    store_code VARCHAR(50) UNIQUE NOT NULL,
    store_name VARCHAR(200) NOT NULL,
    brand_id INT NOT NULL,

    store_type VARCHAR(20) CHECK (store_type IN ('flagship', 'standard', 'express')),
    business_model VARCHAR(20) CHECK (business_model IN ('direct', 'franchise', 'joint_venture')),

    -- 地址信息
    address VARCHAR(500),
    city VARCHAR(100),
    province VARCHAR(100),
    district VARCHAR(100),
    postal_code VARCHAR(20),
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7),
    phone VARCHAR(50),
    email VARCHAR(100),

    -- 运营信息
    opening_date DATE,
    closing_date DATE,
    business_status VARCHAR(20) DEFAULT 'operating'
        CHECK (business_status IN ('preparing', 'operating', 'suspended', 'closed')),

    manager_id INT,
    area_sqm DECIMAL(10,2),
    seat_count INT,
    parking_spaces INT,

    -- 营业时间 JSON格式: {"monday": "10:00-22:00", "tuesday": "10:00-22:00", ...}
    business_hours JSON,

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT,

    CONSTRAINT fk_store_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id)
);

CREATE INDEX idx_store_brand ON store(brand_id);
CREATE INDEX idx_store_status ON store(business_status);
CREATE INDEX idx_store_city ON store(city);
CREATE INDEX idx_store_code ON store(store_code);

COMMENT ON TABLE store IS '门店表 - 管理各品牌下的所有门店';
COMMENT ON COLUMN store.store_code IS '门店编码 - 格式: {品牌简称}-{城市简称}-{流水号}, 如: YBL-DY-001';
COMMENT ON COLUMN store.business_hours IS 'JSON格式营业时间,支持每日不同时段';

-- ----------------------------------------------------------------------------
-- 3. employee - 员工表
-- ----------------------------------------------------------------------------
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    employee_code VARCHAR(50) UNIQUE NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    employee_name_en VARCHAR(100),

    phone VARCHAR(50),
    email VARCHAR(100),
    id_card_encrypted BYTEA,                     -- 身份证号(加密存储)

    -- 组织关系
    department VARCHAR(100),
    position VARCHAR(100),
    store_id INT,                                 -- NULL表示总部员工
    brand_id INT,
    reports_to INT,                               -- 直接上级

    -- 雇佣信息
    hire_date DATE,
    contract_type VARCHAR(20) CHECK (contract_type IN ('full_time', 'part_time', 'intern')),
    employment_status VARCHAR(20) DEFAULT 'active'
        CHECK (employment_status IN ('active', 'suspended', 'resigned', 'dismissed')),
    resignation_date DATE,

    -- 登录信息
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),                   -- bcrypt hash
    last_login TIMESTAMP,

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_employee_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_employee_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT fk_employee_reports_to FOREIGN KEY (reports_to)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_employee_store ON employee(store_id);
CREATE INDEX idx_employee_brand ON employee(brand_id);
CREATE INDEX idx_employee_status ON employee(employment_status);
CREATE INDEX idx_employee_username ON employee(username);

COMMENT ON TABLE employee IS '员工表 - 管理所有员工信息及组织关系';
COMMENT ON COLUMN employee.id_card_encrypted IS '身份证号加密存储,只有HR可解密';
COMMENT ON COLUMN employee.store_id IS 'NULL表示总部员工,NOT NULL表示门店员工';

-- ============================================================================
-- 第二层: 产品与配方表 (6张)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 4. unit_of_measure - 计量单位表
-- ----------------------------------------------------------------------------
CREATE TABLE unit_of_measure (
    unit_id SERIAL PRIMARY KEY,
    unit_code VARCHAR(20) UNIQUE NOT NULL,
    unit_name VARCHAR(50) NOT NULL,
    unit_name_en VARCHAR(50),
    unit_type VARCHAR(20) CHECK (unit_type IN ('weight', 'volume', 'count', 'length')),
    unit_category VARCHAR(20) CHECK (unit_category IN ('base', 'package', 'usage')),
    is_base_unit BOOLEAN DEFAULT FALSE,

    symbol VARCHAR(10),

    created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_unit_type ON unit_of_measure(unit_type);
CREATE INDEX idx_unit_category ON unit_of_measure(unit_category);
CREATE INDEX idx_unit_base ON unit_of_measure(is_base_unit) WHERE is_base_unit = TRUE;

COMMENT ON TABLE unit_of_measure IS '计量单位表 - 支持重量/体积/计数/长度单位,分为base/package/usage三类';
COMMENT ON COLUMN unit_of_measure.is_base_unit IS '是否基础单位,如g/ml/个是基础单位';
COMMENT ON COLUMN unit_of_measure.unit_category IS '单位分类: base=基础单位(成本核算), package=包装单位(采购), usage=使用单位(配方)';

-- ----------------------------------------------------------------------------
-- 5. unit_conversion - 单位换算表
-- ----------------------------------------------------------------------------
CREATE TABLE unit_conversion (
    conversion_id SERIAL PRIMARY KEY,
    from_unit_id INT NOT NULL,
    to_unit_id INT NOT NULL,
    conversion_factor DECIMAL(10,4) NOT NULL,
    product_id INT,                               -- NULL=通用, NOT NULL=特定产品

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_from_unit FOREIGN KEY (from_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_to_unit FOREIGN KEY (to_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT uk_unit_conversion UNIQUE (from_unit_id, to_unit_id, COALESCE(product_id, 0))
);

CREATE INDEX idx_conversion_from ON unit_conversion(from_unit_id);
CREATE INDEX idx_conversion_to ON unit_conversion(to_unit_id);
CREATE INDEX idx_conversion_product ON unit_conversion(product_id);

COMMENT ON TABLE unit_conversion IS '单位换算表 - 支持通用换算和产品特定换算';
COMMENT ON COLUMN unit_conversion.product_id IS 'NULL表示通用规则(如1斤=500g), NOT NULL表示产品特定规则';

-- ----------------------------------------------------------------------------
-- 6. product_category - 产品品类表
-- ----------------------------------------------------------------------------
CREATE TABLE product_category (
    category_id SERIAL PRIMARY KEY,
    category_code VARCHAR(50) UNIQUE NOT NULL,
    category_name VARCHAR(200) NOT NULL,
    parent_category_id INT,
    level INT DEFAULT 1,
    path VARCHAR(500),                            -- 如: /1/5/12/

    sort_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_parent_category FOREIGN KEY (parent_category_id)
        REFERENCES product_category(category_id)
);

CREATE INDEX idx_category_parent ON product_category(parent_category_id);
CREATE INDEX idx_category_path ON product_category USING gin(path gin_trgm_ops);

COMMENT ON TABLE product_category IS '产品品类表 - 支持多层级分类(肉类/蔬菜/调料等)';
COMMENT ON COLUMN product_category.path IS '层级路径,用于快速查询所有子品类';

-- ----------------------------------------------------------------------------
-- 7. product - 产品表 (统一管理成品/半成品/原材料)
-- ----------------------------------------------------------------------------
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_code VARCHAR(50) UNIQUE NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    product_name_en VARCHAR(200),
    short_name VARCHAR(100),

    product_type VARCHAR(20) NOT NULL
        CHECK (product_type IN ('finished', 'semi_finished', 'raw_material')),
    category_id INT,
    brand_id INT,                                 -- NULL=通用, NOT NULL=品牌专属

    -- 销售属性(成品/半成品可销售)
    is_saleable BOOLEAN DEFAULT FALSE,
    selling_price DECIMAL(10,2),
    portion_size DECIMAL(10,2),
    portion_unit_id INT,

    -- 原材料属性(半成品/原材料可作为配料)
    is_ingredient BOOLEAN DEFAULT FALSE,
    base_unit_id INT,                             -- 基础计量单位(配方用)
    purchase_unit_id INT,                         -- 采购单位
    storage_unit_id INT,                          -- 库存单位

    -- ★成本信息(加密存储)
    current_cost_encrypted BYTEA,                 -- 当前成本(加密)
    cost_calculation_method VARCHAR(20) DEFAULT 'standard'
        CHECK (cost_calculation_method IN ('standard', 'average', 'fifo', 'lifo')),

    -- 质量参数
    std_yield_rate DECIMAL(5,4) DEFAULT 1.0,      -- 标准出成率(原材料级别)
    shelf_life_days INT,
    storage_condition VARCHAR(100),

    -- 图片与描述
    image_url VARCHAR(500),
    description TEXT,
    nutritional_info JSON,

    -- 标签
    tags VARCHAR(500),                            -- 招牌菜,新品,素食等

    -- 半成品标记 ★关键:11个核心半成品需要标记
    is_core_semi_finished BOOLEAN DEFAULT FALSE,

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT,

    CONSTRAINT fk_product_category FOREIGN KEY (category_id)
        REFERENCES product_category(category_id),
    CONSTRAINT fk_product_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT fk_product_base_unit FOREIGN KEY (base_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_product_purchase_unit FOREIGN KEY (purchase_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_product_storage_unit FOREIGN KEY (storage_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_product_portion_unit FOREIGN KEY (portion_unit_id)
        REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_product_type ON product(product_type);
CREATE INDEX idx_product_category ON product(category_id);
CREATE INDEX idx_product_brand ON product(brand_id);
CREATE INDEX idx_product_saleable ON product(is_saleable) WHERE is_saleable = TRUE;
CREATE INDEX idx_product_ingredient ON product(is_ingredient) WHERE is_ingredient = TRUE;
CREATE INDEX idx_product_core_semi ON product(is_core_semi_finished) WHERE is_core_semi_finished = TRUE;
CREATE INDEX idx_product_name ON product USING gin(product_name gin_trgm_ops);

COMMENT ON TABLE product IS '产品表 - 统一管理成品/半成品/原材料';
COMMENT ON COLUMN product.product_type IS 'finished(成品菜)/semi_finished(半成品)/raw_material(原材料)';
COMMENT ON COLUMN product.current_cost_encrypted IS '★加密存储的产品成本,需decrypt_cost()解密';
COMMENT ON COLUMN product.is_core_semi_finished IS '★标记11个核心半成品,需完全分解到原材料';
COMMENT ON COLUMN product.std_yield_rate IS '★标准出成率(原材料级别),如0.9表示90%可用,成本=采购价/出成率';

-- ----------------------------------------------------------------------------
-- 8. recipe - 配方表 (支持多版本)
-- ----------------------------------------------------------------------------
CREATE TABLE recipe (
    recipe_id SERIAL PRIMARY KEY,
    recipe_code VARCHAR(50) UNIQUE NOT NULL,
    product_id INT NOT NULL,
    version VARCHAR(20) NOT NULL,                 -- v1.0, v1.1, v2.0

    recipe_name VARCHAR(200),
    description TEXT,

    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,

    yield_quantity DECIMAL(10,2),                 -- 产出量
    yield_unit_id INT,

    -- ★成本汇总(加密存储)
    total_material_cost_encrypted BYTEA,          -- 原材料总成本
    total_labor_cost DECIMAL(10,2),               -- 人工成本
    total_overhead_cost DECIMAL(10,2),            -- 制造费用
    total_cost_encrypted BYTEA,                   -- 总成本

    preparation_time_minutes INT,
    difficulty_level VARCHAR(20) CHECK (difficulty_level IN ('easy', 'medium', 'hard', 'expert')),

    brand_id INT,                                 -- 同产品不同品牌配方可能不同

    -- 工作流
    status VARCHAR(20) DEFAULT 'draft'
        CHECK (status IN ('draft', 'pending_approval', 'approved', 'archived')),
    created_by INT,
    approved_by INT,
    approved_at TIMESTAMP,

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_recipe_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_recipe_yield_unit FOREIGN KEY (yield_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_recipe_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT fk_recipe_created_by FOREIGN KEY (created_by)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_recipe_approved_by FOREIGN KEY (approved_by)
        REFERENCES employee(employee_id),
    CONSTRAINT uk_recipe_version UNIQUE (product_id, version, COALESCE(brand_id, 0))
);

CREATE INDEX idx_recipe_product ON recipe(product_id);
CREATE INDEX idx_recipe_current ON recipe(is_current) WHERE is_current = TRUE;
CREATE INDEX idx_recipe_status ON recipe(status);
CREATE INDEX idx_recipe_brand ON recipe(brand_id);
CREATE INDEX idx_recipe_effective_date ON recipe(effective_date DESC);

COMMENT ON TABLE recipe IS '配方表 - 支持多版本配方和品牌差异化配方';
COMMENT ON COLUMN recipe.is_current IS '是否当前使用版本,每个产品只能有一个当前版本';
COMMENT ON COLUMN recipe.total_cost_encrypted IS '★加密存储的配方总成本';

-- ----------------------------------------------------------------------------
-- 9. recipe_item - 配方明细表 (BOM明细)
-- ----------------------------------------------------------------------------
CREATE TABLE recipe_item (
    recipe_item_id SERIAL PRIMARY KEY,
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,                   -- 指向product表(原材料或半成品)

    ingredient_type VARCHAR(20) CHECK (ingredient_type IN ('raw_material', 'semi_finished')),
    usage_sequence INT DEFAULT 0,

    quantity DECIMAL(10,3) NOT NULL,
    unit_id INT NOT NULL,

    -- ★成本信息(加密)
    unit_price_encrypted BYTEA,                   -- 单价(加密)

    usage_yield_rate DECIMAL(5,4) DEFAULT 1.0,    -- 使用出成率(配方级别,可覆盖原材料默认值)
    waste_rate DECIMAL(5,4) DEFAULT 0,
    net_quantity DECIMAL(10,3),                   -- 净用量 = quantity * (1-waste_rate)

    subtotal_cost_encrypted BYTEA,                -- 小计成本(加密)
    cost_percentage DECIMAL(5,2),                 -- 成本占比%

    is_main_ingredient BOOLEAN DEFAULT FALSE,
    is_optional BOOLEAN DEFAULT FALSE,

    preparation_note TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_recipe_item_recipe FOREIGN KEY (recipe_id)
        REFERENCES recipe(recipe_id) ON DELETE CASCADE,
    CONSTRAINT fk_recipe_item_ingredient FOREIGN KEY (ingredient_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_recipe_item_unit FOREIGN KEY (unit_id)
        REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_recipe_item_recipe ON recipe_item(recipe_id);
CREATE INDEX idx_recipe_item_ingredient ON recipe_item(ingredient_id);
CREATE INDEX idx_recipe_item_type ON recipe_item(ingredient_type);

COMMENT ON TABLE recipe_item IS '配方明细表 - BOM清单,支持半成品递归分解';
COMMENT ON COLUMN recipe_item.net_quantity IS '净用量=quantity*(1-waste_rate),自动计算';
COMMENT ON COLUMN recipe_item.unit_price_encrypted IS '★加密存储的原材料单价';
COMMENT ON COLUMN recipe_item.subtotal_cost_encrypted IS '★加密存储的明细成本';
COMMENT ON COLUMN recipe_item.usage_yield_rate IS '★使用出成率(配方级别),可覆盖原材料默认值,成本=用量×单价/出成率';

-- ============================================================================
-- 第三层: 采购管理表 (6张)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 10. supplier - 供应商表
-- ----------------------------------------------------------------------------
CREATE TABLE supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_code VARCHAR(50) UNIQUE NOT NULL,
    supplier_name VARCHAR(200) NOT NULL,
    supplier_name_en VARCHAR(200),
    short_name VARCHAR(100),

    supplier_type VARCHAR(20) CHECK (supplier_type IN ('manufacturer', 'distributor', 'wholesaler', 'farmer')),
    supplier_level VARCHAR(20) CHECK (supplier_level IN ('strategic', 'preferred', 'qualified', 'trial')),

    -- 联系信息
    contact_person VARCHAR(100),
    contact_phone VARCHAR(50),
    contact_email VARCHAR(100),
    address VARCHAR(500),
    city VARCHAR(100),
    province VARCHAR(100),

    -- 资质信息
    business_license VARCHAR(100),
    tax_id VARCHAR(50),
    food_license VARCHAR(100),
    license_expiry_date DATE,

    -- 银行信息
    bank_name VARCHAR(200),
    bank_account VARCHAR(100),

    -- 评级信息
    credit_rating CHAR(1) CHECK (credit_rating IN ('A', 'B', 'C', 'D')),
    quality_score DECIMAL(3,1),                   -- 质量评分 0-10
    delivery_score DECIMAL(3,1),                  -- 交付评分 0-10

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT
);

CREATE INDEX idx_supplier_type ON supplier(supplier_type);
CREATE INDEX idx_supplier_level ON supplier(supplier_level);
CREATE INDEX idx_supplier_city ON supplier(city);

COMMENT ON TABLE supplier IS '供应商表 - 管理所有原材料供应商';
COMMENT ON COLUMN supplier.supplier_level IS 'strategic(战略)/preferred(优选)/qualified(合格)/trial(试用)';

-- ----------------------------------------------------------------------------
-- 11. supplier_contract - 供应商合同表 ★新增
-- ----------------------------------------------------------------------------
CREATE TABLE supplier_contract (
    contract_id SERIAL PRIMARY KEY,
    contract_code VARCHAR(50) UNIQUE NOT NULL,
    supplier_id INT NOT NULL,

    contract_start_date DATE NOT NULL,
    contract_end_date DATE,

    contract_type VARCHAR(20) CHECK (contract_type IN ('supply', 'consignment', 'processing')),

    -- 价格条款
    payment_terms VARCHAR(100),
    price_adjustment_method VARCHAR(100),
    minimum_order_value DECIMAL(10,2),

    delivery_terms VARCHAR(100),
    delivery_lead_time_days INT,

    quality_standard TEXT,
    dispute_resolution TEXT,

    approval_status VARCHAR(20) DEFAULT 'pending'
        CHECK (approval_status IN ('pending', 'approved', 'rejected', 'expired')),
    approved_by INT,
    approved_at TIMESTAMP,

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,

    CONSTRAINT fk_contract_supplier FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id),
    CONSTRAINT fk_contract_approved_by FOREIGN KEY (approved_by)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_contract_supplier ON supplier_contract(supplier_id);
CREATE INDEX idx_contract_status ON supplier_contract(approval_status);
CREATE INDEX idx_contract_dates ON supplier_contract(contract_start_date, contract_end_date);

COMMENT ON TABLE supplier_contract IS '供应商合同表 - 管理采购合同和价格协议';

-- ----------------------------------------------------------------------------
-- 12. purchase_order - 采购订单表
-- ----------------------------------------------------------------------------
CREATE TABLE purchase_order (
    purchase_order_id SERIAL PRIMARY KEY,
    purchase_order_code VARCHAR(50) UNIQUE NOT NULL,
    supplier_id INT NOT NULL,
    warehouse_id INT NOT NULL,                    -- 目标仓库

    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    actual_delivery_date DATE,

    order_status VARCHAR(20) DEFAULT 'draft'
        CHECK (order_status IN ('draft', 'pending_approval', 'approved', 'sent', 'partial_received', 'received', 'cancelled')),

    total_amount DECIMAL(12,2),
    discount_amount DECIMAL(10,2),
    tax_amount DECIMAL(10,2),
    final_amount DECIMAL(12,2),

    payment_terms VARCHAR(100),
    delivery_address VARCHAR(500),

    approved_by INT,
    approved_at TIMESTAMP,

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT,

    CONSTRAINT fk_po_supplier FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id),
    CONSTRAINT fk_po_approved_by FOREIGN KEY (approved_by)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_po_supplier ON purchase_order(supplier_id);
CREATE INDEX idx_po_status ON purchase_order(order_status);
CREATE INDEX idx_po_order_date ON purchase_order(order_date DESC);

COMMENT ON TABLE purchase_order IS '采购订单表 - 管理原材料采购订单';

-- ----------------------------------------------------------------------------
-- 13. purchase_order_item - 采购订单明细表
-- ----------------------------------------------------------------------------
CREATE TABLE purchase_order_item (
    purchase_order_item_id SERIAL PRIMARY KEY,
    purchase_order_id INT NOT NULL,
    product_id INT NOT NULL,                      -- 采购的原材料

    ordered_quantity DECIMAL(10,3) NOT NULL,
    ordered_unit_id INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2) NOT NULL,

    received_quantity DECIMAL(10,3) DEFAULT 0,
    received_unit_id INT,

    tax_rate DECIMAL(5,4),
    tax_amount DECIMAL(10,2),

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_poi_po FOREIGN KEY (purchase_order_id)
        REFERENCES purchase_order(purchase_order_id) ON DELETE CASCADE,
    CONSTRAINT fk_poi_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_poi_ordered_unit FOREIGN KEY (ordered_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_poi_received_unit FOREIGN KEY (received_unit_id)
        REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_poi_po ON purchase_order_item(purchase_order_id);
CREATE INDEX idx_poi_product ON purchase_order_item(product_id);

COMMENT ON TABLE purchase_order_item IS '采购订单明细表';

-- ----------------------------------------------------------------------------
-- 14. goods_receipt - 收货单表
-- ----------------------------------------------------------------------------
CREATE TABLE goods_receipt (
    goods_receipt_id SERIAL PRIMARY KEY,
    goods_receipt_code VARCHAR(50) UNIQUE NOT NULL,
    purchase_order_id INT NOT NULL,
    warehouse_id INT NOT NULL,

    receipt_date DATE NOT NULL,
    received_by INT NOT NULL,

    receipt_status VARCHAR(20) DEFAULT 'pending'
        CHECK (receipt_status IN ('pending', 'partial', 'completed', 'cancelled')),

    quality_check_status VARCHAR(20) DEFAULT 'pending'
        CHECK (quality_check_status IN ('pending', 'passed', 'failed', 'partial')),
    quality_checked_by INT,
    quality_checked_at TIMESTAMP,

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_gr_po FOREIGN KEY (purchase_order_id)
        REFERENCES purchase_order(purchase_order_id),
    CONSTRAINT fk_gr_received_by FOREIGN KEY (received_by)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_gr_quality_checked_by FOREIGN KEY (quality_checked_by)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_gr_po ON goods_receipt(purchase_order_id);
CREATE INDEX idx_gr_date ON goods_receipt(receipt_date DESC);
CREATE INDEX idx_gr_status ON goods_receipt(receipt_status);

COMMENT ON TABLE goods_receipt IS '收货单表 - 记录采购收货和质检';

-- ----------------------------------------------------------------------------
-- 15. goods_receipt_item - 收货单明细表
-- ----------------------------------------------------------------------------
CREATE TABLE goods_receipt_item (
    goods_receipt_item_id SERIAL PRIMARY KEY,
    goods_receipt_id INT NOT NULL,
    purchase_order_item_id INT NOT NULL,
    product_id INT NOT NULL,

    received_quantity DECIMAL(10,3) NOT NULL,
    received_unit_id INT NOT NULL,

    batch_number VARCHAR(100),
    production_date DATE,
    expiry_date DATE,

    unit_price DECIMAL(10,2),
    subtotal DECIMAL(12,2),

    quality_status VARCHAR(20) DEFAULT 'pending'
        CHECK (quality_status IN ('pending', 'passed', 'failed')),

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_gri_gr FOREIGN KEY (goods_receipt_id)
        REFERENCES goods_receipt(goods_receipt_id) ON DELETE CASCADE,
    CONSTRAINT fk_gri_poi FOREIGN KEY (purchase_order_item_id)
        REFERENCES purchase_order_item(purchase_order_item_id),
    CONSTRAINT fk_gri_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_gri_unit FOREIGN KEY (received_unit_id)
        REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_gri_gr ON goods_receipt_item(goods_receipt_id);
CREATE INDEX idx_gri_poi ON goods_receipt_item(purchase_order_item_id);
CREATE INDEX idx_gri_product ON goods_receipt_item(product_id);
CREATE INDEX idx_gri_batch ON goods_receipt_item(batch_number);

COMMENT ON TABLE goods_receipt_item IS '收货单明细表 - 支持批次管理';

-- ============================================================================
-- 第四层: 库存管理表 (5张)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 16. warehouse - 仓库/库房表
-- ----------------------------------------------------------------------------
CREATE TABLE warehouse (
    warehouse_id SERIAL PRIMARY KEY,
    warehouse_code VARCHAR(50) UNIQUE NOT NULL,
    warehouse_name VARCHAR(200) NOT NULL,
    warehouse_type VARCHAR(20) NOT NULL CHECK (warehouse_type IN ('central', 'store', 'supplier')),

    store_id INT,                                 -- 如果是门店仓库
    brand_id INT,

    address VARCHAR(500),
    city VARCHAR(100),
    contact_person VARCHAR(100),
    contact_phone VARCHAR(50),

    manager_id INT,
    capacity_cbm DECIMAL(10,2),                   -- 容量(立方米)

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_warehouse_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_warehouse_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT fk_warehouse_manager FOREIGN KEY (manager_id)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_warehouse_type ON warehouse(warehouse_type);
CREATE INDEX idx_warehouse_store ON warehouse(store_id);
CREATE INDEX idx_warehouse_brand ON warehouse(brand_id);

COMMENT ON TABLE warehouse IS '仓库表 - 管理中央仓库和各门店仓库';
COMMENT ON COLUMN warehouse.warehouse_type IS 'central(中央仓)/store(门店仓)/supplier(供应商寄售仓)';

-- ----------------------------------------------------------------------------
-- 17. inventory - 库存表
-- ----------------------------------------------------------------------------
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,

    current_quantity DECIMAL(10,3) NOT NULL DEFAULT 0,
    unit_id INT NOT NULL,

    -- 批次信息
    batch_number VARCHAR(100),
    production_date DATE,
    expiry_date DATE,

    -- 成本信息(加权平均)
    weighted_avg_cost DECIMAL(10,2),

    -- 库存预警
    min_stock_level DECIMAL(10,3),
    max_stock_level DECIMAL(10,3),
    reorder_point DECIMAL(10,3),

    -- 库位信息
    location_code VARCHAR(50),

    last_stocktake_date DATE,
    last_movement_date DATE,

    updated_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_inventory_warehouse FOREIGN KEY (warehouse_id)
        REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_inventory_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_inventory_unit FOREIGN KEY (unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT uk_inventory UNIQUE (warehouse_id, product_id, COALESCE(batch_number, ''))
);

CREATE INDEX idx_inventory_warehouse ON inventory(warehouse_id);
CREATE INDEX idx_inventory_product ON inventory(product_id);
CREATE INDEX idx_inventory_batch ON inventory(batch_number);
CREATE INDEX idx_inventory_expiry ON inventory(expiry_date) WHERE expiry_date IS NOT NULL;

COMMENT ON TABLE inventory IS '库存表 - 实时库存余额,支持批次管理';
COMMENT ON COLUMN inventory.weighted_avg_cost IS '加权平均成本,用于成本核算';

-- ----------------------------------------------------------------------------
-- 18. inventory_transaction - 库存交易表
-- ----------------------------------------------------------------------------
CREATE TABLE inventory_transaction (
    transaction_id BIGSERIAL PRIMARY KEY,
    transaction_code VARCHAR(50) UNIQUE NOT NULL,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,

    transaction_type VARCHAR(20) NOT NULL
        CHECK (transaction_type IN ('purchase_in', 'sale_out', 'transfer_in', 'transfer_out', 'adjustment', 'loss', 'return')),

    transaction_date DATE NOT NULL,
    transaction_time TIMESTAMP DEFAULT NOW(),

    quantity DECIMAL(10,3) NOT NULL,              -- 正数=入库, 负数=出库
    unit_id INT NOT NULL,
    unit_cost DECIMAL(10,2),

    batch_number VARCHAR(100),

    -- 关联单据
    reference_type VARCHAR(50),                   -- 'purchase_order', 'sales_order', 'transfer', etc.
    reference_id INT,

    notes TEXT,

    created_by INT,
    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_inv_trans_warehouse FOREIGN KEY (warehouse_id)
        REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_inv_trans_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_inv_trans_unit FOREIGN KEY (unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_inv_trans_created_by FOREIGN KEY (created_by)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_inv_trans_warehouse ON inventory_transaction(warehouse_id);
CREATE INDEX idx_inv_trans_product ON inventory_transaction(product_id);
CREATE INDEX idx_inv_trans_date ON inventory_transaction(transaction_date DESC);
CREATE INDEX idx_inv_trans_type ON inventory_transaction(transaction_type);

COMMENT ON TABLE inventory_transaction IS '库存交易表 - 记录所有库存变动';
COMMENT ON COLUMN inventory_transaction.quantity IS '正数=入库, 负数=出库';

-- ----------------------------------------------------------------------------
-- 19. inventory_transfer - 门店调拨表 ★新增
-- ----------------------------------------------------------------------------
CREATE TABLE inventory_transfer (
    transfer_id SERIAL PRIMARY KEY,
    transfer_code VARCHAR(50) UNIQUE NOT NULL,
    transfer_date DATE NOT NULL,

    from_warehouse_id INT NOT NULL,
    to_warehouse_id INT NOT NULL,

    transfer_type VARCHAR(20) NOT NULL CHECK (transfer_type IN ('inter_store', 'replenishment', 'return')),

    approval_status VARCHAR(20) DEFAULT 'pending'
        CHECK (approval_status IN ('pending', 'approved', 'rejected', 'cancelled')),
    approved_by INT,
    approved_at TIMESTAMP,

    shipped_by INT,
    shipped_at TIMESTAMP,

    received_by INT,
    received_at TIMESTAMP,

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,

    CONSTRAINT fk_transfer_from FOREIGN KEY (from_warehouse_id)
        REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_transfer_to FOREIGN KEY (to_warehouse_id)
        REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_transfer_approved_by FOREIGN KEY (approved_by)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_transfer_shipped_by FOREIGN KEY (shipped_by)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_transfer_received_by FOREIGN KEY (received_by)
        REFERENCES employee(employee_id),
    CONSTRAINT ck_transfer_warehouses CHECK (from_warehouse_id != to_warehouse_id)
);

CREATE INDEX idx_transfer_from ON inventory_transfer(from_warehouse_id);
CREATE INDEX idx_transfer_to ON inventory_transfer(to_warehouse_id);
CREATE INDEX idx_transfer_date ON inventory_transfer(transfer_date DESC);
CREATE INDEX idx_transfer_status ON inventory_transfer(approval_status);

COMMENT ON TABLE inventory_transfer IS '门店调拨表 - 管理门店间库存调拨';

-- ----------------------------------------------------------------------------
-- 20. inventory_transfer_item - 调拨明细表
-- ----------------------------------------------------------------------------
CREATE TABLE inventory_transfer_item (
    transfer_item_id SERIAL PRIMARY KEY,
    transfer_id INT NOT NULL,
    product_id INT NOT NULL,

    planned_quantity DECIMAL(10,3) NOT NULL,
    planned_unit_id INT NOT NULL,

    actual_quantity DECIMAL(10,3),
    actual_unit_id INT,

    batch_number VARCHAR(100),

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_transfer_item_transfer FOREIGN KEY (transfer_id)
        REFERENCES inventory_transfer(transfer_id) ON DELETE CASCADE,
    CONSTRAINT fk_transfer_item_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_transfer_item_planned_unit FOREIGN KEY (planned_unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_transfer_item_actual_unit FOREIGN KEY (actual_unit_id)
        REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_transfer_item_transfer ON inventory_transfer_item(transfer_id);
CREATE INDEX idx_transfer_item_product ON inventory_transfer_item(product_id);

COMMENT ON TABLE inventory_transfer_item IS '调拨明细表';

-- ----------------------------------------------------------------------------
-- 21. stocktake_record - 盘点记录表
-- ----------------------------------------------------------------------------
CREATE TABLE stocktake_record (
    stocktake_id SERIAL PRIMARY KEY,
    stocktake_code VARCHAR(50) UNIQUE NOT NULL,
    warehouse_id INT NOT NULL,
    stocktake_date DATE NOT NULL,

    stocktake_type VARCHAR(20) CHECK (stocktake_type IN ('full', 'partial', 'spot_check')),
    stocktake_status VARCHAR(20) DEFAULT 'in_progress'
        CHECK (stocktake_status IN ('in_progress', 'completed', 'approved', 'cancelled')),

    stocktake_by INT NOT NULL,
    approved_by INT,
    approved_at TIMESTAMP,

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_stocktake_warehouse FOREIGN KEY (warehouse_id)
        REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_stocktake_by FOREIGN KEY (stocktake_by)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_stocktake_approved_by FOREIGN KEY (approved_by)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_stocktake_warehouse ON stocktake_record(warehouse_id);
CREATE INDEX idx_stocktake_date ON stocktake_record(stocktake_date DESC);

COMMENT ON TABLE stocktake_record IS '盘点记录表 - 定期盘点和库存调整';

-- ============================================================================
-- 第五层: 销售数据表 (2张) ★核心:双成本率分析基础
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 22. sales_detail - 销售明细表 ★核心表
-- ----------------------------------------------------------------------------
CREATE TABLE sales_detail (
    sales_detail_id BIGSERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    sales_date DATE NOT NULL,
    sales_time TIME,
    time_slot VARCHAR(20),                        -- '午市'|'晚市'|'夜宵'

    product_id INT NOT NULL,
    product_name VARCHAR(200) NOT NULL,           -- 冗余存储,防止产品改名影响历史数据
    recipe_id INT NOT NULL,                       -- ★关键:关联配方获取成本

    -- ★核心字段:双成本率计算基础
    sales_quantity DECIMAL(10,2) NOT NULL,
    presales_amount DECIMAL(10,2) NOT NULL,       -- 销售额(折前) - 用于标准成本率
    product_revenue DECIMAL(10,2) NOT NULL,       -- 菜品收入(折后) - 用于实际成本率 ★★★
    product_discount DECIMAL(10,2) DEFAULT 0,     -- 菜品优惠
    discount_rate DECIMAL(5,2),                   -- 优惠率%

    -- ★自动计算字段 - GENERATED ALWAYS AS
    theoretical_cost DECIMAL(10,2) GENERATED ALWAYS AS (
        sales_quantity * COALESCE(
            (SELECT COALESCE(
                pgp_sym_decrypt(total_cost_encrypted, current_setting('app.encryption_key', true))::DECIMAL(10,2),
                0
            )
            FROM recipe r
            WHERE r.recipe_id = sales_detail.recipe_id
            LIMIT 1),
            0
        )
    ) STORED,

    standard_cost_rate DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE
            WHEN presales_amount > 0
            THEN ROUND((sales_quantity * COALESCE(
                (SELECT COALESCE(
                    pgp_sym_decrypt(total_cost_encrypted, current_setting('app.encryption_key', true))::DECIMAL(10,2),
                    0
                )
                FROM recipe r
                WHERE r.recipe_id = sales_detail.recipe_id
                LIMIT 1),
                0
            )) / presales_amount * 100, 2)
            ELSE 0
        END
    ) STORED,

    actual_cost_rate DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE
            WHEN product_revenue > 0
            THEN ROUND((sales_quantity * COALESCE(
                (SELECT COALESCE(
                    pgp_sym_decrypt(total_cost_encrypted, current_setting('app.encryption_key', true))::DECIMAL(10,2),
                    0
                )
                FROM recipe r
                WHERE r.recipe_id = sales_detail.recipe_id
                LIMIT 1),
                0
            )) / product_revenue * 100, 2)
            ELSE 0
        END
    ) STORED,

    cost_variance DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE
            WHEN product_revenue > 0 AND presales_amount > 0
            THEN ROUND(
                ((sales_quantity * COALESCE(
                    (SELECT COALESCE(
                        pgp_sym_decrypt(total_cost_encrypted, current_setting('app.encryption_key', true))::DECIMAL(10,2),
                        0
                    )
                    FROM recipe r
                    WHERE r.recipe_id = sales_detail.recipe_id
                    LIMIT 1),
                    0
                )) / product_revenue * 100)
                - ((sales_quantity * COALESCE(
                    (SELECT COALESCE(
                        pgp_sym_decrypt(total_cost_encrypted, current_setting('app.encryption_key', true))::DECIMAL(10,2),
                        0
                    )
                    FROM recipe r
                    WHERE r.recipe_id = sales_detail.recipe_id
                    LIMIT 1),
                    0
                )) / presales_amount * 100)
            , 2)
            ELSE 0
        END
    ) STORED,

    gross_margin_rate DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE
            WHEN product_revenue > 0
            THEN ROUND((product_revenue - sales_quantity * COALESCE(
                (SELECT COALESCE(
                    pgp_sym_decrypt(total_cost_encrypted, current_setting('app.encryption_key', true))::DECIMAL(10,2),
                    0
                )
                FROM recipe r
                WHERE r.recipe_id = sales_detail.recipe_id
                LIMIT 1),
                0
            )) / product_revenue * 100, 2)
            ELSE 0
        END
    ) STORED,

    -- 审计字段
    payment_method VARCHAR(20),
    is_refunded BOOLEAN DEFAULT FALSE,
    refund_amount DECIMAL(10,2),
    refund_reason TEXT,
    refund_approved_by INT,
    refund_approved_at TIMESTAMP,

    -- Excel溯源字段
    excel_filename VARCHAR(200),
    excel_sheet_name VARCHAR(100),
    excel_row_number INT,

    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT,

    CONSTRAINT fk_sales_detail_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_sales_detail_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_sales_detail_recipe FOREIGN KEY (recipe_id)
        REFERENCES recipe(recipe_id),
    CONSTRAINT fk_sales_detail_refund_by FOREIGN KEY (refund_approved_by)
        REFERENCES employee(employee_id),
    CONSTRAINT ck_sales_detail_amounts CHECK (presales_amount >= product_revenue),
    CONSTRAINT ck_sales_detail_discount CHECK (product_discount >= 0)
);

CREATE INDEX idx_sales_detail_store_date ON sales_detail(store_id, sales_date);
CREATE INDEX idx_sales_detail_product ON sales_detail(product_id);
CREATE INDEX idx_sales_detail_recipe ON sales_detail(recipe_id);
CREATE INDEX idx_sales_detail_date ON sales_detail(sales_date DESC);

COMMENT ON TABLE sales_detail IS '★销售明细表 - 双成本率分析核心数据源,使用GENERATED列自动计算';
COMMENT ON COLUMN sales_detail.presales_amount IS '★销售额(折前) - 标准成本率分母';
COMMENT ON COLUMN sales_detail.product_revenue IS '★菜品收入(折后) - 实际成本率分母 [最关键字段]';
COMMENT ON COLUMN sales_detail.theoretical_cost IS 'GENERATED列 - 理论成本 = 销售数量 × 配方单品成本';
COMMENT ON COLUMN sales_detail.standard_cost_rate IS 'GENERATED列 - 标准成本率 = 理论成本/销售额(折前)×100%';
COMMENT ON COLUMN sales_detail.actual_cost_rate IS 'GENERATED列 - ★实际成本率 = 理论成本/菜品收入(折后)×100%';
COMMENT ON COLUMN sales_detail.cost_variance IS 'GENERATED列 - 成本率差异 = 实际成本率 - 标准成本率';

-- ----------------------------------------------------------------------------
-- 23. payment_record - 支付记录表
-- ----------------------------------------------------------------------------
CREATE TABLE payment_record (
    payment_id BIGSERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_time TIMESTAMP DEFAULT NOW(),

    payment_method VARCHAR(20) CHECK (payment_method IN ('cash', 'card', 'alipay', 'wechat', 'membership')),
    payment_amount DECIMAL(10,2) NOT NULL,

    sales_detail_ids INT[],                       -- 关联的销售明细ID数组

    transaction_id VARCHAR(100),                  -- 第三方支付流水号

    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_payment_store FOREIGN KEY (store_id)
        REFERENCES store(store_id)
);

CREATE INDEX idx_payment_store_date ON payment_record(store_id, payment_date);
CREATE INDEX idx_payment_method ON payment_record(payment_method);

COMMENT ON TABLE payment_record IS '支付记录表 - 记录收款信息';

-- ============================================================================
-- 第六层: 财务分析表 (4张) ★核心:双成本率分析
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 24. sales_summary - 销售汇总表 ★核心分析表
-- ----------------------------------------------------------------------------
CREATE TABLE sales_summary (
    summary_id SERIAL PRIMARY KEY,

    -- 时间维度
    year INT NOT NULL,
    month INT NOT NULL,
    week INT,
    summary_date DATE,
    summary_period VARCHAR(50) NOT NULL,          -- 'daily'|'weekly'|'monthly'|'8-10月汇总'

    -- 地理维度
    store_id INT,                                 -- NULL=全店汇总
    store_name VARCHAR(200),
    brand_id INT,
    city VARCHAR(100),

    -- 产品维度
    product_id INT NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    category_id INT,
    category_name VARCHAR(200),

    -- ★销售数据
    transaction_count INT,
    sales_quantity DECIMAL(10,2),
    presales_amount DECIMAL(12,2),
    product_revenue DECIMAL(12,2),
    product_discount DECIMAL(12,2),

    avg_discount_rate DECIMAL(5,2),
    actual_discount_rate DECIMAL(5,2),

    -- ★成本数据(加密)
    theoretical_cost_encrypted BYTEA,

    -- ★双成本率指标
    standard_cost_rate DECIMAL(5,2),              -- 标准成本率
    actual_cost_rate DECIMAL(5,2),                -- 实际成本率 ★
    cost_rate_variance DECIMAL(5,2),              -- 成本率差异

    standard_gross_margin DECIMAL(5,2),           -- 标准毛利率
    actual_gross_margin DECIMAL(5,2),             -- 实际毛利率
    margin_erosion DECIMAL(5,2),                  -- 毛利侵蚀

    -- 对比指标
    day_on_day_growth DECIMAL(5,2),
    mom_growth DECIMAL(5,2),
    yoy_growth DECIMAL(5,2),

    -- 数据质量
    data_quality_score INT,
    data_completeness VARCHAR(20) CHECK (data_completeness IN ('complete', 'partial', 'incomplete')),

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_summary_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_summary_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT fk_summary_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_summary_category FOREIGN KEY (category_id)
        REFERENCES product_category(category_id),
    CONSTRAINT uk_sales_summary UNIQUE (summary_period, COALESCE(store_id, 0), product_id)
);

CREATE INDEX idx_summary_period ON sales_summary(summary_period, year, month);
CREATE INDEX idx_summary_store ON sales_summary(store_id);
CREATE INDEX idx_summary_product ON sales_summary(product_id);
CREATE INDEX idx_summary_category ON sales_summary(category_id);

COMMENT ON TABLE sales_summary IS '★销售汇总表 - 双成本率核心分析表,支持多维度汇总';
COMMENT ON COLUMN sales_summary.theoretical_cost_encrypted IS '★加密存储的理论成本';
COMMENT ON COLUMN sales_summary.standard_cost_rate IS '标准成本率 = 理论成本/销售额(折前)×100%';
COMMENT ON COLUMN sales_summary.actual_cost_rate IS '★实际成本率 = 理论成本/菜品收入(折后)×100%';
COMMENT ON COLUMN sales_summary.margin_erosion IS '毛利侵蚀 = 标准毛利率 - 实际毛利率';

-- ----------------------------------------------------------------------------
-- 25. ingredient_cost_summary - 原材料成本汇总表
-- ----------------------------------------------------------------------------
CREATE TABLE ingredient_cost_summary (
    cost_summary_id SERIAL PRIMARY KEY,

    summary_period VARCHAR(50) NOT NULL,
    store_id INT,
    brand_id INT,

    ingredient_id INT NOT NULL,
    ingredient_name VARCHAR(200) NOT NULL,
    category_id INT,

    total_usage_quantity DECIMAL(10,3),
    unit_id INT,

    -- 成本数据(加密)
    total_cost_encrypted BYTEA,
    avg_unit_cost_encrypted BYTEA,

    usage_count INT,                              -- 使用次数

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_cost_summary_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_cost_summary_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT fk_cost_summary_ingredient FOREIGN KEY (ingredient_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_cost_summary_category FOREIGN KEY (category_id)
        REFERENCES product_category(category_id),
    CONSTRAINT fk_cost_summary_unit FOREIGN KEY (unit_id)
        REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_cost_summary_period ON ingredient_cost_summary(summary_period);
CREATE INDEX idx_cost_summary_ingredient ON ingredient_cost_summary(ingredient_id);

COMMENT ON TABLE ingredient_cost_summary IS '原材料成本汇总表 - 按期间统计原材料用量和成本';

-- ----------------------------------------------------------------------------
-- 26. cost_variance_analysis - 成本差异分析表
-- ----------------------------------------------------------------------------
CREATE TABLE cost_variance_analysis (
    variance_id SERIAL PRIMARY KEY,

    analysis_period VARCHAR(50) NOT NULL,
    store_id INT NOT NULL,
    product_id INT NOT NULL,

    standard_cost DECIMAL(10,2),
    actual_cost DECIMAL(10,2),
    variance_amount DECIMAL(10,2),
    variance_rate DECIMAL(5,2),

    variance_type VARCHAR(20) CHECK (variance_type IN ('favorable', 'unfavorable', 'neutral')),

    -- 差异原因分类
    price_variance DECIMAL(10,2),                 -- 价格差异
    quantity_variance DECIMAL(10,2),              -- 用量差异
    waste_variance DECIMAL(10,2),                 -- 损耗差异

    analysis_notes TEXT,
    action_required TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    created_by INT,

    CONSTRAINT fk_variance_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_variance_product FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);

CREATE INDEX idx_variance_period ON cost_variance_analysis(analysis_period);
CREATE INDEX idx_variance_store ON cost_variance_analysis(store_id);
CREATE INDEX idx_variance_type ON cost_variance_analysis(variance_type);

COMMENT ON TABLE cost_variance_analysis IS '成本差异分析表 - 分析标准成本与实际成本差异';

-- ----------------------------------------------------------------------------
-- 27. profit_report - 利润报表
-- ----------------------------------------------------------------------------
CREATE TABLE profit_report (
    report_id SERIAL PRIMARY KEY,

    report_period VARCHAR(50) NOT NULL,
    store_id INT,
    brand_id INT,

    -- 收入
    total_revenue DECIMAL(12,2),
    total_discount DECIMAL(12,2),
    net_revenue DECIMAL(12,2),

    -- 成本(加密)
    total_cost_encrypted BYTEA,

    -- 毛利
    gross_profit_encrypted BYTEA,
    gross_margin_rate DECIMAL(5,2),

    -- 其他成本
    labor_cost DECIMAL(12,2),
    rent_cost DECIMAL(12,2),
    utility_cost DECIMAL(12,2),
    other_operating_cost DECIMAL(12,2),

    -- 净利
    net_profit_encrypted BYTEA,
    net_margin_rate DECIMAL(5,2),

    report_notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    created_by INT,

    CONSTRAINT fk_profit_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_profit_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT uk_profit_report UNIQUE (report_period, COALESCE(store_id, 0), COALESCE(brand_id, 0))
);

CREATE INDEX idx_profit_period ON profit_report(report_period);
CREATE INDEX idx_profit_store ON profit_report(store_id);

COMMENT ON TABLE profit_report IS '利润报表 - 综合利润分析';

-- ============================================================================
-- 第七层: 审核支持表 (3张临时表) ★新增
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 28. staging_sales_detail - 销售数据临时表
-- ----------------------------------------------------------------------------
CREATE TABLE staging_sales_detail (
    staging_id BIGSERIAL PRIMARY KEY,
    batch_id UUID NOT NULL,                       -- 批次ID,用于批量审核

    -- 与sales_detail相同的字段结构
    store_code VARCHAR(50),
    sales_date DATE,
    sales_time TIME,
    time_slot VARCHAR(20),

    product_code VARCHAR(50),
    product_name VARCHAR(200),
    recipe_code VARCHAR(50),

    sales_quantity DECIMAL(10,2),
    presales_amount DECIMAL(10,2),
    product_revenue DECIMAL(10,2),
    product_discount DECIMAL(10,2),
    discount_rate DECIMAL(5,2),

    payment_method VARCHAR(20),

    -- Excel溯源
    excel_filename VARCHAR(200),
    excel_sheet_name VARCHAR(100),
    excel_row_number INT,

    -- 验证状态
    validation_status VARCHAR(20) DEFAULT 'pending'
        CHECK (validation_status IN ('pending', 'validating', 'passed', 'failed')),
    validation_errors JSON,                       -- 验证错误详情
    quality_score INT,                            -- 质量评分 0-100

    imported_at TIMESTAMP DEFAULT NOW(),
    imported_by INT
);

CREATE INDEX idx_staging_sales_batch ON staging_sales_detail(batch_id);
CREATE INDEX idx_staging_sales_status ON staging_sales_detail(validation_status);

COMMENT ON TABLE staging_sales_detail IS '★销售数据临时表 - 用于Excel导入的5轮验证';

-- ----------------------------------------------------------------------------
-- 29. staging_recipe_data - 配方数据临时表
-- ----------------------------------------------------------------------------
CREATE TABLE staging_recipe_data (
    staging_id SERIAL PRIMARY KEY,
    batch_id UUID NOT NULL,

    product_code VARCHAR(50),
    product_name VARCHAR(200),
    recipe_version VARCHAR(20),

    ingredient_code VARCHAR(50),
    ingredient_name VARCHAR(200),
    quantity DECIMAL(10,3),
    unit_code VARCHAR(20),
    unit_price DECIMAL(10,2),

    excel_filename VARCHAR(200),
    excel_row_number INT,

    validation_status VARCHAR(20) DEFAULT 'pending',
    validation_errors JSON,
    quality_score INT,

    imported_at TIMESTAMP DEFAULT NOW(),
    imported_by INT
);

CREATE INDEX idx_staging_recipe_batch ON staging_recipe_data(batch_id);

COMMENT ON TABLE staging_recipe_data IS '配方数据临时表 - 用于成本卡导入验证';

-- ----------------------------------------------------------------------------
-- 30. data_validation_log - 数据验证日志表
-- ----------------------------------------------------------------------------
CREATE TABLE data_validation_log (
    log_id BIGSERIAL PRIMARY KEY,
    batch_id UUID NOT NULL,

    data_type VARCHAR(50) NOT NULL,               -- 'sales'|'recipe'|'inventory'
    validation_round INT NOT NULL CHECK (validation_round BETWEEN 1 AND 5),

    round_name VARCHAR(100),                      -- '数据提取验证'|'结构验证'|'计算验证'|'逻辑验证'|'质量评分'
    round_status VARCHAR(20) CHECK (round_status IN ('passed', 'failed', 'warning')),

    total_records INT,
    passed_records INT,
    failed_records INT,
    warning_records INT,

    error_details JSON,                           -- 详细错误列表
    quality_score INT,                            -- 本轮质量评分

    validation_time TIMESTAMP DEFAULT NOW(),
    validated_by INT
);

CREATE INDEX idx_validation_log_batch ON data_validation_log(batch_id);
CREATE INDEX idx_validation_log_type ON data_validation_log(data_type);

COMMENT ON TABLE data_validation_log IS '数据验证日志表 - 记录5轮验证详情';
COMMENT ON COLUMN data_validation_log.validation_round IS '验证轮次: 1=提取 2=结构 3=计算 4=逻辑 5=评分';

-- ============================================================================
-- 成本历史追踪表(补充) ★新增
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 31. ingredient_cost_history - 原材料成本历史表 ★新增
-- ----------------------------------------------------------------------------
CREATE TABLE ingredient_cost_history (
    cost_history_id SERIAL PRIMARY KEY,
    ingredient_id INT NOT NULL,

    effective_date DATE NOT NULL,
    expiry_date DATE,

    unit_id INT NOT NULL,
    unit_price_encrypted BYTEA NOT NULL,          -- 加密存储单价
    net_yield_rate DECIMAL(5,4),

    source_type VARCHAR(20) DEFAULT 'manual_input'
        CHECK (source_type IN ('manual_input', 'purchase_order', 'market_price', 'supplier_quote')),
    purchase_order_item_id INT,
    supplier_id INT,

    approval_status VARCHAR(20) DEFAULT 'pending'
        CHECK (approval_status IN ('pending', 'approved', 'rejected')),
    approved_by INT,
    approved_at TIMESTAMP,

    change_reason TEXT,
    notes TEXT,

    created_by INT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_cost_hist_ingredient FOREIGN KEY (ingredient_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_cost_hist_unit FOREIGN KEY (unit_id)
        REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_cost_hist_poi FOREIGN KEY (purchase_order_item_id)
        REFERENCES purchase_order_item(purchase_order_item_id),
    CONSTRAINT fk_cost_hist_supplier FOREIGN KEY (supplier_id)
        REFERENCES supplier(supplier_id),
    CONSTRAINT fk_cost_hist_approved_by FOREIGN KEY (approved_by)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_cost_hist_created_by FOREIGN KEY (created_by)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_cost_hist_ingredient ON ingredient_cost_history(ingredient_id);
CREATE INDEX idx_cost_hist_effective ON ingredient_cost_history(effective_date DESC);
CREATE INDEX idx_cost_hist_status ON ingredient_cost_history(approval_status);

COMMENT ON TABLE ingredient_cost_history IS '★原材料成本历史表 - 追踪原材料价格变化,支持成本分析';
COMMENT ON COLUMN ingredient_cost_history.unit_price_encrypted IS '★加密存储的单价';

-- ============================================================================
-- 数据库配置建议
-- ============================================================================

-- 设置加密密钥(需在postgresql.conf或环境变量中配置)
-- app.encryption_key = 'your-secure-encryption-key-here'

-- 性能优化建议
ALTER SYSTEM SET shared_buffers = '256MB';
ALTER SYSTEM SET effective_cache_size = '1GB';
ALTER SYSTEM SET maintenance_work_mem = '64MB';
ALTER SYSTEM SET work_mem = '16MB';

-- 启用查询统计
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- ============================================================================
-- 脚本完成
-- ============================================================================
--
-- 总计: 27张业务表 + 3张临时表 + 1张成本历史表 = 31张表
--
-- 下一步:
-- 1. 运行本脚本创建所有表结构
-- 2. 运行 functions_cost_encryption.sql 创建加密解密函数
-- 3. 运行 functions_bom_explosion.sql 创建BOM递归函数
-- 4. 运行 triggers_automatic_calculation.sql 创建自动计算触发器
-- 5. 运行 data_init_mvp.sql 初始化基础数据
-- 6. 运行 procedures_data_validation.sql 创建验证存储过程
-- 7. 运行 views_financial_analysis.sql 创建分析视图
-- 8. 使用 etl_excel_to_staging.py 导入Excel数据
--
-- ============================================================================
