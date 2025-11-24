-- ============================================================
-- 线上平台运营数据表结构
-- 支持美团、点评等平台的日粒度运营数据
-- 创建时间: 2025-11-24
-- ============================================================

-- 1. 平台定义表
CREATE TABLE IF NOT EXISTS online_platform (
    platform_id SERIAL PRIMARY KEY,
    platform_code VARCHAR(20) UNIQUE NOT NULL,      -- 'meituan', 'dianping'
    platform_name VARCHAR(100) NOT NULL,            -- '美团', '大众点评'
    platform_type VARCHAR(20),                      -- 'group_buy', 'review', 'delivery'
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW()
);

-- 初始化平台数据
INSERT INTO online_platform (platform_code, platform_name, platform_type) VALUES
    ('meituan', '美团', 'group_buy'),
    ('dianping', '大众点评', 'review')
ON CONFLICT (platform_code) DO NOTHING;

-- 2. 门店平台账号关联表
CREATE TABLE IF NOT EXISTS store_platform_account (
    account_id SERIAL PRIMARY KEY,
    store_id INT NOT NULL,                          -- 关联门店
    platform_id INT NOT NULL,                       -- 关联平台
    platform_store_id VARCHAR(50),                  -- 平台门店ID (如美团门店ID)
    platform_store_name VARCHAR(200),               -- 平台上的门店名称
    bindingdate DATE,                              -- 绑定日期
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_spa_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_spa_platform FOREIGN KEY (platform_id) REFERENCES online_platform(platform_id),
    CONSTRAINT uk_store_platform UNIQUE (store_id, platform_id)
);

