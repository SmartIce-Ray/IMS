-- ============================================================================
-- 野百灵餐饮集团 - 订单系统扩展架构
-- ============================================================================
-- 版本: v1.0.1-order-extension (Supabase兼容版)
-- 目的: 支持16项运营指标 + 多渠道销售 + 平台团购
-- 新增表: 6张 (按依赖顺序排列)
-- 修复: 表创建顺序调整，确保外键引用正确
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. group_buy_platform - 团购平台表 (无依赖)
-- ----------------------------------------------------------------------------
CREATE TABLE group_buy_platform (
    platform_id SERIAL PRIMARY KEY,
    platform_code VARCHAR(50) UNIQUE NOT NULL,
    platform_name VARCHAR(100) NOT NULL,
    platform_type VARCHAR(20) NOT NULL,              -- 'meituan'|'douyin'|'eleme'|'dianping'
    default_commission_rate DECIMAL(5,4) NOT NULL,   -- 默认佣金费率
    settlement_cycle_days INT,
    settlement_account VARCHAR(100),
    contact_person VARCHAR(100),
    contact_phone VARCHAR(50),
    contact_email VARCHAR(100),
    api_key VARCHAR(255),
    api_secret_encrypted BYTEA,
    api_endpoint VARCHAR(500),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT chk_commission_rate CHECK (default_commission_rate >= 0 AND default_commission_rate <= 1)
);

CREATE INDEX idx_platform_type ON group_buy_platform(platform_type);
CREATE INDEX idx_platform_active ON group_buy_platform(is_active) WHERE is_active = TRUE;

COMMENT ON TABLE group_buy_platform IS '团购平台管理表';
COMMENT ON COLUMN group_buy_platform.default_commission_rate IS '默认佣金费率: 美团8%, 抖音6%';

-- 预置平台数据
INSERT INTO group_buy_platform (platform_code, platform_name, platform_type, default_commission_rate, settlement_cycle_days) VALUES
('PLT-MT', '美团', 'meituan', 0.08, 30),
('PLT-DP', '大众点评', 'dianping', 0.08, 30),
('PLT-DY', '抖音团购', 'douyin', 0.06, 15),
('PLT-ELM', '饿了么', 'eleme', 0.18, 7)
ON CONFLICT (platform_code) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. product_package - 套餐产品定义表 (依赖brand, product_category, employee)
-- ----------------------------------------------------------------------------
CREATE TABLE product_package (
    package_id SERIAL PRIMARY KEY,
    package_code VARCHAR(50) UNIQUE NOT NULL,
    package_name VARCHAR(200) NOT NULL,
    package_name_en VARCHAR(200),
    brand_id INT,
    category_id INT,
    selling_price DECIMAL(10,2) NOT NULL,
    original_total_price DECIMAL(10,2),
    discount_amount DECIMAL(10,2),
    description TEXT,
    image_url VARCHAR(500),
    effective_date DATE,
    expiry_date DATE,
    max_daily_sales INT,
    is_available_online BOOLEAN DEFAULT TRUE,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    created_by INT,
    CONSTRAINT fk_package_brand FOREIGN KEY (brand_id)
        REFERENCES brand(brand_id),
    CONSTRAINT fk_package_category FOREIGN KEY (category_id)
        REFERENCES product_category(category_id),
    CONSTRAINT fk_package_created_by FOREIGN KEY (created_by)
        REFERENCES employee(employee_id)
);

CREATE INDEX idx_package_brand ON product_package(brand_id);
CREATE INDEX idx_package_active ON product_package(is_active) WHERE is_active = TRUE;
CREATE INDEX idx_package_effective ON product_package(effective_date, expiry_date);

COMMENT ON TABLE product_package IS '套餐产品定义表';

-- ----------------------------------------------------------------------------
-- 3. package_item - 套餐明细表 (依赖product_package, product)
-- ----------------------------------------------------------------------------
CREATE TABLE package_item (
    package_item_id SERIAL PRIMARY KEY,
    package_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity DECIMAL(10,2) NOT NULL DEFAULT 1.0,
    is_optional BOOLEAN DEFAULT FALSE,
    is_main_item BOOLEAN DEFAULT FALSE,
    display_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_package_item_package FOREIGN KEY (package_id)
        REFERENCES product_package(package_id) ON DELETE CASCADE,
    CONSTRAINT fk_package_item_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT uk_package_product UNIQUE (package_id, product_id)
);

CREATE INDEX idx_package_item_package ON package_item(package_id);
CREATE INDEX idx_package_item_product ON package_item(product_id);

COMMENT ON TABLE package_item IS '套餐明细表 - 定义套餐包含的产品';

