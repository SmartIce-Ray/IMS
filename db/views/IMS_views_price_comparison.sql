-- ============================================================================
-- 野百灵餐饮集团 - 价格对比分析视图
-- ============================================================================
-- 版本: v1.0.0
-- 创建日期: 2025-11-25
-- 用途: 支持纵向（采购价vs标准价）和横向（跨门店）价格对比分析
--
-- 包含视图:
-- 1. v_price_comparison_vertical    - 纵向对比（采购价 vs 标准价）
-- 2. v_price_comparison_horizontal  - 横向对比（跨门店）
-- 3. v_cross_store_price_matrix     - 价格矩阵（透视表）
-- 4. v_price_anomaly_list           - 价格异常列表
-- 5. v_sku_price_history            - SKU价格历史
-- ============================================================================

-- ============================================================================
-- 视图1: v_price_comparison_vertical - 纵向对比（采购价 vs 标准价）
-- ============================================================================
-- 用途：按门店+SKU展示采购价与标准价的差异
-- 自动分类：严重超标(>20%)、超标(15-20%)、偏高(10-15%)、偏高轻微(5-10%)、正常(<5%)、偏低

CREATE OR REPLACE VIEW v_price_comparison_vertical AS
SELECT
    -- 门店信息
    s.store_id,
    s.store_code,
    s.store_name,
    b.brand_name AS store_brand,

    -- SKU信息
    ps.sku_id,
    ps.sku_code,
    ps.sku_name,
    ps.package_spec,
    ps.brand_name AS product_brand,

    -- 产品信息
    p.product_id,
    p.product_code,
    p.product_name,
    pc.category_name,

    -- 价格日期
    spp.price_date,

    -- 采购价格
    spp.purchase_price,
    u_purchase.unit_name AS purchase_unit,
    spp.base_unit_price,
    u_base.unit_name AS base_unit,

    -- 标准价格
    spp.standard_price,

    -- 差异分析
    spp.price_variance,
    spp.variance_rate,
    spp.variance_level,

    -- 差异分类（中文）
    CASE spp.variance_level
        WHEN 'critical' THEN '严重超标'
        WHEN 'high' THEN '超标'
        WHEN 'medium' THEN '偏高'
        WHEN 'normal' THEN '正常'
        WHEN 'medium_low' THEN '偏低轻微'
        WHEN 'low' THEN '偏低'
        WHEN 'critical_low' THEN '严重偏低'
        ELSE '未知'
    END AS variance_level_cn,

    -- 供应商信息
    spp.supplier_id,
    sup.supplier_name,

    -- 数据来源
    spp.source_type,
    spp.status,
    spp.notes,

    -- 时间戳
    spp.created_at,
    spp.updated_at

FROM store_purchase_price spp
JOIN store s ON spp.store_id = s.store_id
JOIN brand b ON s.brand_id = b.brand_id
JOIN product_sku ps ON spp.sku_id = ps.sku_id
JOIN product p ON ps.product_id = p.product_id
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN unit_of_measure u_purchase ON spp.purchase_unit_id = u_purchase.unit_id
LEFT JOIN unit_of_measure u_base ON spp.base_unit_id = u_base.unit_id
LEFT JOIN supplier sup ON spp.supplier_id = sup.supplier_id
WHERE spp.status = 'approved'  -- 只显示已审核的价格
ORDER BY spp.price_date DESC, s.store_name, p.product_name;

COMMENT ON VIEW v_price_comparison_vertical IS
    '纵向价格对比视图 - 展示采购价与标准价的差异，包含差异分级';

-- ============================================================================
-- 视图2: v_price_comparison_horizontal - 横向对比（跨门店）
-- ============================================================================
-- 用途：同一SKU在不同门店的价格对比
-- 计算：最高价/最低价门店、价格分散度