-- 3. 平台日运营数据主表 (核心流量+交易汇总)
CREATE TABLE IF NOT EXISTS platform_daily_metrics (
    metric_id SERIAL PRIMARY KEY,

    -- 维度字段
    report_date DATE NOT NULL,                      -- 统计日期
    store_id INT NOT NULL,                          -- 门店ID
    platform_id INT NOT NULL,                       -- 平台ID

    -- 基础信息
    province VARCHAR(50),                           -- 省份
    city VARCHAR(50),                               -- 城市
    business_area VARCHAR(100),                     -- 归属商圈

    -- ========== 门店流量 ==========
    -- 曝光
    exposure_count INT DEFAULT 0,                   -- 曝光次数
    exposure_users INT DEFAULT 0,                   -- 曝光人数
    exposure_users_search INT DEFAULT 0,            -- 曝光人数-搜索
    exposure_users_food_channel INT DEFAULT 0,      -- 曝光人数-美食频道
    exposure_users_feed INT DEFAULT 0,              -- 曝光人数-首页信息流

    -- 访问
    visit_count INT DEFAULT 0,                      -- 访问次数
    visit_users INT DEFAULT 0,                      -- 访问人数
    visit_users_search INT DEFAULT 0,               -- 访问人数-搜索
    visit_users_food_channel INT DEFAULT 0,         -- 访问人数-美食频道
    visit_users_feed INT DEFAULT 0,                 -- 访问人数-首页信息流

    -- 转化率
    exposure_visit_rate DECIMAL(8,4),               -- 曝光-访问转化率
    exposure_visit_rate_search DECIMAL(8,4),        -- 曝光-访问转化率-搜索
    exposure_visit_rate_food_channel DECIMAL(8,4),  -- 曝光-访问转化率-美食频道
    exposure_visit_rate_feed DECIMAL(8,4),          -- 曝光-访问转化率-首页信息流

    -- 购买
    purchase_users INT DEFAULT 0,                   -- 购买人数
    purchase_users_search INT DEFAULT 0,            -- 购买人数-搜索
    purchase_users_food_channel INT DEFAULT 0,      -- 购买人数-美食频道
    purchase_users_feed INT DEFAULT 0,              -- 购买人数-首页信息流

    -- 访问-购买转化率
    visit_purchase_rate DECIMAL(8,4),               -- 访问-购买转化率
    visit_purchase_rate_search DECIMAL(8,4),
    visit_purchase_rate_food_channel DECIMAL(8,4),
    visit_purchase_rate_feed DECIMAL(8,4),

    -- 互动
    interaction_users INT DEFAULT 0,                -- 互动人数
    new_favorite_users INT DEFAULT 0,               -- 新增收藏人数
    total_favorite_users INT DEFAULT 0,             -- 累计收藏人数
    checkin_users INT DEFAULT 0,                    -- 打卡人数
    view_coupon_users INT DEFAULT 0,                -- 查看优惠人数
    view_dish_users INT DEFAULT 0,                  -- 查看菜品人数
    view_review_users INT DEFAULT 0,                -- 查看评价人数
    view_contact_users INT DEFAULT 0,               -- 查看地址/电话人数

    -- ========== 门店交易 ==========
    -- 成交金额(优惠前)
    gmv_before_discount DECIMAL(12,2) DEFAULT 0,           -- 成交金额(优惠前)
    gmv_before_discount_package DECIMAL(12,2) DEFAULT 0,   -- 成交金额(优惠前)-套餐
    gmv_before_discount_voucher DECIMAL(12,2) DEFAULT 0,   -- 成交金额(优惠前)-代金券
    gmv_before_discount_bill DECIMAL(12,2) DEFAULT 0,      -- 成交金额(优惠前)-买单

    -- 成交订单数
    order_count INT DEFAULT 0,                      -- 成交订单数
    order_count_package INT DEFAULT 0,              -- 成交订单数-套餐
    order_count_voucher INT DEFAULT 0,              -- 成交订单数-代金券
    order_count_bill INT DEFAULT 0,                 -- 成交订单数-买单

    -- 成交券数
    coupon_count_package INT DEFAULT 0,             -- 成交券数-套餐
    coupon_count_voucher INT DEFAULT 0,             -- 成交券数-代金券

    -- 成交人数
    transaction_users INT DEFAULT 0,                -- 成交人数
    transaction_users_package INT DEFAULT 0,        -- 成交人数-套餐
    transaction_users_voucher INT DEFAULT 0,        -- 成交人数-代金券
    transaction_users_bill INT DEFAULT 0,           -- 成交人数-买单

    -- 成交金额(优惠后)
    gmv_after_discount DECIMAL(12,2) DEFAULT 0,            -- 成交金额(优惠后)
    gmv_after_discount_package DECIMAL(12,2) DEFAULT 0,
    gmv_after_discount_voucher DECIMAL(12,2) DEFAULT 0,
    gmv_after_discount_bill DECIMAL(12,2) DEFAULT 0,

    -- 用户实付/平台补贴
    user_paid_amount DECIMAL(12,2) DEFAULT 0,              -- 用户实付金额
    user_paid_amount_package DECIMAL(12,2) DEFAULT 0,
    user_paid_amount_voucher DECIMAL(12,2) DEFAULT 0,
    user_paid_amount_bill DECIMAL(12,2) DEFAULT 0,
    platform_subsidy DECIMAL(12,2) DEFAULT 0,              -- 平台补贴金额
    platform_subsidy_package DECIMAL(12,2) DEFAULT 0,
    platform_subsidy_voucher DECIMAL(12,2) DEFAULT 0,
    platform_subsidy_bill DECIMAL(12,2) DEFAULT 0,

    -- 消费(核销)
    consume_amount DECIMAL(12,2) DEFAULT 0,                -- 消费金额
    consume_amount_package DECIMAL(12,2) DEFAULT 0,        -- 核销金额-套餐
    consume_amount_voucher DECIMAL(12,2) DEFAULT 0,        -- 核销金额-代金券
    consume_count INT DEFAULT 0,                           -- 消费笔数
    consume_coupon_package INT DEFAULT 0,                  -- 核销券数-套餐
    consume_coupon_voucher INT DEFAULT 0,                  -- 核销券数-代金券
    consume_users INT DEFAULT 0,                           -- 消费人数
    consume_users_package INT DEFAULT 0,                   -- 核销人数-套餐
    consume_users_voucher INT DEFAULT 0,                   -- 核销人数-代金券

    -- 退款
    refund_amount DECIMAL(12,2) DEFAULT 0,                 -- 退款金额
    refund_amount_package DECIMAL(12,2) DEFAULT 0,
    refund_amount_voucher DECIMAL(12,2) DEFAULT 0,
    refund_amount_bill DECIMAL(12,2) DEFAULT 0,
    refund_coupon_package INT DEFAULT 0,                   -- 退款券数-套餐
    refund_coupon_voucher INT DEFAULT 0,                   -- 退款券数-代金券
    refund_order_count INT DEFAULT 0,                      -- 退款订单数
    refund_order_count_bill INT DEFAULT 0,                 -- 退款订单数-买单

    -- 新老客
    new_customer_users INT DEFAULT 0,                      -- 新客购买人数
    old_customer_users INT DEFAULT 0,                      -- 老客购买人数
    new_customer_gmv DECIMAL(12,2) DEFAULT 0,              -- 新客成交金额(优惠后)
    old_customer_gmv DECIMAL(12,2) DEFAULT 0,              -- 老客成交金额(优惠后)

    -- ========== 线下扫码 ==========
    scan_users INT DEFAULT 0,                       -- 扫码人数
    scan_checkin_users INT DEFAULT 0,               -- 扫码打卡人数
    scan_favorite_users INT DEFAULT 0,              -- 扫码收藏人数
    scan_review_users INT DEFAULT 0,                -- 扫码评价人数

    -- ========== 门店评价 ==========
    total_review_count INT DEFAULT 0,               -- 全部评价数
    total_positive_count INT DEFAULT 0,             -- 全部好评数
    positive_rate DECIMAL(5,4),                     -- 好评率
    total_negative_count INT DEFAULT 0,             -- 全部中差评数
    new_review_count INT DEFAULT 0,                 -- 新评价数
    new_positive_count INT DEFAULT 0,               -- 新好评数
    new_negative_count INT DEFAULT 0,               -- 新中差评数
    negative_reply_rate DECIMAL(5,4),               -- 新中差评回复率

    -- ========== 门店星级/榜单 (平台特有) ==========
    platform_star_rating DECIMAL(3,1),              -- 平台星级 (美团星级/点评星级)
    ranking_popularity INT,                         -- 人气榜排名 (美团人气榜/点评热门榜)
    ranking_sales INT,                              -- 销量榜排名 (点评销量榜)

    -- 元数据
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_pdm_store FOREIGN KEY (store_id) REFERENCES store(store_id),
    CONSTRAINT fk_pdm_platform FOREIGN KEY (platform_id) REFERENCES online_platform(platform_id),
    CONSTRAINT uk_platform_daily UNIQUE (report_date, store_id, platform_id)
);