-- ----------------------------------------------------------------------------
-- 4. group_buy_deal - 团购套餐表 (依赖group_buy_platform, store, product_package)
-- ----------------------------------------------------------------------------
CREATE TABLE group_buy_deal (
    deal_id SERIAL PRIMARY KEY,
    deal_code VARCHAR(50) UNIQUE NOT NULL,
    deal_name VARCHAR(200) NOT NULL,
    platform_id INT NOT NULL,
    platform_deal_id VARCHAR(100),
    store_id INT,
    package_id INT,
    original_price DECIMAL(10,2) NOT NULL,
    deal_price DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2),
    commission_rate DECIMAL(5,4),
    max_purchases_per_user INT,
    daily_stock INT,
    total_stock INT,
    sold_count INT DEFAULT 0,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    need_appointment BOOLEAN DEFAULT FALSE,
    valid_hours JSON,
    exclude_dates JSON,
    status VARCHAR(20) DEFAULT 'active',
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_deal_platform FOREIGN KEY (platform_id)
        REFERENCES group_buy_platform(platform_id),
    CONSTRAINT fk_deal_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_deal_package FOREIGN KEY (package_id)
        REFERENCES product_package(package_id),
    CONSTRAINT chk_deal_dates CHECK (end_date >= start_date),
    CONSTRAINT chk_deal_price CHECK (deal_price > 0 AND deal_price <= original_price)
);

CREATE INDEX idx_deal_platform ON group_buy_deal(platform_id);
CREATE INDEX idx_deal_store ON group_buy_deal(store_id);
CREATE INDEX idx_deal_package ON group_buy_deal(package_id);
CREATE INDEX idx_deal_dates ON group_buy_deal(start_date, end_date);
CREATE INDEX idx_deal_status ON group_buy_deal(status);

COMMENT ON TABLE group_buy_deal IS '团购套餐表 - 记录各平台团购活动';

-- ----------------------------------------------------------------------------
-- 5. sales_order - 订单主表 (依赖store, employee, group_buy_deal)
-- ----------------------------------------------------------------------------
CREATE TABLE sales_order (
    order_id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(50) UNIQUE NOT NULL,
    store_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_datetime TIMESTAMP NOT NULL,
    order_type VARCHAR(20) NOT NULL,
    sales_channel VARCHAR(50),
    table_number VARCHAR(20),
    guest_count INT,
    seat_time TIMESTAMP,
    leave_time TIMESTAMP,
    dining_duration_minutes INT,
    subtotal_amount DECIMAL(10,2) NOT NULL,
    discount_amount DECIMAL(10,2) DEFAULT 0,
    manual_discount DECIMAL(10,2) DEFAULT 0,
    coupon_discount DECIMAL(10,2) DEFAULT 0,
    membership_discount DECIMAL(10,2) DEFAULT 0,
    rounding_amount DECIMAL(10,2) DEFAULT 0,
    final_amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    payment_time TIMESTAMP,
    platform_type VARCHAR(50),
    platform_order_id VARCHAR(100),
    platform_commission_rate DECIMAL(5,4),
    platform_commission_amount DECIMAL(10,2),
    is_group_buy BOOLEAN DEFAULT FALSE,
    group_buy_deal_id INT,
    waiter_id INT,
    cashier_id INT,
    order_status VARCHAR(20) DEFAULT 'pending',
    cancel_reason TEXT,
    cancelled_at TIMESTAMP,
    notes TEXT,
    customer_remarks TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,
    CONSTRAINT fk_order_store FOREIGN KEY (store_id)
        REFERENCES store(store_id),
    CONSTRAINT fk_order_waiter FOREIGN KEY (waiter_id)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_order_cashier FOREIGN KEY (cashier_id)
        REFERENCES employee(employee_id),
    CONSTRAINT fk_order_groupbuy_deal FOREIGN KEY (group_buy_deal_id)
        REFERENCES group_buy_deal(deal_id)
);

CREATE INDEX idx_order_store_date ON sales_order(store_id, order_date DESC);
CREATE INDEX idx_order_datetime ON sales_order(order_datetime DESC);
CREATE INDEX idx_order_type ON sales_order(order_type);
CREATE INDEX idx_order_channel ON sales_order(sales_channel);
CREATE INDEX idx_order_status ON sales_order(order_status);
CREATE INDEX idx_order_platform ON sales_order(platform_type) WHERE platform_type IS NOT NULL;
CREATE INDEX idx_order_groupbuy ON sales_order(is_group_buy) WHERE is_group_buy = TRUE;

COMMENT ON TABLE sales_order IS '订单主表 - 记录每笔订单完整信息';
COMMENT ON COLUMN sales_order.dining_duration_minutes IS '就餐时长(分钟) = leave_time - seat_time';
COMMENT ON COLUMN sales_order.platform_commission_rate IS '平台佣金费率: 美团8%, 抖音6%';

