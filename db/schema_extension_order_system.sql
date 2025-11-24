-- ============================================================================
-- 野百灵餐饮集团 - 订单系统扩展架构
-- ============================================================================
-- 版本: v1.0.0-order-extension
-- 目的: 支持16项运营指标 + 多渠道销售 + 平台团购
-- 新增表: 6张 (sales_order, sales_order_item, product_package, package_item,
--              group_buy_platform, group_buy_deal)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. sales_order - 订单主表
-- ----------------------------------------------------------------------------
-- 说明: 记录每笔订单的完整信息,支持堂食/外卖/外带,多平台销售
-- ----------------------------------------------------------------------------
CREATE TABLE sales_order (
    order_id BIGSERIAL PRIMARY KEY,
    order_code VARCHAR(50) UNIQUE NOT NULL,          -- 订单编码 (唯一业务主键)

    -- 基础信息
    store_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_datetime TIMESTAMP NOT NULL,               -- 精确下单时间

    -- 订单类型
    order_type VARCHAR(20) NOT NULL,                 -- 'dine_in'|'takeout'|'delivery'
    sales_channel VARCHAR(50),                       -- 'store'|'meituan'|'douyin'|'eleme'

    -- 堂食信息
    table_number VARCHAR(20),                        -- 桌号
    guest_count INT,                                 -- 就餐人数
    seat_time TIMESTAMP,                             -- 入座时间
    leave_time TIMESTAMP,                            -- 离座时间
    dining_duration_minutes INT,                     -- 就餐时长(分钟)

    -- 金额信息
    subtotal_amount DECIMAL(10,2) NOT NULL,          -- 小计金额(折前)
    discount_amount DECIMAL(10,2) DEFAULT 0,         -- 折扣金额
    manual_discount DECIMAL(10,2) DEFAULT 0,         -- 人工折扣
    coupon_discount DECIMAL(10,2) DEFAULT 0,         -- 优惠券折扣
    membership_discount DECIMAL(10,2) DEFAULT 0,     -- 会员折扣
    rounding_amount DECIMAL(10,2) DEFAULT 0,         -- 抹零金额
    final_amount DECIMAL(10,2) NOT NULL,             -- 实收金额(折后)

    -- 支付信息
    payment_method VARCHAR(50),                      -- 'cash'|'wechat'|'alipay'|'card'|'member_balance'
    payment_time TIMESTAMP,

    -- 平台信息(如果是平台订单)
    platform_type VARCHAR(50),                       -- 'meituan'|'douyin'|'eleme'
    platform_order_id VARCHAR(100),                  -- 平台订单号
    platform_commission_rate DECIMAL(5,4),           -- 平台佣金费率(如: 0.08 = 8%)
    platform_commission_amount DECIMAL(10,2),        -- 平台佣金金额

    -- 团购信息(如果使用团购券)
    is_group_buy BOOLEAN DEFAULT FALSE,
    group_buy_deal_id INT,                           -- 关联团购套餐

    -- 服务员与收银员
    waiter_id INT,                                   -- 服务员ID
    cashier_id INT,                                  -- 收银员ID

    -- 订单状态
    order_status VARCHAR(20) DEFAULT 'pending',      -- 'pending'|'confirmed'|'completed'|'cancelled'
    cancel_reason TEXT,
    cancelled_at TIMESTAMP,

    -- 备注
    notes TEXT,
    customer_remarks TEXT,                           -- 客户备注

    -- 时间戳
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

-- 索引优化
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
-- 2. sales_order_item - 订单明细表
-- ----------------------------------------------------------------------------
-- 说明: 记录订单中每个产品的销售明细
-- ----------------------------------------------------------------------------
CREATE TABLE sales_order_item (
    order_item_id BIGSERIAL PRIMARY KEY,
    order_id BIGINT NOT NULL,

    -- 产品信息
    product_id INT NOT NULL,
    product_code VARCHAR(50) NOT NULL,
    product_name VARCHAR(200) NOT NULL,              -- 冗余字段,避免JOIN

    -- 如果是套餐商品
    is_package BOOLEAN DEFAULT FALSE,
    package_id INT,                                  -- 关联套餐定义

    -- 销售数量与单价
    quantity DECIMAL(10,2) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,               -- 原价
    discount_rate DECIMAL(5,4) DEFAULT 0,            -- 折扣率
    actual_price DECIMAL(10,2) NOT NULL,             -- 实际售价(折后)

    -- 金额
    line_subtotal DECIMAL(10,2) NOT NULL,            -- 行小计(折前) = quantity × unit_price
    line_discount DECIMAL(10,2) DEFAULT 0,           -- 行折扣金额
    line_total DECIMAL(10,2) NOT NULL,               -- 行实收(折后)

    -- 成本信息(关联配方)
    recipe_id INT,
    recipe_version VARCHAR(20),
    theoretical_cost DECIMAL(10,2),                  -- 理论成本

    -- 双成本率(GENERATED列)
    standard_cost_rate DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE
            WHEN line_subtotal > 0 THEN
                ROUND((theoretical_cost / line_subtotal) * 100, 2)
            ELSE NULL
        END
    ) STORED,

    actual_cost_rate DECIMAL(5,2) GENERATED ALWAYS AS (
        CASE
            WHEN line_total > 0 THEN
                ROUND((theoretical_cost / line_total) * 100, 2)
            ELSE NULL
        END
    ) STORED,

    -- 备注
    item_notes TEXT,                                 -- 特殊要求(如: 不要香菜)

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

-- 索引优化
CREATE INDEX idx_order_item_order ON sales_order_item(order_id);
CREATE INDEX idx_order_item_product ON sales_order_item(product_id);
CREATE INDEX idx_order_item_package ON sales_order_item(is_package) WHERE is_package = TRUE;

COMMENT ON TABLE sales_order_item IS '订单明细表 - 记录订单中每个产品的销售数据';
COMMENT ON COLUMN sales_order_item.standard_cost_rate IS '标准成本率 = 理论成本 / 销售额(折前) × 100%';
COMMENT ON COLUMN sales_order_item.actual_cost_rate IS '实际成本率 = 理论成本 / 菜品收入(折后) × 100% ⭐核心';

-- ----------------------------------------------------------------------------
-- 3. product_package - 套餐产品定义表
-- ----------------------------------------------------------------------------
-- 说明: 定义套餐组合(如: 双人套餐, 家庭套餐)
-- ----------------------------------------------------------------------------
CREATE TABLE product_package (
    package_id SERIAL PRIMARY KEY,
    package_code VARCHAR(50) UNIQUE NOT NULL,
    package_name VARCHAR(200) NOT NULL,
    package_name_en VARCHAR(200),

    brand_id INT,                                    -- 所属品牌
    category_id INT,

    -- 套餐定价
    selling_price DECIMAL(10,2) NOT NULL,            -- 套餐售价
    original_total_price DECIMAL(10,2),              -- 原价合计(单品加总)
    discount_amount DECIMAL(10,2),                   -- 套餐优惠金额

    -- 套餐说明
    description TEXT,
    image_url VARCHAR(500),

    -- 有效期
    effective_date DATE,
    expiry_date DATE,

    -- 销售限制
    max_daily_sales INT,                             -- 每日限售数量
    is_available_online BOOLEAN DEFAULT TRUE,        -- 是否支持线上销售

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
-- 4. package_item - 套餐明细表
-- ----------------------------------------------------------------------------
-- 说明: 定义套餐包含哪些产品
-- ----------------------------------------------------------------------------
CREATE TABLE package_item (
    package_item_id SERIAL PRIMARY KEY,
    package_id INT NOT NULL,
    product_id INT NOT NULL,

    quantity DECIMAL(10,2) NOT NULL DEFAULT 1.0,     -- 产品数量
    is_optional BOOLEAN DEFAULT FALSE,               -- 是否可选配
    is_main_item BOOLEAN DEFAULT FALSE,              -- 是否主打产品

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
-- 5. group_buy_platform - 团购平台表
-- ----------------------------------------------------------------------------
-- 说明: 管理第三方团购平台(美团/大众点评, 抖音团购等)
-- ----------------------------------------------------------------------------
CREATE TABLE group_buy_platform (
    platform_id SERIAL PRIMARY KEY,
    platform_code VARCHAR(50) UNIQUE NOT NULL,
    platform_name VARCHAR(100) NOT NULL,

    -- 平台类型
    platform_type VARCHAR(20) NOT NULL,              -- 'meituan'|'douyin'|'eleme'|'dianping'

    -- 佣金设置
    default_commission_rate DECIMAL(5,4) NOT NULL,   -- 默认佣金费率(如: 0.08 = 8%)

    -- 结算信息
    settlement_cycle_days INT,                       -- 结算周期(天)
    settlement_account VARCHAR(100),                 -- 结算账号

    -- 联系信息
    contact_person VARCHAR(100),
    contact_phone VARCHAR(50),
    contact_email VARCHAR(100),

    -- API对接信息
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
-- 6. group_buy_deal - 团购套餐表
-- ----------------------------------------------------------------------------
-- 说明: 记录在各平台上线的团购套餐
-- ----------------------------------------------------------------------------
CREATE TABLE group_buy_deal (
    deal_id SERIAL PRIMARY KEY,
    deal_code VARCHAR(50) UNIQUE NOT NULL,
    deal_name VARCHAR(200) NOT NULL,

    -- 平台信息
    platform_id INT NOT NULL,
    platform_deal_id VARCHAR(100),                   -- 平台侧的团购ID

    -- 关联店铺与产品
    store_id INT,                                    -- NULL=所有门店通用
    package_id INT,                                  -- 关联套餐定义

    -- 价格信息
    original_price DECIMAL(10,2) NOT NULL,           -- 门店原价
    deal_price DECIMAL(10,2) NOT NULL,               -- 团购价
    discount_amount DECIMAL(10,2),                   -- 优惠金额

    -- 佣金
    commission_rate DECIMAL(5,4),                    -- 此套餐的佣金费率(覆盖平台默认值)

    -- 销售限制
    max_purchases_per_user INT,                      -- 每人限购数量
    daily_stock INT,                                 -- 每日库存
    total_stock INT,                                 -- 总库存
    sold_count INT DEFAULT 0,                        -- 已售数量

    -- 有效期
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,

    -- 核销规则
    need_appointment BOOLEAN DEFAULT FALSE,          -- 是否需要预约
    valid_hours JSON,                                -- 可用时段 {"weekday": "11:00-21:00"}
    exclude_dates JSON,                              -- 排除日期 ["2025-01-01", "2025-02-10"]

    -- 状态
    status VARCHAR(20) DEFAULT 'active',             -- 'active'|'paused'|'sold_out'|'expired'

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
            WHERE order_id = NEW.order_id
        ),
        discount_amount = (
            SELECT COALESCE(SUM(line_discount), 0)
            FROM sales_order_item
            WHERE order_id = NEW.order_id
        ),
        final_amount = (
            SELECT COALESCE(SUM(line_total), 0)
            FROM sales_order_item
            WHERE order_id = NEW.order_id
        ),
        updated_at = NOW()
    WHERE order_id = NEW.order_id;

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
        -- 从平台表获取默认佣金费率
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
