-- ============================================================================
-- 野百灵餐饮集团 - 财务分析视图
-- ============================================================================
-- 版本: v1.0.0-mvp
-- 核心: 双成本率分析视图 + 跨店对比
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. v_sales_summary_dual_cost_rate - 双成本率核心分析视图 ★★★
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_sales_summary_dual_cost_rate AS
SELECT
    sd.store_id,
    s.store_name,
    s.store_code,
    sd.sales_date,
    EXTRACT(YEAR FROM sd.sales_date) AS year,
    EXTRACT(MONTH FROM sd.sales_date) AS month,
    TO_CHAR(sd.sales_date, 'YYYY-MM') AS year_month,

    sd.product_id,
    p.product_name,
    p.product_code,
    pc.category_name,

    -- 核心数据
    COUNT(*) AS transaction_count,
    SUM(sd.sales_quantity) AS total_quantity,
    SUM(sd.presales_amount) AS total_presales,
    SUM(sd.product_revenue) AS total_revenue,
    SUM(sd.product_discount) AS total_discount,

    AVG(sd.discount_rate) AS avg_discount_rate,
    ROUND(SUM(sd.product_discount) / NULLIF(SUM(sd.presales_amount), 0) * 100, 2) AS actual_discount_rate,

    SUM(sd.theoretical_cost) AS total_theoretical_cost,

    -- ★标准成本率 = 理论成本 / 销售额(折前)
    ROUND(SUM(sd.theoretical_cost) / NULLIF(SUM(sd.presales_amount), 0) * 100, 2) AS standard_cost_rate,

    -- ★★实际成本率 = 理论成本 / 菜品收入(折后)
    ROUND(SUM(sd.theoretical_cost) / NULLIF(SUM(sd.product_revenue), 0) * 100, 2) AS actual_cost_rate,

    -- 成本率差异
    ROUND(
        (SUM(sd.theoretical_cost) / NULLIF(SUM(sd.product_revenue), 0) - SUM(sd.theoretical_cost) / NULLIF(SUM(sd.presales_amount), 0)) * 100, 2
    ) AS cost_rate_variance,

    -- 实际毛利率
    ROUND((SUM(sd.product_revenue) - SUM(sd.theoretical_cost)) / NULLIF(SUM(sd.product_revenue), 0) * 100, 2) AS actual_gross_margin_rate,

    -- 标准毛利率
    ROUND((SUM(sd.presales_amount) - SUM(sd.theoretical_cost)) / NULLIF(SUM(sd.presales_amount), 0) * 100, 2) AS standard_gross_margin_rate,

    -- 毛利侵蚀
    ROUND(
        ((SUM(sd.presales_amount) - SUM(sd.theoretical_cost)) / NULLIF(SUM(sd.presales_amount), 0))
        - ((SUM(sd.product_revenue) - SUM(sd.theoretical_cost)) / NULLIF(SUM(sd.product_revenue), 0))
    * 100, 2) AS margin_erosion_rate

FROM sales_detail sd
JOIN store s ON sd.store_id = s.store_id
JOIN product p ON sd.product_id = p.product_id
LEFT JOIN product_category pc ON p.category_id = pc.category_id
WHERE sd.is_refunded = FALSE
GROUP BY sd.store_id, s.store_name, s.store_code, sd.sales_date,
         sd.product_id, p.product_name, p.product_code, pc.category_name;

COMMENT ON VIEW v_sales_summary_dual_cost_rate IS '★★★双成本率核心分析视图 - BI分析基础';

-- ----------------------------------------------------------------------------
-- 2. v_cross_store_comparison - 跨店对比视图
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_cross_store_comparison AS
SELECT
    year_month,
    product_name,
    MAX(CASE WHEN store_id = 1 THEN actual_cost_rate END) AS store1_cost_rate,
    MAX(CASE WHEN store_id = 2 THEN actual_cost_rate END) AS store2_cost_rate,
    ABS(MAX(CASE WHEN store_id = 1 THEN actual_cost_rate END) -
        MAX(CASE WHEN store_id = 2 THEN actual_cost_rate END)) AS rate_difference
FROM v_sales_summary_dual_cost_rate
GROUP BY year_month, product_name;

COMMENT ON VIEW v_cross_store_comparison IS '跨店对比视图';

-- ============================================================================
-- 脚本完成
-- ============================================================================