CREATE OR REPLACE VIEW v_price_comparison_horizontal AS
WITH latest_prices AS (
    -- 获取每个门店+SKU的最新价格
    SELECT DISTINCT ON (store_id, sku_id)
        price_id,
        store_id,
        sku_id,
        price_date,
        purchase_price,
        purchase_unit_id,
        base_unit_price,
        variance_rate,
        variance_level,
        supplier_id
    FROM store_purchase_price
    WHERE status = 'approved'
    ORDER BY store_id, sku_id, price_date DESC
),
sku_stats AS (
    -- 计算每个SKU的统计信息
    SELECT
        sku_id,
        COUNT(DISTINCT store_id) AS store_count,
        AVG(base_unit_price) AS avg_base_unit_price,
        MIN(base_unit_price) AS min_base_unit_price,
        MAX(base_unit_price) AS max_base_unit_price,
        STDDEV(base_unit_price) AS stddev_base_unit_price,
        -- 价格分散度 = (最高价-最低价) / 平均价 * 100%
        CASE
            WHEN AVG(base_unit_price) > 0 THEN
                (MAX(base_unit_price) - MIN(base_unit_price)) / AVG(base_unit_price) * 100
            ELSE 0
        END AS price_dispersion
    FROM latest_prices
    WHERE base_unit_price IS NOT NULL AND base_unit_price > 0
    GROUP BY sku_id
)
SELECT
    -- SKU信息
    ps.sku_id,
    ps.sku_code,
    ps.sku_name,
    ps.package_spec,

    -- 产品信息
    p.product_id,
    p.product_code,
    p.product_name,
    pc.category_name,

    -- 门店信息
    s.store_id,
    s.store_code,
    s.store_name,
    b.brand_name AS store_brand,

    -- 本门店价格
    lp.price_date,
    lp.purchase_price,
    lp.base_unit_price,
    lp.variance_rate,
    lp.variance_level,

    -- 跨门店统计
    ss.store_count AS total_stores_with_price,
    ROUND(ss.avg_base_unit_price::NUMERIC, 6) AS avg_base_unit_price,
    ss.min_base_unit_price,
    ss.max_base_unit_price,
    ROUND(ss.price_dispersion::NUMERIC, 2) AS price_dispersion_rate,

    -- 本门店价格排名
    CASE
        WHEN lp.base_unit_price = ss.min_base_unit_price THEN '最低价'
        WHEN lp.base_unit_price = ss.max_base_unit_price THEN '最高价'
        WHEN ss.avg_base_unit_price IS NOT NULL AND lp.base_unit_price < ss.avg_base_unit_price THEN '低于均价'
        WHEN ss.avg_base_unit_price IS NOT NULL AND lp.base_unit_price > ss.avg_base_unit_price THEN '高于均价'
        ELSE '接近均价'
    END AS price_position,

    -- 与均价差异
    CASE
        WHEN ss.avg_base_unit_price > 0 THEN
            ROUND(((lp.base_unit_price - ss.avg_base_unit_price) / ss.avg_base_unit_price * 100)::NUMERIC, 2)
        ELSE NULL
    END AS diff_from_avg_rate

FROM latest_prices lp
JOIN store s ON lp.store_id = s.store_id
JOIN brand b ON s.brand_id = b.brand_id
JOIN product_sku ps ON lp.sku_id = ps.sku_id
JOIN product p ON ps.product_id = p.product_id
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN sku_stats ss ON lp.sku_id = ss.sku_id
ORDER BY ps.sku_name, s.store_name;

COMMENT ON VIEW v_price_comparison_horizontal IS
    '横向价格对比视图 - 展示同一SKU在不同门店的价格对比，包含统计分析';

-- ============================================================================
-- 视图3: v_cross_store_price_matrix - 价格矩阵（透视表）
-- ============================================================================
-- 用途：以透视表形式展示各门店的采购价格
-- 注意：此视图使用crosstab需要tablefunc扩展，这里提供基础版本

