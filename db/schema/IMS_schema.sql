-- ============================================================================
-- 野百灵餐饮集团 - PostgreSQL 数据库架构脚本
-- 版本: 1.0.0
-- 创建日期: 2025-11-21
-- 数据库: PostgreSQL 14+
-- 规范化: 第三范式 (3NF)
--
-- 核心特性:
-- 1. 多品牌连锁架构 (2品牌 6店 → 50店)
-- 2. 双成本率财务分析体系 (标准成本率 + 实际成本率)
-- 3. 多层级BOM递归分解 (半成品的半成品)
-- 4. 复杂库存管理 (中央仓+门店+调拨)
-- 5. 数据加密 + RBAC权限 + 审计追踪
-- ============================================================================

-- 创建数据库
-- CREATE DATABASE ye_bai_ling_db ENCODING 'UTF8' LC_COLLATE='zh_CN.UTF-8' LC_CTYPE='zh_CN.UTF-8';

\c ye_bai_ling_db

-- 启用必要扩展
CREATE EXTENSION IF NOT EXISTS pgcrypto;                -- 数据加密
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";             -- UUID生成
CREATE EXTENSION IF NOT EXISTS pg_trgm;                 -- 模糊搜索
CREATE EXTENSION IF NOT EXISTS btree_gin;               -- GIN索引支持
CREATE EXTENSION IF NOT EXISTS cube;                    -- 地理位置
CREATE EXTENSION IF NOT EXISTS earthdistance;          -- 地理距离计算

-- 设置时区
SET timezone = 'Asia/Shanghai';

-- ============================================================================
-- 第一部分: 组织架构与权限管理
-- ============================================================================

-- 1.1 组织单元表 (树形结构)
CREATE TABLE organization_unit (
    unit_id SERIAL PRIMARY KEY,
    unit_code VARCHAR(50) UNIQUE NOT NULL,
    unit_name VARCHAR(200) NOT NULL,
    unit_type VARCHAR(20) NOT NULL CHECK (unit_type IN ('brand', 'region', 'province', 'city', 'area')),
    parent_unit_id INT,
    level INT NOT NULL CHECK (level BETWEEN 1 AND 5),
    path VARCHAR(500),
    sort_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_parent_unit FOREIGN KEY (parent_unit_id) REFERENCES organization_unit(unit_id)
);

CREATE INDEX idx_org_unit_parent ON organization_unit(parent_unit_id);
CREATE INDEX idx_org_unit_path ON organization_unit USING gin(path gin_trgm_ops);
CREATE INDEX idx_org_unit_type ON organization_unit(unit_type);
CREATE INDEX idx_org_unit_active ON organization_unit(is_active) WHERE is_active = TRUE;

COMMENT ON TABLE organization_unit IS '组织单元表-支持任意层级结构';
COMMENT ON COLUMN organization_unit.path IS '层级路径,如 /1/5/12/ 便于快速查询子节点';

-- 1.2 品牌表
CREATE TABLE brand (
    brand_id SERIAL PRIMARY KEY,
    brand_code VARCHAR(50) UNIQUE NOT NULL,
    brand_name VARCHAR(200) NOT NULL,
    brand_name_en VARCHAR(200),
    brand_type VARCHAR(20) CHECK (brand_type IN ('premium', 'standard', 'budget')),
    org_unit_id INT NOT NULL,
    positioning VARCHAR(500),
    target_customer VARCHAR(200),
    logo_url VARCHAR(500),
    founded_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_brand_org FOREIGN KEY (org_unit_id) REFERENCES organization_unit(unit_id)
);

CREATE INDEX idx_brand_org ON brand(org_unit_id);
CREATE INDEX idx_brand_active ON brand(is_active) WHERE is_active = TRUE;

COMMENT ON TABLE brand IS '品牌表-支持多品牌管理';

-- 1.3 员工表
CREATE TABLE employee (
    employee_id SERIAL PRIMARY KEY,
    employee_code VARCHAR(50) UNIQUE NOT NULL,
    employee_name VARCHAR(100) NOT NULL,
    employee_name_en VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(100),
    id_card_encrypted BYTEA,
    department VARCHAR(100),
    position VARCHAR(100),
    store_id INT,
    org_unit_id INT,
    brand_id INT,
    reports_to INT,
    hire_date DATE,
    contract_type VARCHAR(20) CHECK (contract_type IN ('full_time', 'part_time', 'intern', 'contractor')),
    employment_status VARCHAR(20) DEFAULT 'active' CHECK (employment_status IN ('active', 'suspended', 'resigned', 'terminated')),
    resignation_date DATE,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    last_login TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_employee_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_employee_org FOREIGN KEY (org_unit_id) REFERENCES organization_unit(unit_id),
    CONSTRAINT fk_employee_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    CONSTRAINT fk_employee_reports_to FOREIGN KEY (reports_to) REFERENCES employee(employee_id)
);

CREATE INDEX idx_employee_store ON employee(store_id);
CREATE INDEX idx_employee_org ON employee(org_unit_id);
CREATE INDEX idx_employee_status ON employee(employment_status);
CREATE INDEX idx_employee_username ON employee(username);

