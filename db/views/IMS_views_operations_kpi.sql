-- ============================================================================
-- 野百灵餐饮集团 - 运营KPI分析视图
-- ============================================================================
-- 版本: v1.0.0-operations-kpi
-- 目的: 支持16项核心运营指标 + 多渠道销售分析 + 平台团购分析
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. v_store_daily_operations - 门店每日运营指标视图 ⭐核心
-- ----------------------------------------------------------------------------
-- 说明: 计算16项核心运营指标,对应Excel中的基础运营数据
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_store_daily_operations AS
SELECT
    so.store_id,
    s.store_name,
    so.order_date,

    -- ========== 基础运营指标 (16项) ==========

    -- 1. 订单数量
    COUNT(DISTINCT so.order_id) AS order_count,

    -- 2. 就餐人数
    SUM(so.guest_count) AS total_guest_count,

    -- 3. 开台数(只统计堂食)
    COUNT(DISTINCT CASE WHEN so.order_type = 'dine_in' THEN so.table_number END) AS table_count,

    -- 4. 平均就餐时长(分钟)
    ROUND(AVG(CASE WHEN so.order_type = 'dine_in' THEN so.dining_duration_minutes END), 2) AS avg_dining_duration_minutes,

    -- 5. 平均用餐人数
    ROUND(AVG(so.guest_count), 2) AS avg_guest_count_per_order,

    -- 6. 人均消费(元)
    ROUND(SUM(so.final_amount) / NULLIF(SUM(so.guest_count), 0), 2) AS per_capita_spending,

    -- 7. 客单价(元)
    ROUND(AVG(so.final_amount), 2) AS avg_order_value,

    -- 8. 翻台率(仅堂食)
    ROUND(
        COUNT(DISTINCT CASE WHEN so.order_type = 'dine_in' THEN so.table_number END)::DECIMAL /
        NULLIF(COUNT(DISTINCT CASE WHEN so.order_type = 'dine_in' THEN so.table_number END), 0),
        2
    ) AS table_turnover_rate,

    -- 9. 销售额(折前)
    SUM(so.subtotal_amount) AS total_presales_amount,

    -- 10. 实收金额(折后)
    SUM(so.final_amount) AS total_final_amount,

    -- 11. 折扣金额
    SUM(so.discount_amount) AS total_discount_amount,

    -- 12. 折扣率(%)
    ROUND(SUM(so.discount_amount) / NULLIF(SUM(so.subtotal_amount), 0) * 100, 2) AS discount_rate,

    -- 13. 人工折扣
    SUM(so.manual_discount) AS total_manual_discount,

    -- 14. 优惠券折扣
    SUM(so.coupon_discount) AS total_coupon_discount,

    -- 15. 会员折扣
    SUM(so.membership_discount) AS total_membership_discount,

    -- 16. 抹零金额
    SUM(so.rounding_amount) AS total_rounding_amount,

    -- ========== 扩展指标 ==========

    -- 订单类型分布
    COUNT(DISTINCT CASE WHEN so.order_type = 'dine_in' THEN so.order_id END) AS dine_in_orders,
    COUNT(DISTINCT CASE WHEN so.order_type = 'takeout' THEN so.order_id END) AS takeout_orders,
    COUNT(DISTINCT CASE WHEN so.order_type = 'delivery' THEN so.order_id END) AS delivery_orders,

    -- 团购订单统计
    COUNT(DISTINCT CASE WHEN so.is_group_buy = TRUE THEN so.order_id END) AS groupbuy_order_count,
    SUM(CASE WHEN so.is_group_buy = TRUE THEN so.final_amount ELSE 0 END) AS groupbuy_revenue,

    -- 平台佣金统计
    SUM(COALESCE(so.platform_commission_amount, 0)) AS total_platform_commission,

    -- 净收入(扣除平台佣金后)
    SUM(so.final_amount) - SUM(COALESCE(so.platform_commission_amount, 0)) AS net_revenue_after_commission