CREATE OR REPLACE VIEW v_cross_store_price_matrix AS
WITH latest_prices AS (
    -- 获取每个门店+SKU的最新基础单位价格
    SELECT DISTINCT ON (store_id, sku_id)
        store_id,
        sku_id,
        base_unit_price,
        price_date
    FROM store_purchase_price
    WHERE status = 'approved' AND base_unit_price IS NOT NULL
    ORDER BY store_id, sku_id, price_date DESC
)
SELECT
    -- SKU信息
    ps.sku_id,
    ps.sku_code,
    ps.sku_name,
    p.product_name,
    pc.category_name,

    -- 各门店价格（使用条件聚合实现透视）
    MAX(CASE WHEN s.store_code = 'YBL-DY-001' THEN lp.base_unit_price END) AS "德阳店",
    MAX(CASE WHEN s.store_code = 'YBL-MY-001' THEN lp.base_unit_price END) AS "绵阳店",
    MAX(CASE WHEN s.store_code LIKE 'NGX%' THEN lp.base_unit_price END) AS "宁桂杏店",

    -- 价格统计
    COUNT(DISTINCT lp.store_id) AS store_count,
    MIN(lp.base_unit_price) AS min_price,
    MAX(lp.base_unit_price) AS max_price,
    AVG(lp.base_unit_price) AS avg_price,
    CASE
        WHEN AVG(lp.base_unit_price) > 0 THEN
            (MAX(lp.base_unit_price) - MIN(lp.base_unit_price)) / AVG(lp.base_unit_price) * 100
        ELSE 0
    END AS dispersion_rate,

    -- 最新价格日期
    MAX(lp.price_date) AS latest_price_date

FROM product_sku ps
JOIN product p ON ps.product_id = p.product_id
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN latest_prices lp ON ps.sku_id = lp.sku_id
LEFT JOIN store s ON lp.store_id = s.store_id
WHERE ps.is_active = TRUE
GROUP BY ps.sku_id, ps.sku_code, ps.sku_name, p.product_name, pc.category_name
HAVING COUNT(lp.store_id) > 0  -- 至少有一个门店有价格
ORDER BY pc.category_name, p.product_name;

COMMENT ON VIEW v_cross_store_price_matrix IS
    '跨门店价格矩阵视图 - 透视表形式展示各门店的采购价格，便于快速对比';

-- ============================================================================
-- 视图4: v_price_anomaly_list - 价格异常列表
-- ============================================================================
-- 用途：快速定位需要关注的价格异常

CREATE OR REPLACE VIEW v_price_anomaly_list AS
SELECT
    -- 门店信息
    s.store_name,
    s.store_code,

    -- SKU信息
    ps.sku_name,
    p.product_name,
    pc.category_name,

    -- 价格信息
    spp.price_date,
    spp.purchase_price,
    u.unit_name AS purchase_unit,
    spp.base_unit_price,

    -- 差异分析
    spp.standard_price,
    spp.variance_rate,
    spp.variance_level,

    -- 异常等级（中文）
    CASE spp.variance_level
        WHEN 'critical' THEN '严重超标'
        WHEN 'high' THEN '超标'
        WHEN 'critical_low' THEN '严重偏低'
        WHEN 'low' THEN '偏低'
        ELSE '其他'
    END AS anomaly_type,

    -- 异常严重程度
    CASE
        WHEN spp.variance_level IN ('critical', 'critical_low') THEN 1
        WHEN spp.variance_level IN ('high', 'low') THEN 2
        ELSE 3
    END AS severity_order,

    -- 供应商
    sup.supplier_name,

    -- 备注
    spp.notes

FROM store_purchase_price spp
JOIN store s ON spp.store_id = s.store_id
JOIN product_sku ps ON spp.sku_id = ps.sku_id
JOIN product p ON ps.product_id = p.product_id
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN unit_of_measure u ON spp.purchase_unit_id = u.unit_id
LEFT JOIN supplier sup ON spp.supplier_id = sup.supplier_id
WHERE spp.status = 'approved'
  AND spp.variance_level IN ('critical', 'high', 'critical_low', 'low')
ORDER BY
    CASE
        WHEN spp.variance_level IN ('critical', 'critical_low') THEN 1
        WHEN spp.variance_level IN ('high', 'low') THEN 2
        ELSE 3
    END,
    spp.price_date DESC;

COMMENT ON VIEW v_price_anomaly_list IS
    '价格异常列表视图 - 快速定位需要关注的价格异常，按严重程度排序';