-- ----------------------------------------------------------------------------
-- 6. sales_order_item - 订单明细表 (依赖sales_order, product, product_package, recipe)
-- ----------------------------------------------------------------------------
CREATE TABLE sales_order_item (
    order_item_id BIGSERIAL PRIMARY KEY,
    order_id BIGINT NOT NULL,
    product_id INT NOT NULL,
    product_code VARCHAR(50) NOT NULL,
    product_name VARCHAR(200) NOT NULL,
    is_package BOOLEAN DEFAULT FALSE,
    package_id INT,
    quantity DECIMAL(10,2) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    discount_rate DECIMAL(5,4) DEFAULT 0,
    actual_price DECIMAL(10,2) NOT NULL,
    line_subtotal DECIMAL(10,2) NOT NULL,
    line_discount DECIMAL(10,2) DEFAULT 0,
    line_total DECIMAL(10,2) NOT NULL,
    recipe_id INT,
    recipe_version VARCHAR(20),
    theoretical_cost DECIMAL(10,2),
    -- 双成本率（普通列，由应用层或触发器计算）
    standard_cost_rate DECIMAL(5,2),
    actual_cost_rate DECIMAL(5,2),
    item_notes TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_order_item_order FOREIGN KEY (order_id)
        REFERENCES sales_order(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_order_item_product FOREIGN KEY (product_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_order_item_package FOREIGN KEY (package_id)
        REFERENCES product_package(package_id),
    CONSTRAINT fk_order_item_recipe FOREIGN KEY (recipe_id)
        REFERENCES recipe(recipe_id)
);

CREATE INDEX idx_order_item_order ON sales_order_item(order_id);
CREATE INDEX idx_order_item_product ON sales_order_item(product_id);
CREATE INDEX idx_order_item_package ON sales_order_item(is_package) WHERE is_package = TRUE;

COMMENT ON TABLE sales_order_item IS '订单明细表 - 记录订单中每个产品的销售数据';
COMMENT ON COLUMN sales_order_item.standard_cost_rate IS '标准成本率 = 理论成本 / 销售额(折前) × 100%';
COMMENT ON COLUMN sales_order_item.actual_cost_rate IS '实际成本率 = 理论成本 / 菜品收入(折后) × 100% ⭐核心';

-- ----------------------------------------------------------------------------
-- 触发器: 自动计算订单明细成本率
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calculate_order_item_cost_rates()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.line_subtotal > 0 AND NEW.theoretical_cost IS NOT NULL THEN
        NEW.standard_cost_rate := ROUND((NEW.theoretical_cost / NEW.line_subtotal) * 100, 2);
    END IF;
    IF NEW.line_total > 0 AND NEW.theoretical_cost IS NOT NULL THEN
        NEW.actual_cost_rate := ROUND((NEW.theoretical_cost / NEW.line_total) * 100, 2);
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_order_item_cost_rates
BEFORE INSERT OR UPDATE ON sales_order_item
FOR EACH ROW
EXECUTE FUNCTION calculate_order_item_cost_rates();

-- ----------------------------------------------------------------------------
-- 触发器: 自动更新订单金额汇总
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION update_order_totals()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE sales_order
    SET
        subtotal_amount = (
            SELECT COALESCE(SUM(line_subtotal), 0)
            FROM sales_order_item
            WHERE order_id = COALESCE(NEW.order_id, OLD.order_id)
        ),
        discount_amount = (
            SELECT COALESCE(SUM(line_discount), 0)
            FROM sales_order_item
            WHERE order_id = COALESCE(NEW.order_id, OLD.order_id)
        ),
        final_amount = (
            SELECT COALESCE(SUM(line_total), 0)
            FROM sales_order_item
            WHERE order_id = COALESCE(NEW.order_id, OLD.order_id)
        ),
        updated_at = NOW()
    WHERE order_id = COALESCE(NEW.order_id, OLD.order_id);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_order_totals
AFTER INSERT OR UPDATE OR DELETE ON sales_order_item
FOR EACH ROW
EXECUTE FUNCTION update_order_totals();

COMMENT ON FUNCTION update_order_totals() IS '自动更新订单主表的金额汇总';

-- ----------------------------------------------------------------------------
-- 触发器: 自动计算就餐时长
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calculate_dining_duration()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.seat_time IS NOT NULL AND NEW.leave_time IS NOT NULL THEN
        NEW.dining_duration_minutes := EXTRACT(EPOCH FROM (NEW.leave_time - NEW.seat_time)) / 60;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_dining_duration
BEFORE INSERT OR UPDATE ON sales_order
FOR EACH ROW
EXECUTE FUNCTION calculate_dining_duration();

COMMENT ON FUNCTION calculate_dining_duration() IS '自动计算就餐时长(分钟)';

-- ----------------------------------------------------------------------------
-- 触发器: 自动计算平台佣金
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calculate_platform_commission()
RETURNS TRIGGER AS $$
DECLARE
    v_commission_rate DECIMAL(5,4);
BEGIN
    IF NEW.platform_type IS NOT NULL THEN
        SELECT default_commission_rate INTO v_commission_rate
        FROM group_buy_platform
        WHERE platform_type = NEW.platform_type
          AND is_active = TRUE
        LIMIT 1;

        IF v_commission_rate IS NOT NULL THEN
            NEW.platform_commission_rate := v_commission_rate;
            NEW.platform_commission_amount := NEW.final_amount * v_commission_rate;
        END IF;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_calculate_platform_commission
BEFORE INSERT OR UPDATE ON sales_order
FOR EACH ROW
EXECUTE FUNCTION calculate_platform_commission();

COMMENT ON FUNCTION calculate_platform_commission() IS '自动计算平台佣金金额';

-- ============================================================================
-- 脚本完成
-- ============================================================================