FROM sales_order so
JOIN store s ON so.store_id = s.store_id
WHERE so.order_status = 'completed'
GROUP BY so.store_id, s.store_name, so.order_date;

COMMENT ON VIEW v_store_daily_operations IS '⭐门店每日运营指标视图 - 16项核心KPI';

-- ----------------------------------------------------------------------------
-- 2. v_payment_channel_analysis - 支付渠道分析视图
-- ----------------------------------------------------------------------------
-- 说明: 分析不同支付方式的使用情况
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_payment_channel_analysis AS
SELECT
    so.store_id,
    s.store_name,
    so.order_date,
    so.payment_method,

    -- 订单数量
    COUNT(DISTINCT so.order_id) AS order_count,

    -- 交易金额
    SUM(so.final_amount) AS total_amount,

    -- 平均订单金额
    ROUND(AVG(so.final_amount), 2) AS avg_order_amount,

    -- 占比(%)
    ROUND(
        SUM(so.final_amount) * 100.0 /
        SUM(SUM(so.final_amount)) OVER (PARTITION BY so.store_id, so.order_date),
        2
    ) AS revenue_percentage

FROM sales_order so
JOIN store s ON so.store_id = s.store_id
WHERE so.order_status = 'completed'
  AND so.payment_method IS NOT NULL
GROUP BY so.store_id, s.store_name, so.order_date, so.payment_method;

COMMENT ON VIEW v_payment_channel_analysis IS '支付渠道分析视图';

-- ----------------------------------------------------------------------------
-- 3. v_sales_channel_analysis - 销售渠道分析视图
-- ----------------------------------------------------------------------------
-- 说明: 分析堂食/外卖/外带等不同渠道的销售情况
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_sales_channel_analysis AS
SELECT
    so.store_id,
    s.store_name,
    so.order_date,
    so.order_type,                                   -- 'dine_in'|'takeout'|'delivery'
    so.sales_channel,                                -- 'store'|'meituan'|'douyin'

    -- 订单数量
    COUNT(DISTINCT so.order_id) AS order_count,

    -- 就餐人数
    SUM(so.guest_count) AS total_guest_count,

    -- 销售额
    SUM(so.subtotal_amount) AS total_presales_amount,
    SUM(so.final_amount) AS total_final_amount,
    SUM(so.discount_amount) AS total_discount_amount,

    -- 平均客单价
    ROUND(AVG(so.final_amount), 2) AS avg_order_value,

    -- 平台佣金(如果是平台订单)
    SUM(COALESCE(so.platform_commission_amount, 0)) AS total_platform_commission,

    -- 净收入
    SUM(so.final_amount) - SUM(COALESCE(so.platform_commission_amount, 0)) AS net_revenue,

    -- 渠道占比(%)
    ROUND(
        SUM(so.final_amount) * 100.0 /
        SUM(SUM(so.final_amount)) OVER (PARTITION BY so.store_id, so.order_date),
        2
    ) AS revenue_percentage

FROM sales_order so
JOIN store s ON so.store_id = s.store_id
WHERE so.order_status = 'completed'
GROUP BY so.store_id, s.store_name, so.order_date, so.order_type, so.sales_channel;

COMMENT ON VIEW v_sales_channel_analysis IS '销售渠道分析视图 - 堂食/外卖/平台';

-- ----------------------------------------------------------------------------
-- 4. v_platform_groupbuy_summary - 平台团购汇总视图
-- ----------------------------------------------------------------------------
-- 说明: 对比不同平台团购的销售效果(美团 vs 抖音)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_platform_groupbuy_summary AS
SELECT
    so.store_id,
    s.store_name,
    so.order_date,
    so.platform_type,
    gbp.platform_name,

    -- 订单数量
    COUNT(DISTINCT so.order_id) AS order_count,

    -- 销售金额
    SUM(so.final_amount) AS total_revenue,

    -- 平均订单金额
    ROUND(AVG(so.final_amount), 2) AS avg_order_amount,

    -- 平台佣金
    AVG(so.platform_commission_rate) AS avg_commission_rate,
    SUM(so.platform_commission_amount) AS total_commission_amount,

    -- 净收入(扣除佣金)
    SUM(so.final_amount) - SUM(so.platform_commission_amount) AS net_revenue,

    -- 佣金占比(%)
    ROUND(
        SUM(so.platform_commission_amount) / NULLIF(SUM(so.final_amount), 0) * 100,
        2
    ) AS commission_percentage