-- ============================================================================
-- 视图5: v_sku_price_history - SKU价格历史
-- ============================================================================
-- 用途：查看SKU的价格变动历史

CREATE OR REPLACE VIEW v_sku_price_history AS
SELECT
    -- SKU信息
    ps.sku_id,
    ps.sku_code,
    ps.sku_name,
    p.product_name,
    pc.category_name,

    -- 门店信息
    s.store_id,
    s.store_name,

    -- 价格历史
    spp.price_date,
    spp.purchase_price,
    u.unit_name AS purchase_unit,
    spp.base_unit_price,
    spp.standard_price,
    spp.variance_rate,
    spp.variance_level,

    -- 与上一条记录对比
    LAG(spp.base_unit_price) OVER (
        PARTITION BY spp.store_id, spp.sku_id
        ORDER BY spp.price_date
    ) AS prev_base_unit_price,

    -- 价格变动率
    CASE
        WHEN LAG(spp.base_unit_price) OVER (
            PARTITION BY spp.store_id, spp.sku_id
            ORDER BY spp.price_date
        ) > 0 THEN
            ROUND(
                ((spp.base_unit_price - LAG(spp.base_unit_price) OVER (
                    PARTITION BY spp.store_id, spp.sku_id
                    ORDER BY spp.price_date
                )) / LAG(spp.base_unit_price) OVER (
                    PARTITION BY spp.store_id, spp.sku_id
                    ORDER BY spp.price_date
                ) * 100)::NUMERIC,
                2
            )
        ELSE NULL
    END AS price_change_rate,

    -- 供应商
    sup.supplier_name,

    -- 来源
    spp.source_type

FROM store_purchase_price spp
JOIN store s ON spp.store_id = s.store_id
JOIN product_sku ps ON spp.sku_id = ps.sku_id
JOIN product p ON ps.product_id = p.product_id
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN unit_of_measure u ON spp.purchase_unit_id = u.unit_id
LEFT JOIN supplier sup ON spp.supplier_id = sup.supplier_id
WHERE spp.status = 'approved'
ORDER BY ps.sku_name, s.store_name, spp.price_date DESC;

COMMENT ON VIEW v_sku_price_history IS
    'SKU价格历史视图 - 展示价格变动趋势，包含与上一记录的对比';

-- ============================================================================
-- 视图6: v_store_price_summary - 门店价格汇总
-- ============================================================================
-- 用途：按门店汇总价格异常情况

CREATE OR REPLACE VIEW v_store_price_summary AS
WITH price_stats AS (
    SELECT
        store_id,
        COUNT(*) AS total_prices,
        COUNT(CASE WHEN variance_level = 'critical' THEN 1 END) AS critical_count,
        COUNT(CASE WHEN variance_level = 'high' THEN 1 END) AS high_count,
        COUNT(CASE WHEN variance_level = 'medium' THEN 1 END) AS medium_count,
        COUNT(CASE WHEN variance_level = 'normal' THEN 1 END) AS normal_count,
        COUNT(CASE WHEN variance_level IN ('low', 'medium_low') THEN 1 END) AS low_count,
        COUNT(CASE WHEN variance_level = 'critical_low' THEN 1 END) AS critical_low_count,
        AVG(variance_rate) AS avg_variance_rate,
        MAX(price_date) AS latest_price_date
    FROM store_purchase_price
    WHERE status = 'approved'
    GROUP BY store_id
)
SELECT
    s.store_id,
    s.store_code,
    s.store_name,
    b.brand_name,

    -- 价格记录数
    ps.total_prices,

    -- 异常统计
    ps.critical_count AS "严重超标",
    ps.high_count AS "超标",
    ps.medium_count AS "偏高",
    ps.normal_count AS "正常",
    ps.low_count AS "偏低",
    ps.critical_low_count AS "严重偏低",

    -- 异常比例
    CASE
        WHEN ps.total_prices > 0 THEN
            ROUND(((ps.critical_count + ps.high_count + ps.critical_low_count)::NUMERIC / ps.total_prices * 100), 2)
        ELSE 0
    END AS anomaly_rate,

    -- 平均差异率
    ROUND(ps.avg_variance_rate::NUMERIC, 2) AS avg_variance_rate,

    -- 最新价格日期
    ps.latest_price_date,

    -- 健康评分（100分制）
    CASE
        WHEN ps.total_prices = 0 THEN NULL
        ELSE
            GREATEST(0, 100 -
                (ps.critical_count * 20) -
                (ps.high_count * 10) -
                (ps.critical_low_count * 15) -
                (ps.low_count * 5)
            )
    END AS health_score

