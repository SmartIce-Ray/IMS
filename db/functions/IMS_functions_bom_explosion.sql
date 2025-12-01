-- ============================================================================
-- 野百灵餐饮集团 - BOM递归分解函数
-- ============================================================================
-- 版本: v1.0.0-mvp
-- 核心功能: 完全分解产品配方到原材料(支持11个核心半成品)
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. explode_bom - BOM完全分解函数 ★核心函数
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION explode_bom(
    p_product_id INT,
    p_quantity DECIMAL DEFAULT 1.0,
    p_brand_id INT DEFAULT NULL,
    p_max_level INT DEFAULT 10
)
RETURNS TABLE (
    level INT,
    ingredient_id INT,
    ingredient_code VARCHAR,
    ingredient_name VARCHAR,
    ingredient_type VARCHAR,
    total_quantity DECIMAL,
    unit_name VARCHAR,
    unit_cost DECIMAL,
    total_cost DECIMAL
) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE bom_explosion AS (
        -- Level 1: 产品的直接原材料/半成品
        SELECT
            1 AS level,
            ri.ingredient_id,
            p.product_code,
            p.product_name,
            p.product_type,
            ri.net_quantity * p_quantity AS total_quantity,
            u.unit_name,
            decrypt_cost(ri.unit_price_encrypted) AS unit_cost,
            decrypt_cost(ri.subtotal_cost_encrypted) * p_quantity AS total_cost
        FROM recipe r
        JOIN recipe_item ri ON r.recipe_id = ri.recipe_id
        JOIN product p ON ri.ingredient_id = p.product_id
        JOIN unit_of_measure u ON ri.unit_id = u.unit_id
        WHERE r.product_id = p_product_id
          AND r.is_current = TRUE
          AND r.status = 'approved'
          AND (p_brand_id IS NULL OR r.brand_id = p_brand_id)

        UNION ALL

        -- Level N: 递归分解半成品
        SELECT
            be.level + 1,
            ri.ingredient_id,
            p.product_code,
            p.product_name,
            p.product_type,
            ri.net_quantity * be.total_quantity / NULLIF(r.yield_quantity, 0),
            u.unit_name,
            decrypt_cost(ri.unit_price_encrypted),
            decrypt_cost(ri.subtotal_cost_encrypted) * be.total_quantity / NULLIF(r.yield_quantity, 0)
        FROM bom_explosion be
        JOIN recipe r ON r.product_id = be.ingredient_id AND r.is_current = TRUE AND r.status = 'approved'
        JOIN recipe_item ri ON r.recipe_id = ri.recipe_id
        JOIN product p ON ri.ingredient_id = p.product_id
        JOIN unit_of_measure u ON ri.unit_id = u.unit_id
        WHERE be.ingredient_type = 'semi_finished'
          AND be.level < p_max_level
          AND (p_brand_id IS NULL OR r.brand_id = p_brand_id)
    )
    SELECT
        be.level,
        be.ingredient_id,
        be.product_code::VARCHAR,
        be.product_name::VARCHAR,
        be.product_type::VARCHAR,
        SUM(be.total_quantity)::DECIMAL,
        be.unit_name::VARCHAR,
        AVG(be.unit_cost)::DECIMAL,
        SUM(be.total_cost)::DECIMAL
    FROM bom_explosion be
    WHERE be.product_type = 'raw_material'
    GROUP BY be.level, be.ingredient_id, be.product_code, be.product_name, be.product_type, be.unit_name
    ORDER BY be.level, be.product_name;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION explode_bom(INT, DECIMAL, INT, INT) IS '★BOM完全分解 - 递归分解到原材料';

-- ----------------------------------------------------------------------------
-- 2. calculate_product_total_cost - 计算产品总成本
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION calculate_product_total_cost(
    p_product_id INT,
    p_brand_id INT DEFAULT NULL
)
RETURNS DECIMAL AS $$
DECLARE
    v_total_cost DECIMAL;
BEGIN
    SELECT SUM(total_cost) INTO v_total_cost
    FROM explode_bom(p_product_id, 1.0, p_brand_id);

    RETURN COALESCE(v_total_cost, 0);
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION calculate_product_total_cost(INT, INT) IS '计算产品总成本';

-- ============================================================================
-- 脚本完成
-- ============================================================================