-- 1.4 门店表
CREATE TABLE store (
    store_id SERIAL PRIMARY KEY,
    store_code VARCHAR(50) UNIQUE NOT NULL,
    store_name VARCHAR(200) NOT NULL,
    brand_id INT NOT NULL,
    org_unit_id INT NOT NULL,
    store_type VARCHAR(20) CHECK (store_type IN ('flagship', 'standard', 'express', 'pop_up')),
    business_model VARCHAR(20) CHECK (business_model IN ('direct', 'franchise', 'joint_venture')),
    address VARCHAR(500),
    city VARCHAR(100),
    province VARCHAR(100),
    district VARCHAR(100),
    postal_code VARCHAR(20),
    latitude DECIMAL(10, 7),
    longitude DECIMAL(10, 7),
    phone VARCHAR(50),
    email VARCHAR(100),
    opening_date DATE,
    closing_date DATE,
    business_status VARCHAR(20) DEFAULT 'operating' CHECK (business_status IN ('preparing', 'operating', 'suspended', 'closed')),
    manager_id INT,
    area_sqm DECIMAL(10,2),
    seat_count INT,
    parking_spaces INT,
    business_hours JSON,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_store_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    CONSTRAINT fk_store_org FOREIGN KEY (org_unit_id) REFERENCES organization_unit(unit_id),
    CONSTRAINT fk_store_manager FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

CREATE INDEX idx_store_brand ON store(brand_id);
CREATE INDEX idx_store_org ON store(org_unit_id);
CREATE INDEX idx_store_status ON store(business_status);
CREATE INDEX idx_store_location ON store USING gist(ll_to_earth(latitude, longitude));

COMMENT ON TABLE store IS '门店表-支持多业态门店管理';
COMMENT ON COLUMN store.business_hours IS 'JSON格式存储营业时间,如 {"monday": "10:00-22:00"}';

-- 1.5 仓库表
CREATE TABLE warehouse (
    warehouse_id SERIAL PRIMARY KEY,
    warehouse_code VARCHAR(50) UNIQUE NOT NULL,
    warehouse_name VARCHAR(200) NOT NULL,
    warehouse_type VARCHAR(20) NOT NULL CHECK (warehouse_type IN ('central', 'store', 'supplier')),
    store_id INT,
    org_unit_id INT,
    brand_id INT,
    address VARCHAR(500),
    city VARCHAR(100),
    contact_person VARCHAR(100),
    contact_phone VARCHAR(50),
    manager_id INT,
    capacity_cbm DECIMAL(10,2),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_warehouse_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_warehouse_org FOREIGN KEY (org_unit_id) REFERENCES organization_unit(unit_id),
    CONSTRAINT fk_warehouse_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    CONSTRAINT fk_warehouse_manager FOREIGN KEY (manager_id) REFERENCES employee(employee_id)
);

CREATE INDEX idx_warehouse_type ON warehouse(warehouse_type);
CREATE INDEX idx_warehouse_store ON warehouse(store_id);
CREATE INDEX idx_warehouse_brand ON warehouse(brand_id);

-- 1.6 角色表
CREATE TABLE role (
    role_id SERIAL PRIMARY KEY,
    role_code VARCHAR(50) UNIQUE NOT NULL,
    role_name VARCHAR(100) NOT NULL,
    role_type VARCHAR(20) CHECK (role_type IN ('system', 'business', 'custom')),
    description TEXT,
    level INT DEFAULT 0 CHECK (level BETWEEN 0 AND 3),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

COMMENT ON COLUMN role.level IS '角色层级: 0=总部, 1=区域, 2=门店, 3=普通员工';

-- 1.7 权限表
CREATE TABLE permission (
    permission_id SERIAL PRIMARY KEY,
    permission_code VARCHAR(100) UNIQUE NOT NULL,
    permission_name VARCHAR(200) NOT NULL,
    resource_type VARCHAR(50),
    action VARCHAR(20) CHECK (action IN ('view', 'create', 'update', 'delete', 'export', 'approve')),
    description TEXT,
    created_at TIMESTAMP DEFAULT NOW()
);

-- 1.8 角色权限关联表
CREATE TABLE role_permission (
    role_permission_id SERIAL PRIMARY KEY,
    role_id INT NOT NULL,
    permission_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_role_perm_role FOREIGN KEY (role_id) REFERENCES role(role_id) ON DELETE CASCADE,
    CONSTRAINT fk_role_perm_permission FOREIGN KEY (permission_id) REFERENCES permission(permission_id) ON DELETE CASCADE,
    CONSTRAINT uk_role_permission UNIQUE (role_id, permission_id)
);

CREATE INDEX idx_role_perm_role ON role_permission(role_id);
CREATE INDEX idx_role_perm_permission ON role_permission(permission_id);

-- 1.9 员工角色关联表
CREATE TABLE employee_role (
    employee_role_id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    role_id INT NOT NULL,
    scope_type VARCHAR(20) CHECK (scope_type IN ('global', 'brand', 'org_unit', 'store')),
    scope_id INT,
    effective_date DATE DEFAULT CURRENT_DATE,
    expiry_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_emp_role_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    CONSTRAINT fk_emp_role_role FOREIGN KEY (role_id) REFERENCES role(role_id)
);

CREATE INDEX idx_emp_role_employee ON employee_role(employee_id);
CREATE INDEX idx_emp_role_role ON employee_role(role_id);
CREATE INDEX idx_emp_role_scope ON employee_role(scope_type, scope_id);

-- ============================================================================
-- 第二部分: 产品与配方管理
-- ============================================================================

-- 2.1 计量单位表
CREATE TABLE unit_of_measure (
    unit_id SERIAL PRIMARY KEY,
    unit_code VARCHAR(20) UNIQUE NOT NULL,
    unit_name VARCHAR(50) NOT NULL,
    unit_name_en VARCHAR(50),
    unit_type VARCHAR(20) CHECK (unit_type IN ('weight', 'volume', 'count', 'length')),
    is_base_unit BOOLEAN DEFAULT FALSE,
    symbol VARCHAR(10),
    created_at TIMESTAMP DEFAULT NOW()
);

COMMENT ON TABLE unit_of_measure IS '计量单位表-统一管理所有单位';

-- 2.2 单位换算表
CREATE TABLE unit_conversion (
    conversion_id SERIAL PRIMARY KEY,
    from_unit_id INT NOT NULL,
    to_unit_id INT NOT NULL,
    conversion_factor DECIMAL(10,4) NOT NULL,
    product_id INT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_from_unit FOREIGN KEY (from_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_to_unit FOREIGN KEY (to_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_conv_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT uk_unit_conversion UNIQUE (from_unit_id, to_unit_id, COALESCE(product_id, 0))
);

CREATE INDEX idx_unit_conv_from ON unit_conversion(from_unit_id);
CREATE INDEX idx_unit_conv_to ON unit_conversion(to_unit_id);

COMMENT ON COLUMN unit_conversion.product_id IS 'NULL=通用换算规则, NOT NULL=特定产品换算';

-- 2.3 产品品类表
CREATE TABLE product_category (
    category_id SERIAL PRIMARY KEY,
    category_code VARCHAR(50) UNIQUE NOT NULL,
    category_name VARCHAR(200) NOT NULL,
    parent_category_id INT,
    level INT DEFAULT 1,
    path VARCHAR(500),
    sort_order INT DEFAULT 0,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_parent_category FOREIGN KEY (parent_category_id) REFERENCES product_category(category_id)
);

CREATE INDEX idx_category_parent ON product_category(parent_category_id);
CREATE INDEX idx_category_path ON product_category(path);

-- 2.4 产品表 (统一管理成品/半成品/原材料)
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    product_code VARCHAR(50) UNIQUE NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    product_name_en VARCHAR(200),
    short_name VARCHAR(100),
    product_type VARCHAR(20) NOT NULL CHECK (product_type IN ('finished', 'semi_finished', 'raw_material')),
    category_id INT,
    brand_id INT,

    -- 销售属性
    is_saleable BOOLEAN DEFAULT FALSE,
    selling_price DECIMAL(10,2),
    portion_size DECIMAL(10,2),
    portion_unit_id INT,

    -- 原材料属性
    is_ingredient BOOLEAN DEFAULT FALSE,
    base_unit_id INT,
    purchase_unit_id INT,
    storage_unit_id INT,

    -- 成本信息 (加密存储)
    current_cost_encrypted BYTEA,
    cost_calculation_method VARCHAR(20) CHECK (cost_calculation_method IN ('standard', 'average', 'fifo', 'lifo')),

    -- 质量参数
    net_yield_rate DECIMAL(5,4),
    shelf_life_days INT,
    storage_condition VARCHAR(100),

    -- 图片与描述
    image_url VARCHAR(500),
    description TEXT,
    nutritional_info JSON,
    tags VARCHAR(500),

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    updated_by INT,

    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES product_category(category_id),
    CONSTRAINT fk_product_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    CONSTRAINT fk_product_base_unit FOREIGN KEY (base_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_product_purchase_unit FOREIGN KEY (purchase_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_product_storage_unit FOREIGN KEY (storage_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_product_portion_unit FOREIGN KEY (portion_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_product_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id),
    CONSTRAINT fk_product_updated_by FOREIGN KEY (updated_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_product_type ON product(product_type);
CREATE INDEX idx_product_category ON product(category_id);
CREATE INDEX idx_product_brand ON product(brand_id);
CREATE INDEX idx_product_saleable ON product(is_saleable) WHERE is_saleable = TRUE;
CREATE INDEX idx_product_ingredient ON product(is_ingredient) WHERE is_ingredient = TRUE;
CREATE INDEX idx_product_active ON product(is_active) WHERE is_active = TRUE;
CREATE INDEX idx_product_name ON product USING gin(product_name gin_trgm_ops);

COMMENT ON TABLE product IS '统一产品表-管理成品/半成品/原材料';
COMMENT ON COLUMN product.current_cost_encrypted IS '当前成本-pgcrypto加密存储';

-- 2.5 配方表
CREATE TABLE recipe (
    recipe_id SERIAL PRIMARY KEY,
    recipe_code VARCHAR(50) UNIQUE NOT NULL,
    product_id INT NOT NULL,
    version VARCHAR(20) NOT NULL,
    recipe_name VARCHAR(200),
    description TEXT,
    effective_date DATE NOT NULL,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,
    yield_quantity DECIMAL(10,2),
    yield_unit_id INT,

    -- 成本汇总 (加密)
    total_material_cost_encrypted BYTEA,
    total_labor_cost DECIMAL(10,2),
    total_overhead_cost DECIMAL(10,2),
    total_cost_encrypted BYTEA,

    preparation_time_minutes INT,
    difficulty_level VARCHAR(20) CHECK (difficulty_level IN ('easy', 'medium', 'hard', 'expert')),
    brand_id INT,

    -- 工作流
    status VARCHAR(20) DEFAULT 'draft' CHECK (status IN ('draft', 'pending_approval', 'approved', 'archived')),
    created_by INT,
    approved_by INT,
    approved_at TIMESTAMP,
    notes TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_recipe_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT fk_recipe_yield_unit FOREIGN KEY (yield_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_recipe_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    CONSTRAINT fk_recipe_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id),
    CONSTRAINT fk_recipe_approved_by FOREIGN KEY (approved_by) REFERENCES employee(employee_id),
    CONSTRAINT uk_recipe_version UNIQUE (product_id, version, COALESCE(brand_id, 0))
);

CREATE INDEX idx_recipe_product ON recipe(product_id);
CREATE INDEX idx_recipe_current ON recipe(is_current) WHERE is_current = TRUE;
CREATE INDEX idx_recipe_status ON recipe(status);
CREATE INDEX idx_recipe_brand ON recipe(brand_id);
CREATE INDEX idx_recipe_effective_date ON recipe(effective_date DESC);

COMMENT ON TABLE recipe IS '配方表-支持多版本+多品牌';
COMMENT ON COLUMN recipe.is_current IS '当前使用版本标识';

-- 2.6 配方明细表
CREATE TABLE recipe_item (
    recipe_item_id SERIAL PRIMARY KEY,
    recipe_id INT NOT NULL,
    ingredient_id INT NOT NULL,
    ingredient_type VARCHAR(20) CHECK (ingredient_type IN ('raw_material', 'semi_finished')),
    usage_sequence INT DEFAULT 0,
    quantity DECIMAL(10,3) NOT NULL,
    unit_id INT NOT NULL,

    -- 成本信息 (加密)
    unit_price_encrypted BYTEA,

    waste_rate DECIMAL(5,4) DEFAULT 0 CHECK (waste_rate BETWEEN 0 AND 1),
    net_quantity DECIMAL(10,3),

    subtotal_cost_encrypted BYTEA,
    cost_percentage DECIMAL(5,2),

    is_main_ingredient BOOLEAN DEFAULT FALSE,
    is_optional BOOLEAN DEFAULT FALSE,
    preparation_note TEXT,

    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_recipe_item_recipe FOREIGN KEY (recipe_id) REFERENCES recipe(recipe_id) ON DELETE CASCADE,
    CONSTRAINT fk_recipe_item_ingredient FOREIGN KEY (ingredient_id) REFERENCES product(product_id),
    CONSTRAINT fk_recipe_item_unit FOREIGN KEY (unit_id) REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_recipe_item_recipe ON recipe_item(recipe_id);
CREATE INDEX idx_recipe_item_ingredient ON recipe_item(ingredient_id);
CREATE INDEX idx_recipe_item_type ON recipe_item(ingredient_type);

COMMENT ON TABLE recipe_item IS 'BOM明细表-配方中的原材料清单';
COMMENT ON COLUMN recipe_item.net_quantity IS '净用量 = quantity * (1 - waste_rate)';

-- ============================================================================
-- 第三部分: 供应链管理
-- ============================================================================

-- 3.1 供应商表
CREATE TABLE supplier (
    supplier_id SERIAL PRIMARY KEY,
    supplier_code VARCHAR(50) UNIQUE NOT NULL,
    supplier_name VARCHAR(200) NOT NULL,
    supplier_type VARCHAR(20) CHECK (supplier_type IN ('manufacturer', 'wholesaler', 'distributor', 'farm')),
    contact_person VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(100),
    address VARCHAR(500),
    city VARCHAR(100),
    province VARCHAR(100),
    payment_terms VARCHAR(200),
    credit_limit DECIMAL(12,2),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

CREATE INDEX idx_supplier_type ON supplier(supplier_type);
CREATE INDEX idx_supplier_active ON supplier(is_active) WHERE is_active = TRUE;

-- 3.2 采购订单表
CREATE TABLE purchase_order (
    po_id SERIAL PRIMARY KEY,
    po_number VARCHAR(50) UNIQUE NOT NULL,
    supplier_id INT NOT NULL,
    warehouse_id INT NOT NULL,
    brand_id INT,
    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    actual_delivery_date DATE,
    subtotal DECIMAL(12,2),
    tax_amount DECIMAL(12,2),
    shipping_fee DECIMAL(12,2),
    total_amount DECIMAL(12,2),
    po_status VARCHAR(20) DEFAULT 'draft' CHECK (po_status IN ('draft', 'pending', 'approved', 'ordered', 'partially_received', 'received', 'closed', 'cancelled')),
    payment_status VARCHAR(20) DEFAULT 'unpaid' CHECK (payment_status IN ('unpaid', 'partially_paid', 'paid')),
    notes TEXT,
    created_by INT,
    approved_by INT,
    approved_at TIMESTAMP,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_po_supplier FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    CONSTRAINT fk_po_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_po_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    CONSTRAINT fk_po_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id),
    CONSTRAINT fk_po_approved_by FOREIGN KEY (approved_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_po_supplier ON purchase_order(supplier_id);
CREATE INDEX idx_po_warehouse ON purchase_order(warehouse_id);
CREATE INDEX idx_po_status ON purchase_order(po_status);
CREATE INDEX idx_po_date ON purchase_order(order_date DESC);

-- 3.3 采购订单明细表
CREATE TABLE purchase_order_item (
    po_item_id SERIAL PRIMARY KEY,
    po_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity DECIMAL(10,3) NOT NULL,
    unit_id INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2),
    received_quantity DECIMAL(10,3) DEFAULT 0,
    batch_number VARCHAR(50),
    production_date DATE,
    expiry_date DATE,
    notes TEXT,
    CONSTRAINT fk_po_item_po FOREIGN KEY (po_id) REFERENCES purchase_order(po_id) ON DELETE CASCADE,
    CONSTRAINT fk_po_item_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT fk_po_item_unit FOREIGN KEY (unit_id) REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_po_item_po ON purchase_order_item(po_id);
CREATE INDEX idx_po_item_product ON purchase_order_item(product_id);

-- 3.4 库存表
CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity_on_hand DECIMAL(10,3) DEFAULT 0 CHECK (quantity_on_hand >= 0),
    quantity_available DECIMAL(10,3),
    quantity_reserved DECIMAL(10,3),
    unit_id INT NOT NULL,

    -- 库存预警
    min_stock_level DECIMAL(10,3),
    max_stock_level DECIMAL(10,3),
    reorder_point DECIMAL(10,3),
    reorder_quantity DECIMAL(10,3),

    -- 成本核算
    last_purchase_price DECIMAL(10,2),
    avg_cost DECIMAL(10,2),
    fifo_cost DECIMAL(10,2),

    -- 批次管理
    batch_number VARCHAR(50),
    production_date DATE,
    expiry_date DATE,

    last_stocktake_date DATE,
    last_stocktake_qty DECIMAL(10,3),

    last_updated TIMESTAMP DEFAULT NOW(),

    CONSTRAINT uk_inventory UNIQUE (warehouse_id, product_id, COALESCE(batch_number, '')),
    CONSTRAINT fk_inventory_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_inventory_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT fk_inventory_unit FOREIGN KEY (unit_id) REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX idx_inventory_warehouse ON inventory(warehouse_id);
CREATE INDEX idx_inventory_product ON inventory(product_id);
CREATE INDEX idx_inventory_low_stock ON inventory(warehouse_id, product_id) WHERE quantity_on_hand <= min_stock_level;
CREATE INDEX idx_inventory_expiry ON inventory(expiry_date) WHERE expiry_date IS NOT NULL;

COMMENT ON TABLE inventory IS '库存主表-支持批次管理';

-- 3.5 库存流水表
CREATE TABLE inventory_transaction (
    transaction_id SERIAL PRIMARY KEY,
    transaction_code VARCHAR(50) UNIQUE NOT NULL,
    transaction_type VARCHAR(20) NOT NULL CHECK (transaction_type IN ('purchase', 'sales', 'transfer', 'adjustment', 'production', 'waste', 'return')),
    transaction_date DATE NOT NULL,
    transaction_time TIME DEFAULT CURRENT_TIME,
    warehouse_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity DECIMAL(10,3) NOT NULL,
    unit_id INT NOT NULL,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(12,2),

    -- 关联单据
    reference_type VARCHAR(50),
    reference_id INT,
    reference_number VARCHAR(50),

    -- 调拨相关
    from_warehouse_id INT,
    to_warehouse_id INT,

    -- 批次追踪
    batch_number VARCHAR(50),
    expiry_date DATE,

    -- 审计信息
    notes TEXT,
    created_by INT,
    approved_by INT,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'approved', 'rejected', 'completed')),
    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_inv_trans_warehouse FOREIGN KEY (warehouse_id) REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_inv_trans_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT fk_inv_trans_unit FOREIGN KEY (unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_inv_trans_from_wh FOREIGN KEY (from_warehouse_id) REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_inv_trans_to_wh FOREIGN KEY (to_warehouse_id) REFERENCES warehouse(warehouse_id),
    CONSTRAINT fk_inv_trans_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id),
    CONSTRAINT fk_inv_trans_approved_by FOREIGN KEY (approved_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_inv_trans_date ON inventory_transaction(transaction_date DESC);
CREATE INDEX idx_inv_trans_warehouse ON inventory_transaction(warehouse_id);
CREATE INDEX idx_inv_trans_product ON inventory_transaction(product_id);
CREATE INDEX idx_inv_trans_type ON inventory_transaction(transaction_type);
CREATE INDEX idx_inv_trans_reference ON inventory_transaction(reference_type, reference_id);

COMMENT ON TABLE inventory_transaction IS '库存流水表-所有库存变动的审计追踪';

-- 3.6 原材料价格历史表
CREATE TABLE price_history (
    price_history_id SERIAL PRIMARY KEY,
    product_id INT NOT NULL,
    supplier_id INT,
    effective_date DATE NOT NULL,
    end_date DATE,
    unit_price DECIMAL(10,2) NOT NULL,
    purchase_unit_id INT NOT NULL,
    base_unit_price DECIMAL(10,4),
    price_change_rate DECIMAL(5,2),
    change_reason VARCHAR(200),
    is_current BOOLEAN DEFAULT TRUE,
    created_by INT,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_price_hist_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT fk_price_hist_supplier FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id),
    CONSTRAINT fk_price_hist_unit FOREIGN KEY (purchase_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_price_hist_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_price_hist_product ON price_history(product_id);
CREATE INDEX idx_price_hist_date ON price_history(effective_date DESC);
CREATE INDEX idx_price_hist_current ON price_history(is_current) WHERE is_current = TRUE;

-- ============================================================================
-- 第四部分: 销售与运营
-- ============================================================================

-- 4.1 客户表
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    customer_code VARCHAR(50) UNIQUE,
    customer_name VARCHAR(100),
    phone VARCHAR(50),
    email VARCHAR(100),
    gender VARCHAR(10) CHECK (gender IN ('male', 'female', 'other')),
    birth_date DATE,
    membership_level VARCHAR(20) CHECK (membership_level IN ('regular', 'silver', 'gold', 'platinum', 'diamond')),
    points INT DEFAULT 0,
    total_spent DECIMAL(12,2) DEFAULT 0,
    visit_count INT DEFAULT 0,
    last_visit_date DATE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP
);

CREATE INDEX idx_customer_phone ON customer(phone);
CREATE INDEX idx_customer_membership ON customer(membership_level);
CREATE INDEX idx_customer_active ON customer(is_active) WHERE is_active = TRUE;

-- 4.2 销售订单表
CREATE TABLE sales_order (
    order_id SERIAL PRIMARY KEY,
    order_number VARCHAR(50) UNIQUE NOT NULL,
    order_date DATE NOT NULL,
    order_time TIME DEFAULT CURRENT_TIME,
    store_id INT NOT NULL,
    customer_id INT,
    order_type VARCHAR(20) CHECK (order_type IN ('dine_in', 'takeout', 'delivery', 'catering')),
    table_number VARCHAR(20),
    server_id INT,
    subtotal DECIMAL(12,2),
    discount_amount DECIMAL(12,2),
    total_amount DECIMAL(12,2),
    order_status VARCHAR(20) DEFAULT 'pending' CHECK (order_status IN ('pending', 'confirmed', 'preparing', 'ready', 'served', 'completed', 'cancelled')),
    payment_status VARCHAR(20) DEFAULT 'unpaid' CHECK (payment_status IN ('unpaid', 'partially_paid', 'paid', 'refunded')),
    notes TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_sales_order_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_sales_order_customer FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    CONSTRAINT fk_sales_order_server FOREIGN KEY (server_id) REFERENCES employee(employee_id),
    CONSTRAINT fk_sales_order_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_sales_order_date ON sales_order(order_date DESC);
CREATE INDEX idx_sales_order_store ON sales_order(store_id);
CREATE INDEX idx_sales_order_customer ON sales_order(customer_id);
CREATE INDEX idx_sales_order_status ON sales_order(order_status);
CREATE INDEX idx_sales_order_store_date ON sales_order(store_id, order_date);

-- 4.3 销售订单明细表
CREATE TABLE sales_order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,

    -- 历史快照 (冗余字段,允许反规范化)
    product_name VARCHAR(200),
    unit_price DECIMAL(10,2),
    recipe_cost DECIMAL(10,2),

    quantity DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(12,2),
    discount_rate DECIMAL(5,2),
    discount_amount DECIMAL(12,2),
    final_amount DECIMAL(12,2),
    notes TEXT,

    CONSTRAINT fk_sales_item_order FOREIGN KEY (order_id) REFERENCES sales_order(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_sales_item_product FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE INDEX idx_sales_item_order ON sales_order_item(order_id);
CREATE INDEX idx_sales_item_product ON sales_order_item(product_id);

COMMENT ON COLUMN sales_order_item.unit_price IS '历史价格快照-记录下单时价格';
COMMENT ON COLUMN sales_order_item.recipe_cost IS '历史成本快照-记录下单时成本';

-- 4.4 支付记录表
CREATE TABLE payment_record (
    payment_id SERIAL PRIMARY KEY,
    payment_number VARCHAR(50) UNIQUE NOT NULL,
    order_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_time TIME DEFAULT CURRENT_TIME,
    payment_method VARCHAR(20) CHECK (payment_method IN ('cash', 'card', 'wechat', 'alipay', 'voucher', 'points')),
    amount DECIMAL(12,2) NOT NULL,
    status VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
    transaction_id VARCHAR(100),
    notes TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_payment_order FOREIGN KEY (order_id) REFERENCES sales_order(order_id),
    CONSTRAINT fk_payment_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_payment_order ON payment_record(order_id);
CREATE INDEX idx_payment_date ON payment_record(payment_date DESC);
CREATE INDEX idx_payment_method ON payment_record(payment_method);

-- 4.5 促销活动表
CREATE TABLE promotion (
    promotion_id SERIAL PRIMARY KEY,
    promotion_code VARCHAR(50) UNIQUE NOT NULL,
    promotion_name VARCHAR(200) NOT NULL,
    promotion_type VARCHAR(20) CHECK (promotion_type IN ('percentage', 'fixed_amount', 'buy_x_get_y', 'bundle', 'voucher')),
    discount_value DECIMAL(10,2),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    applicable_stores JSON,
    applicable_products JSON,
    min_purchase_amount DECIMAL(10,2),
    max_discount_amount DECIMAL(10,2),
    usage_limit_per_customer INT,
    total_usage_limit INT,
    current_usage_count INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'draft' CHECK (status IN ('draft', 'active', 'paused', 'expired', 'cancelled')),
    description TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_promotion_created_by FOREIGN KEY (created_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_promotion_dates ON promotion(start_date, end_date);
CREATE INDEX idx_promotion_status ON promotion(status);

-- ============================================================================
-- 第五部分: 财务分析 (双成本率体系) ⭐核心
-- ============================================================================

-- 5.1 销售汇总表 (双成本率+双毛利率)
CREATE TABLE sales_summary (
    summary_id SERIAL PRIMARY KEY,

    -- 维度字段
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    brand_id INT NOT NULL,
    year_month DATE NOT NULL,
    summary_period VARCHAR(20) CHECK (summary_period IN ('daily', 'weekly', 'monthly', 'quarterly', 'yearly')),

    -- 销售数据
    sales_quantity DECIMAL(10,2),
    sales_amount_before_discount DECIMAL(12,2),
    discount_amount DECIMAL(12,2),
    sales_revenue DECIMAL(12,2),
    discount_rate DECIMAL(5,2),

    -- 成本数据
    theoretical_cost DECIMAL(12,2),
    actual_cost DECIMAL(12,2),

    -- 🎯 双成本率指标
    standard_cost_rate DECIMAL(5,2),
    actual_cost_rate DECIMAL(5,2),
    cost_rate_variance DECIMAL(5,2),
    discount_impact DECIMAL(5,2),

    -- 🎯 双毛利率指标
    standard_gross_margin DECIMAL(5,2),
    actual_gross_margin DECIMAL(5,2),
    margin_erosion DECIMAL(5,2),

    -- 理论vs实际成本差异
    cost_variance DECIMAL(12,2),
    cost_variance_rate DECIMAL(5,2),

    -- 促销分析
    promotion_id INT,
    promotion_type VARCHAR(50),

    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT uk_sales_summary UNIQUE (store_id, product_id, year_month, summary_period),
    CONSTRAINT fk_summary_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_summary_product FOREIGN KEY (product_id) REFERENCES product(product_id),
    CONSTRAINT fk_summary_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    CONSTRAINT fk_summary_promotion FOREIGN KEY (promotion_id) REFERENCES promotion(promotion_id)
);

CREATE INDEX idx_sales_summary_store ON sales_summary(store_id);
CREATE INDEX idx_sales_summary_product ON sales_summary(product_id);
CREATE INDEX idx_sales_summary_brand ON sales_summary(brand_id);
CREATE INDEX idx_sales_summary_month ON sales_summary(year_month DESC);
CREATE INDEX idx_sales_summary_store_month ON sales_summary(store_id, year_month);

COMMENT ON TABLE sales_summary IS '销售汇总表-支持双成本率分析体系';
COMMENT ON COLUMN sales_summary.standard_cost_rate IS '标准成本率 = 理论成本/折前销售额';
COMMENT ON COLUMN sales_summary.actual_cost_rate IS '实际成本率 = 理论成本/折后收入 (关键指标)';
COMMENT ON COLUMN sales_summary.cost_rate_variance IS '成本率差异 = 实际成本率 - 标准成本率';
COMMENT ON COLUMN sales_summary.margin_erosion IS '利润侵蚀 = 标准毛利率 - 实际毛利率';

-- 5.2 原材料成本汇总表
CREATE TABLE ingredient_cost_summary (
    cost_summary_id SERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    year_month DATE NOT NULL,
    total_usage_quantity DECIMAL(10,3),
    avg_unit_price DECIMAL(10,2),
    total_cost DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT uk_ingredient_cost UNIQUE (store_id, product_id, year_month),
    CONSTRAINT fk_ingr_cost_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_ingr_cost_product FOREIGN KEY (product_id) REFERENCES product(product_id)
);

CREATE INDEX idx_ingr_cost_store_month ON ingredient_cost_summary(store_id, year_month);

-- 5.3 利润报表表
CREATE TABLE profit_report (
    report_id SERIAL PRIMARY KEY,
    store_id INT,
    brand_id INT,
    report_period DATE NOT NULL,
    period_type VARCHAR(20) CHECK (period_type IN ('daily', 'weekly', 'monthly', 'quarterly', 'yearly')),

    -- 收入
    total_revenue DECIMAL(12,2),
    total_discount DECIMAL(12,2),
    net_revenue DECIMAL(12,2),

    -- 成本
    total_food_cost DECIMAL(12,2),
    total_labor_cost DECIMAL(12,2),
    total_overhead_cost DECIMAL(12,2),
    total_cost DECIMAL(12,2),

    -- 利润
    gross_profit DECIMAL(12,2),
    net_profit DECIMAL(12,2),

    -- 关键指标
    food_cost_rate DECIMAL(5,2),
    labor_cost_rate DECIMAL(5,2),
    gross_margin_rate DECIMAL(5,2),
    net_profit_rate DECIMAL(5,2),

    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT uk_profit_report UNIQUE (COALESCE(store_id, 0), COALESCE(brand_id, 0), report_period, period_type),
    CONSTRAINT fk_profit_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_profit_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

CREATE INDEX idx_profit_report_period ON profit_report(report_period DESC);
CREATE INDEX idx_profit_report_store ON profit_report(store_id);

-- 5.4 KPI指标表
CREATE TABLE kpi_metrics (
    metric_id SERIAL PRIMARY KEY,
    metric_code VARCHAR(50) NOT NULL,
    metric_name VARCHAR(200) NOT NULL,
    store_id INT,
    brand_id INT,
    metric_date DATE NOT NULL,
    metric_value DECIMAL(15,4),
    target_value DECIMAL(15,4),
    variance DECIMAL(15,4),
    variance_rate DECIMAL(5,2),
    status VARCHAR(20) CHECK (status IN ('excellent', 'good', 'normal', 'warning', 'critical')),
    notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_kpi_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_kpi_brand FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

CREATE INDEX idx_kpi_code_date ON kpi_metrics(metric_code, metric_date DESC);
CREATE INDEX idx_kpi_store ON kpi_metrics(store_id);

-- ============================================================================
-- 第六部分: 系统支持
-- ============================================================================

-- 6.1 审计日志表
CREATE TABLE audit_log (
    audit_id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(100) NOT NULL,
    record_id BIGINT,
    operation VARCHAR(20) NOT NULL CHECK (operation IN ('INSERT', 'UPDATE', 'DELETE', 'VIEW', 'EXPORT')),
    old_values JSONB,
    new_values JSONB,
    changed_fields TEXT[],
    employee_id INT,
    ip_address INET,
    user_agent TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_audit_employee FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);

CREATE INDEX idx_audit_table ON audit_log(table_name);
CREATE INDEX idx_audit_record ON audit_log(table_name, record_id);
CREATE INDEX idx_audit_employee ON audit_log(employee_id);
CREATE INDEX idx_audit_created ON audit_log(created_at DESC);
CREATE INDEX idx_audit_operation ON audit_log(operation);
CREATE INDEX idx_audit_old_values_gin ON audit_log USING gin(old_values);
CREATE INDEX idx_audit_new_values_gin ON audit_log USING gin(new_values);

COMMENT ON TABLE audit_log IS '审计日志表-记录所有重要操作';

-- 6.2 数据变更历史表
CREATE TABLE data_change_history (
    history_id BIGSERIAL PRIMARY KEY,
    table_name VARCHAR(100) NOT NULL,
    record_id BIGINT NOT NULL,
    field_name VARCHAR(100) NOT NULL,
    old_value TEXT,
    new_value TEXT,
    changed_by INT,
    changed_at TIMESTAMP DEFAULT NOW(),
    change_reason VARCHAR(500),
    CONSTRAINT fk_history_changed_by FOREIGN KEY (changed_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_history_table_record ON data_change_history(table_name, record_id);
CREATE INDEX idx_history_changed_at ON data_change_history(changed_at DESC);

-- 6.3 系统配置表
CREATE TABLE system_config (
    config_id SERIAL PRIMARY KEY,
    config_key VARCHAR(100) UNIQUE NOT NULL,
    config_value TEXT,
    config_type VARCHAR(20) CHECK (config_type IN ('string', 'number', 'boolean', 'json')),
    category VARCHAR(50),
    description TEXT,
    is_editable BOOLEAN DEFAULT TRUE,
    updated_by INT,
    updated_at TIMESTAMP,
    CONSTRAINT fk_config_updated_by FOREIGN KEY (updated_by) REFERENCES employee(employee_id)
);

CREATE INDEX idx_config_category ON system_config(category);

COMMENT ON TABLE system_config IS '系统配置表-存储系统级配置参数';

-- ============================================================================
-- 完成基础表结构创建
-- ============================================================================

-- 输出统计信息
DO $$
DECLARE
    table_count INT;
    index_count INT;
BEGIN
    SELECT COUNT(*) INTO table_count FROM information_schema.tables WHERE table_schema = 'public' AND table_type = 'BASE TABLE';
    SELECT COUNT(*) INTO index_count FROM pg_indexes WHERE schemaname = 'public';
    RAISE NOTICE '✓ 数据库架构创建完成!';
    RAISE NOTICE '  - 数据表数量: %', table_count;
    RAISE NOTICE '  - 索引数量: %', index_count;
END $$;