FROM sales_order so
JOIN store s ON so.store_id = s.store_id
LEFT JOIN group_buy_platform gbp ON so.platform_type = gbp.platform_type
WHERE so.order_status = 'completed'
  AND so.is_group_buy = TRUE
  AND so.platform_type IS NOT NULL
GROUP BY so.store_id, s.store_name, so.order_date, so.platform_type, gbp.platform_name;

COMMENT ON VIEW v_platform_groupbuy_summary IS '平台团购汇总视图 - 美团/抖音对比';

-- ----------------------------------------------------------------------------
-- 5. v_product_sales_ranking - 产品销售排行榜视图
-- ----------------------------------------------------------------------------
-- 说明: 按销售额、销量、利润排序产品
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_product_sales_ranking AS
SELECT
    soi.product_id,
    p.product_code,
    p.product_name,
    pc.category_name,

    so.store_id,
    s.store_name,
    so.order_date,

    -- 销售数量
    SUM(soi.quantity) AS total_quantity,

    -- 销售金额
    SUM(soi.line_subtotal) AS total_presales_amount,
    SUM(soi.line_total) AS total_final_amount,
    SUM(soi.line_discount) AS total_discount_amount,

    -- 理论成本
    SUM(soi.theoretical_cost) AS total_theoretical_cost,

    -- 双成本率
    ROUND(
        SUM(soi.theoretical_cost) / NULLIF(SUM(soi.line_subtotal), 0) * 100,
        2
    ) AS standard_cost_rate,

    ROUND(
        SUM(soi.theoretical_cost) / NULLIF(SUM(soi.line_total), 0) * 100,
        2
    ) AS actual_cost_rate,

    -- 毛利
    SUM(soi.line_total) - SUM(soi.theoretical_cost) AS gross_profit,

    -- 毛利率(%)
    ROUND(
        (SUM(soi.line_total) - SUM(soi.theoretical_cost)) /
        NULLIF(SUM(soi.line_total), 0) * 100,
        2
    ) AS gross_margin_rate,

    -- 订单数(出现在多少个订单中)
    COUNT(DISTINCT soi.order_id) AS order_count

FROM sales_order_item soi
JOIN sales_order so ON soi.order_id = so.order_id
JOIN product p ON soi.product_id = p.product_id
LEFT JOIN product_category pc ON p.category_id = pc.category_id
JOIN store s ON so.store_id = s.store_id
WHERE so.order_status = 'completed'
GROUP BY soi.product_id, p.product_code, p.product_name, pc.category_name,
         so.store_id, s.store_name, so.order_date;

COMMENT ON VIEW v_product_sales_ranking IS '产品销售排行榜视图 - 含双成本率';

-- ----------------------------------------------------------------------------
-- 6. v_hourly_sales_distribution - 小时销售分布视图
-- ----------------------------------------------------------------------------
-- 说明: 分析一天中不同时段的销售情况
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_hourly_sales_distribution AS
SELECT
    so.store_id,
    s.store_name,
    so.order_date,
    EXTRACT(HOUR FROM so.order_datetime) AS hour_of_day,

    -- 订单数量
    COUNT(DISTINCT so.order_id) AS order_count,

    -- 就餐人数
    SUM(so.guest_count) AS total_guest_count,

    -- 销售金额
    SUM(so.final_amount) AS total_revenue,

    -- 平均订单金额
    ROUND(AVG(so.final_amount), 2) AS avg_order_amount

FROM sales_order so
JOIN store s ON so.store_id = s.store_id
WHERE so.order_status = 'completed'
GROUP BY so.store_id, s.store_name, so.order_date, EXTRACT(HOUR FROM so.order_datetime);