-- 创建索引
CREATE INDEX IF NOT EXISTS idx_pdm_date ON platform_daily_metrics(report_date);
CREATE INDEX IF NOT EXISTS idx_pdm_store ON platform_daily_metrics(store_id);
CREATE INDEX IF NOT EXISTS idx_pdm_platform ON platform_daily_metrics(platform_id);
CREATE INDEX IF NOT EXISTS idx_pdm_date_store ON platform_daily_metrics(report_date, store_id);

-- 4. 创建汇总视图
CREATE OR REPLACE VIEW v_platform_monthly_summary AS
SELECT
    DATE_TRUNC('month', report_date) AS report_month,
    s.store_name,
    op.platform_name,

    -- 流量汇总
    SUM(exposure_count) AS total_exposure,
    SUM(visit_users) AS total_visitors,
    AVG(exposure_visit_rate) AS avg_visit_rate,

    -- 交易汇总
    SUM(gmv_before_discount) AS total_gmv_before,
    SUM(gmv_after_discount) AS total_gmv_after,
    SUM(order_count) AS total_orders,
    SUM(transaction_users) AS total_buyers,

    -- 核销汇总
    SUM(consume_amount) AS total_consumed,
    SUM(consume_count) AS total_consume_count,

    -- 退款汇总
    SUM(refund_amount) AS total_refund,

    -- 新老客
    SUM(new_customer_users) AS total_new_customers,
    SUM(old_customer_users) AS total_old_customers,

    -- 评价汇总
    AVG(positive_rate) AS avg_positive_rate,
    SUM(new_review_count) AS total_new_reviews

FROM platform_daily_metrics pdm
JOIN store s ON pdm.store_id = s.store_id
JOIN online_platform op ON pdm.platform_id = op.platform_id
GROUP BY DATE_TRUNC('month', report_date), s.store_name, op.platform_name
ORDER BY report_month DESC, s.store_name, op.platform_name;

COMMENT ON TABLE online_platform IS '线上平台定义表';
COMMENT ON TABLE store_platform_account IS '门店平台账号关联表';
COMMENT ON TABLE platform_daily_metrics IS '平台日运营数据主表 - 存储美团/点评等平台的日粒度运营数据';
COMMENT ON VIEW v_platform_monthly_summary IS '平台月度汇总视图';