FROM store s
JOIN brand b ON s.brand_id = b.brand_id
LEFT JOIN price_stats ps ON s.store_id = ps.store_id
WHERE s.is_active = TRUE
ORDER BY s.store_name;

COMMENT ON VIEW v_store_price_summary IS
    '门店价格汇总视图 - 按门店统计价格异常情况和健康评分';

-- ============================================================================
-- 视图7: v_category_price_overview - 品类价格概览
-- ============================================================================
-- 用途：按品类汇总价格情况

CREATE OR REPLACE VIEW v_category_price_overview AS
WITH category_stats AS (
    SELECT
        p.category_id,
        COUNT(DISTINCT spp.sku_id) AS sku_count,
        COUNT(spp.price_id) AS price_count,
        COUNT(CASE WHEN spp.variance_level IN ('critical', 'high', 'critical_low') THEN 1 END) AS anomaly_count,
        AVG(spp.variance_rate) AS avg_variance_rate,
        AVG(ABS(spp.variance_rate)) AS avg_abs_variance_rate
    FROM store_purchase_price spp
    JOIN product_sku ps ON spp.sku_id = ps.sku_id
    JOIN product p ON ps.product_id = p.product_id
    WHERE spp.status = 'approved'
    GROUP BY p.category_id
)
SELECT
    pc.category_id,
    pc.category_code,
    pc.category_name,

    -- 品类数据量
    COALESCE(cs.sku_count, 0) AS sku_count,
    COALESCE(cs.price_count, 0) AS price_record_count,

    -- 异常统计
    COALESCE(cs.anomaly_count, 0) AS anomaly_count,
    CASE
        WHEN COALESCE(cs.price_count, 0) > 0 THEN
            ROUND((cs.anomaly_count::NUMERIC / cs.price_count * 100), 2)
        ELSE 0
    END AS anomaly_rate,

    -- 价格波动
    ROUND(COALESCE(cs.avg_variance_rate, 0)::NUMERIC, 2) AS avg_variance_rate,
    ROUND(COALESCE(cs.avg_abs_variance_rate, 0)::NUMERIC, 2) AS avg_volatility,

    -- 阈值配置
    pvt.warning_upper_rate,
    pvt.critical_upper_rate,
    pvt.warning_lower_rate,
    pvt.critical_lower_rate

FROM product_category pc
LEFT JOIN category_stats cs ON pc.category_id = cs.category_id
LEFT JOIN price_variance_threshold pvt ON pc.category_id = pvt.category_id AND pvt.is_active = TRUE
WHERE pc.is_active = TRUE
ORDER BY pc.category_name;

COMMENT ON VIEW v_category_price_overview IS
    '品类价格概览视图 - 按品类汇总价格情况和阈值配置';

-- ============================================================================
-- 脚本完成
-- ============================================================================
--
-- 视图使用示例:
--
-- 1. 查看德阳店的价格异常:
-- SELECT * FROM v_price_anomaly_list WHERE store_name LIKE '%德阳%';
--
-- 2. 查看某SKU在所有门店的价格对比:
-- SELECT * FROM v_price_comparison_horizontal WHERE sku_name LIKE '%盐%';
--
-- 3. 查看跨门店价格矩阵:
-- SELECT * FROM v_cross_store_price_matrix WHERE category_name = '调料';
--
-- 4. 查看门店价格健康评分:
-- SELECT store_name, health_score, anomaly_rate FROM v_store_price_summary ORDER BY health_score;
--
-- 5. 查看品类价格波动情况:
-- SELECT * FROM v_category_price_overview ORDER BY avg_volatility DESC;
--
-- ============================================================================