COMMENT ON VIEW v_hourly_sales_distribution IS '小时销售分布视图 - 时段分析';

-- ----------------------------------------------------------------------------
-- 7. v_waiter_performance - 服务员绩效分析视图
-- ----------------------------------------------------------------------------
-- 说明: 统计服务员的接单数量、销售额、客户满意度等
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_waiter_performance AS
SELECT
    so.waiter_id,
    e.employee_name AS waiter_name,
    so.store_id,
    s.store_name,
    so.order_date,

    -- 接单数量
    COUNT(DISTINCT so.order_id) AS order_count,

    -- 服务人数
    SUM(so.guest_count) AS total_guest_count,

    -- 销售金额
    SUM(so.final_amount) AS total_revenue,

    -- 平均客单价
    ROUND(AVG(so.final_amount), 2) AS avg_order_value,

    -- 平均就餐时长(分钟)
    ROUND(AVG(so.dining_duration_minutes), 2) AS avg_dining_duration

FROM sales_order so
JOIN store s ON so.store_id = s.store_id
LEFT JOIN employee e ON so.waiter_id = e.employee_id
WHERE so.order_status = 'completed'
  AND so.waiter_id IS NOT NULL
GROUP BY so.waiter_id, e.employee_name, so.store_id, s.store_name, so.order_date;

COMMENT ON VIEW v_waiter_performance IS '服务员绩效分析视图';

-- ----------------------------------------------------------------------------
-- 8. v_package_sales_analysis - 套餐销售分析视图
-- ----------------------------------------------------------------------------
-- 说明: 分析套餐产品的销售情况
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_package_sales_analysis AS
SELECT
    pkg.package_id,
    pkg.package_code,
    pkg.package_name,

    so.store_id,
    s.store_name,
    so.order_date,

    -- 销售数量
    SUM(soi.quantity) AS total_quantity,

    -- 销售金额
    SUM(soi.line_total) AS total_revenue,

    -- 平均售价
    ROUND(AVG(soi.actual_price), 2) AS avg_selling_price,

    -- 标准售价(套餐定义)
    pkg.selling_price AS standard_selling_price,

    -- 折扣情况
    SUM(soi.line_discount) AS total_discount,

    -- 订单数
    COUNT(DISTINCT soi.order_id) AS order_count

FROM sales_order_item soi
JOIN sales_order so ON soi.order_id = so.order_id
JOIN product_package pkg ON soi.package_id = pkg.package_id
JOIN store s ON so.store_id = s.store_id
WHERE so.order_status = 'completed'
  AND soi.is_package = TRUE
GROUP BY pkg.package_id, pkg.package_code, pkg.package_name, pkg.selling_price,
         so.store_id, s.store_name, so.order_date;

COMMENT ON VIEW v_package_sales_analysis IS '套餐销售分析视图';

-- ----------------------------------------------------------------------------
-- 9. v_groupbuy_deal_performance - 团购套餐效果分析视图
-- ----------------------------------------------------------------------------
-- 说明: 分析各团购套餐的销售效果和ROI
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_groupbuy_deal_performance AS
SELECT
    gbd.deal_id,
    gbd.deal_code,
    gbd.deal_name,
    gbp.platform_name,
    s.store_name,

    -- 套餐定价
    gbd.original_price,
    gbd.deal_price,
    gbd.discount_amount,
    ROUND((gbd.discount_amount / gbd.original_price) * 100, 2) AS discount_percentage,

    -- 销售情况
    gbd.sold_count,
    gbd.total_stock,
    CASE
        WHEN gbd.total_stock > 0 THEN
            ROUND((gbd.sold_count::DECIMAL / gbd.total_stock) * 100, 2)
        ELSE NULL
    END AS sellout_rate,

    -- 营收统计
    gbd.sold_count * gbd.deal_price AS total_revenue,
    gbd.sold_count * gbd.deal_price * COALESCE(gbd.commission_rate, gbp.default_commission_rate) AS total_commission,
    gbd.sold_count * gbd.deal_price * (1 - COALESCE(gbd.commission_rate, gbp.default_commission_rate)) AS net_revenue,

    -- 有效期
    gbd.start_date,
    gbd.end_date,
    CURRENT_DATE - gbd.start_date AS days_since_launch,

    -- 状态
    gbd.status

FROM group_buy_deal gbd
JOIN group_buy_platform gbp ON gbd.platform_id = gbp.platform_id
LEFT JOIN store s ON gbd.store_id = s.store_id;

COMMENT ON VIEW v_groupbuy_deal_performance IS '团购套餐效果分析视图';

-- ----------------------------------------------------------------------------
-- 10. v_monthly_summary - 月度汇总视图
-- ----------------------------------------------------------------------------
-- 说明: 按月汇总关键运营指标
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_monthly_summary AS
SELECT
    so.store_id,
    s.store_name,
    EXTRACT(YEAR FROM so.order_date) AS year,
    EXTRACT(MONTH FROM so.order_date) AS month,
    TO_CHAR(so.order_date, 'YYYY-MM') AS year_month,

    -- 营业天数
    COUNT(DISTINCT so.order_date) AS operating_days,

    -- 订单数量
    COUNT(DISTINCT so.order_id) AS total_order_count,

    -- 就餐人数
    SUM(so.guest_count) AS total_guest_count,

    -- 销售金额
    SUM(so.subtotal_amount) AS total_presales_amount,
    SUM(so.final_amount) AS total_final_amount,
    SUM(so.discount_amount) AS total_discount_amount,

    -- 平均指标
    ROUND(AVG(so.final_amount), 2) AS avg_order_value,
    ROUND(SUM(so.final_amount) / NULLIF(SUM(so.guest_count), 0), 2) AS per_capita_spending,

    -- 折扣率
    ROUND(SUM(so.discount_amount) / NULLIF(SUM(so.subtotal_amount), 0) * 100, 2) AS discount_rate,

    -- 平台佣金
    SUM(COALESCE(so.platform_commission_amount, 0)) AS total_platform_commission,

    -- 净收入
    SUM(so.final_amount) - SUM(COALESCE(so.platform_commission_amount, 0)) AS net_revenue

FROM sales_order so
JOIN store s ON so.store_id = s.store_id
WHERE so.order_status = 'completed'
GROUP BY so.store_id, s.store_name,
         EXTRACT(YEAR FROM so.order_date),
         EXTRACT(MONTH FROM so.order_date),
         TO_CHAR(so.order_date, 'YYYY-MM');

COMMENT ON VIEW v_monthly_summary IS '月度汇总视图 - 核心运营指标';

-- ============================================================================
-- 示例查询
-- ============================================================================

-- 查询门店2025年11月每日运营指标
COMMENT ON VIEW v_store_daily_operations IS '
示例查询:
SELECT * FROM v_store_daily_operations
WHERE store_id = 1
  AND order_date >= ''2025-11-01''
  AND order_date < ''2025-12-01''
ORDER BY order_date DESC;
';

-- 对比不同平台团购效果(美团 vs 抖音)
COMMENT ON VIEW v_platform_groupbuy_summary IS '
示例查询:
SELECT
    platform_name,
    SUM(order_count) AS total_orders,
    SUM(total_revenue) AS total_revenue,
    AVG(avg_commission_rate) AS avg_commission_rate,
    SUM(net_revenue) AS net_revenue
FROM v_platform_groupbuy_summary
WHERE order_date >= ''2025-11-01''
  AND order_date < ''2025-12-01''
GROUP BY platform_name;
';

-- 查询产品销售排行榜(按毛利率降序)
COMMENT ON VIEW v_product_sales_ranking IS '
示例查询:
SELECT * FROM v_product_sales_ranking
WHERE store_id = 1
  AND order_date >= ''2025-11-01''
  AND order_date < ''2025-12-01''
ORDER BY gross_margin_rate DESC
LIMIT 20;
';

-- ============================================================================
-- 脚本完成
-- ============================================================================
