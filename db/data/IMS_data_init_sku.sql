-- ============================================================================
-- 野百灵餐饮集团 - 默认SKU初始化数据
-- ============================================================================
-- 版本: v1.0.0
-- 创建日期: 2025-11-25
-- 用途: 为所有现有原材料创建默认SKU（is_default=TRUE）
--
-- 执行顺序:
-- 1. 先执行 schema_product_sku.sql 创建表结构
-- 2. 再执行本脚本初始化默认SKU数据
--
-- 设计原则:
-- - 每个原材料(raw_material)至少有一个默认SKU
-- - 默认SKU的sku_name = 产品名称 + "-默认规格"
-- - 默认SKU的sku_code = 产品编码 + "-SKU-01"
-- ============================================================================

-- ============================================================================
-- 第一部分: 自动生成默认SKU（批量处理）
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 存储过程：批量初始化默认SKU
-- ----------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE init_default_skus()
LANGUAGE plpgsql
AS $$
DECLARE
    v_product RECORD;
    v_sku_code VARCHAR(50);
    v_sku_name VARCHAR(200);
    v_count INT := 0;
    v_skipped INT := 0;
BEGIN
    -- 遍历所有原材料
    FOR v_product IN
        SELECT
            p.product_id,
            p.product_code,
            p.product_name,
            p.base_unit_id,
            p.purchase_unit_id,
            p.storage_unit_id
        FROM product p
        WHERE p.product_type = 'raw_material'
          AND p.is_active = TRUE
        ORDER BY p.product_id
    LOOP
        -- 检查是否已有默认SKU
        IF EXISTS (
            SELECT 1 FROM product_sku
            WHERE product_id = v_product.product_id AND is_default = TRUE
        ) THEN
            v_skipped := v_skipped + 1;
            CONTINUE;
        END IF;

        -- 生成SKU编码和名称
        v_sku_code := v_product.product_code || '-SKU-01';
        v_sku_name := v_product.product_name || '-默认规格';

        -- 创建默认SKU
        INSERT INTO product_sku (
            product_id,
            sku_code,
            sku_name,
            package_spec,
            is_default,
            is_active,
            sort_order,
            notes
        ) VALUES (
            v_product.product_id,
            v_sku_code,
            v_sku_name,
            '默认包装',
            TRUE,
            TRUE,
            0,
            '系统自动生成的默认SKU'
        )
        ON CONFLICT (sku_code) DO NOTHING;

        v_count := v_count + 1;

        -- 每100条输出进度
        IF v_count % 100 = 0 THEN
            RAISE NOTICE '已创建 % 个默认SKU...', v_count;
        END IF;
    END LOOP;

    RAISE NOTICE '默认SKU初始化完成：新建 % 个，跳过 % 个（已存在）', v_count, v_skipped;
END;
$$;

-- 执行初始化
CALL init_default_skus();

-- ============================================================================
-- 第二部分: 补充单位换算关系
-- ============================================================================
-- 注意：需要先确认unit_of_measure表中有相应的单位记录

-- 查询现有单位（用于调试）
-- SELECT unit_id, unit_code, unit_name, unit_type FROM unit_of_measure ORDER BY unit_id;

-- ----------------------------------------------------------------------------
-- 常用单位换算（如果不存在则插入）
-- ----------------------------------------------------------------------------

-- 重量换算
DO $$
DECLARE
    v_g_id INT;
    v_kg_id INT;
    v_jin_id INT;
    v_liang_id INT;
BEGIN
    -- 获取单位ID
    SELECT unit_id INTO v_g_id FROM unit_of_measure WHERE unit_code = 'g' LIMIT 1;
    SELECT unit_id INTO v_kg_id FROM unit_of_measure WHERE unit_code = 'kg' LIMIT 1;
    SELECT unit_id INTO v_jin_id FROM unit_of_measure WHERE unit_code IN ('jin', '斤') LIMIT 1;
    SELECT unit_id INTO v_liang_id FROM unit_of_measure WHERE unit_code IN ('liang', '两') LIMIT 1;

    -- 如果没有找到单位，先创建
    IF v_g_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('g', '克', 'gram', 'weight', 'base', TRUE, 'g')
        RETURNING unit_id INTO v_g_id;
    END IF;

    IF v_kg_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('kg', '千克', 'kilogram', 'weight', 'package', FALSE, 'kg')
        RETURNING unit_id INTO v_kg_id;
    END IF;

    IF v_jin_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('jin', '斤', 'jin', 'weight', 'usage', FALSE, '斤')
        RETURNING unit_id INTO v_jin_id;
    END IF;

    IF v_liang_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('liang', '两', 'liang', 'weight', 'usage', FALSE, '两')
        RETURNING unit_id INTO v_liang_id;
    END IF;

    -- 插入换算关系
    IF v_kg_id IS NOT NULL AND v_g_id IS NOT NULL THEN
        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_kg_id, v_g_id, 1000.0000)
        ON CONFLICT DO NOTHING;

        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_g_id, v_kg_id, 0.0010)
        ON CONFLICT DO NOTHING;
    END IF;

    IF v_jin_id IS NOT NULL AND v_g_id IS NOT NULL THEN
        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_jin_id, v_g_id, 500.0000)
        ON CONFLICT DO NOTHING;

        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_g_id, v_jin_id, 0.0020)
        ON CONFLICT DO NOTHING;
    END IF;

    IF v_liang_id IS NOT NULL AND v_g_id IS NOT NULL THEN
        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_liang_id, v_g_id, 50.0000)
        ON CONFLICT DO NOTHING;

        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_g_id, v_liang_id, 0.0200)
        ON CONFLICT DO NOTHING;
    END IF;

    RAISE NOTICE '重量单位换算关系已更新';
END $$;

-- 液体换算
DO $$
DECLARE
    v_ml_id INT;
    v_l_id INT;
BEGIN
    -- 获取单位ID
    SELECT unit_id INTO v_ml_id FROM unit_of_measure WHERE unit_code = 'ml' LIMIT 1;
    SELECT unit_id INTO v_l_id FROM unit_of_measure WHERE unit_code = 'L' OR unit_code = 'l' LIMIT 1;

    -- 如果没有找到单位，先创建
    IF v_ml_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('ml', '毫升', 'milliliter', 'volume', 'base', TRUE, 'ml')
        RETURNING unit_id INTO v_ml_id;
    END IF;

    IF v_l_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('L', '升', 'liter', 'volume', 'package', FALSE, 'L')
        RETURNING unit_id INTO v_l_id;
    END IF;

    -- 插入换算关系
    IF v_l_id IS NOT NULL AND v_ml_id IS NOT NULL THEN
        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_l_id, v_ml_id, 1000.0000)
        ON CONFLICT DO NOTHING;

        INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor)
        VALUES (v_ml_id, v_l_id, 0.0010)
        ON CONFLICT DO NOTHING;
    END IF;

    RAISE NOTICE '液体单位换算关系已更新';
END $$;

-- 计数类单位
DO $$
DECLARE
    v_piece_id INT;
    v_ge_id INT;
    v_zhi_id INT;
BEGIN
    -- 获取单位ID
    SELECT unit_id INTO v_piece_id FROM unit_of_measure WHERE unit_code = 'piece' LIMIT 1;
    SELECT unit_id INTO v_ge_id FROM unit_of_measure WHERE unit_code = 'ge' OR unit_name = '个' LIMIT 1;
    SELECT unit_id INTO v_zhi_id FROM unit_of_measure WHERE unit_code = 'zhi' OR unit_name = '只' LIMIT 1;

    -- 如果没有找到单位，先创建
    IF v_piece_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('piece', '个', 'piece', 'count', 'base', TRUE, '个')
        RETURNING unit_id INTO v_piece_id;
    END IF;

    RAISE NOTICE '计数单位已确认';
END $$;

-- 包装类单位
DO $$
DECLARE
    v_dai_id INT;     -- 袋
    v_tong_id INT;    -- 桶
    v_xiang_id INT;   -- 箱
    v_ping_id INT;    -- 瓶
    v_he_id INT;      -- 盒
    v_bao_id INT;     -- 包
BEGIN
    -- 袋
    SELECT unit_id INTO v_dai_id FROM unit_of_measure WHERE unit_code = 'dai' OR unit_name = '袋' LIMIT 1;
    IF v_dai_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('dai', '袋', 'bag', 'count', 'package', FALSE, '袋')
        RETURNING unit_id INTO v_dai_id;
    END IF;

    -- 桶
    SELECT unit_id INTO v_tong_id FROM unit_of_measure WHERE unit_code = 'tong' OR unit_name = '桶' LIMIT 1;
    IF v_tong_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('tong', '桶', 'barrel', 'count', 'package', FALSE, '桶')
        RETURNING unit_id INTO v_tong_id;
    END IF;

    -- 箱
    SELECT unit_id INTO v_xiang_id FROM unit_of_measure WHERE unit_code = 'xiang' OR unit_name = '箱' LIMIT 1;
    IF v_xiang_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('xiang', '箱', 'box', 'count', 'package', FALSE, '箱')
        RETURNING unit_id INTO v_xiang_id;
    END IF;

    -- 瓶
    SELECT unit_id INTO v_ping_id FROM unit_of_measure WHERE unit_code = 'ping' OR unit_name = '瓶' LIMIT 1;
    IF v_ping_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('ping', '瓶', 'bottle', 'count', 'package', FALSE, '瓶')
        RETURNING unit_id INTO v_ping_id;
    END IF;

    -- 盒
    SELECT unit_id INTO v_he_id FROM unit_of_measure WHERE unit_code = 'he' OR unit_name = '盒' LIMIT 1;
    IF v_he_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('he', '盒', 'box', 'count', 'package', FALSE, '盒')
        RETURNING unit_id INTO v_he_id;
    END IF;

    -- 包
    SELECT unit_id INTO v_bao_id FROM unit_of_measure WHERE unit_code = 'bao' OR unit_name = '包' LIMIT 1;
    IF v_bao_id IS NULL THEN
        INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol)
        VALUES ('bao', '包', 'pack', 'count', 'package', FALSE, '包')
        RETURNING unit_id INTO v_bao_id;
    END IF;

    RAISE NOTICE '包装类单位已确认';
END $$;

-- ============================================================================
-- 第三部分: 验证数据
-- ============================================================================

-- 检查SKU创建结果
DO $$
DECLARE
    v_total_products INT;
    v_total_skus INT;
    v_products_with_default_sku INT;
BEGIN
    -- 统计原材料数量
    SELECT COUNT(*) INTO v_total_products
    FROM product
    WHERE product_type = 'raw_material' AND is_active = TRUE;

    -- 统计SKU数量
    SELECT COUNT(*) INTO v_total_skus
    FROM product_sku
    WHERE is_active = TRUE;

    -- 统计有默认SKU的原材料数量
    SELECT COUNT(DISTINCT ps.product_id) INTO v_products_with_default_sku
    FROM product_sku ps
    JOIN product p ON ps.product_id = p.product_id
    WHERE p.product_type = 'raw_material'
      AND ps.is_default = TRUE
      AND ps.is_active = TRUE;

    RAISE NOTICE '========================================';
    RAISE NOTICE '默认SKU初始化验证结果:';
    RAISE NOTICE '- 原材料总数: %', v_total_products;
    RAISE NOTICE '- SKU总数: %', v_total_skus;
    RAISE NOTICE '- 有默认SKU的原材料: %', v_products_with_default_sku;
    RAISE NOTICE '- 覆盖率: %', ROUND(v_products_with_default_sku::NUMERIC / NULLIF(v_total_products, 0) * 100, 2) || '%';
    RAISE NOTICE '========================================';
END $$;

-- 查看前10个创建的SKU（用于验证）
-- SELECT
--     ps.sku_id,
--     ps.sku_code,
--     ps.sku_name,
--     p.product_name,
--     ps.is_default,
--     ps.created_at
-- FROM product_sku ps
-- JOIN product p ON ps.product_id = p.product_id
-- ORDER BY ps.created_at DESC
-- LIMIT 10;

-- ============================================================================
-- 第四部分: 工具函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 函数：为单个产品创建默认SKU
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION create_default_sku_for_product(
    p_product_id INT
) RETURNS INT AS $$
DECLARE
    v_product RECORD;
    v_sku_code VARCHAR(50);
    v_sku_name VARCHAR(200);
    v_sku_id INT;
BEGIN
    -- 检查是否已有默认SKU
    IF EXISTS (
        SELECT 1 FROM product_sku
        WHERE product_id = p_product_id AND is_default = TRUE
    ) THEN
        SELECT sku_id INTO v_sku_id
        FROM product_sku
        WHERE product_id = p_product_id AND is_default = TRUE
        LIMIT 1;
        RETURN v_sku_id;
    END IF;

    -- 获取产品信息
    SELECT product_code, product_name
    INTO v_product
    FROM product
    WHERE product_id = p_product_id;

    IF v_product.product_code IS NULL THEN
        RAISE EXCEPTION '产品ID % 不存在', p_product_id;
    END IF;

    -- 生成SKU编码和名称
    v_sku_code := v_product.product_code || '-SKU-01';
    v_sku_name := v_product.product_name || '-默认规格';

    -- 创建默认SKU
    INSERT INTO product_sku (
        product_id,
        sku_code,
        sku_name,
        package_spec,
        is_default,
        is_active,
        sort_order,
        notes
    ) VALUES (
        p_product_id,
        v_sku_code,
        v_sku_name,
        '默认包装',
        TRUE,
        TRUE,
        0,
        '系统自动生成的默认SKU'
    )
    RETURNING sku_id INTO v_sku_id;

    RETURN v_sku_id;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION create_default_sku_for_product(INT) IS
    '为单个产品创建默认SKU，如果已存在则返回现有SKU ID';

-- ----------------------------------------------------------------------------
-- 函数：为产品创建新规格SKU
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION create_sku_variant(
    p_product_id INT,
    p_sku_name VARCHAR(200),
    p_package_spec VARCHAR(200),
    p_package_quantity DECIMAL(10,3) DEFAULT NULL,
    p_base_unit_quantity DECIMAL(10,3) DEFAULT NULL,
    p_brand_name VARCHAR(100) DEFAULT NULL,
    p_supplier_id INT DEFAULT NULL
) RETURNS INT AS $$
DECLARE
    v_product_code VARCHAR(50);
    v_sku_count INT;
    v_sku_code VARCHAR(50);
    v_sku_id INT;
BEGIN
    -- 获取产品编码
    SELECT product_code INTO v_product_code
    FROM product
    WHERE product_id = p_product_id;

    IF v_product_code IS NULL THEN
        RAISE EXCEPTION '产品ID % 不存在', p_product_id;
    END IF;

    -- 计算已有SKU数量
    SELECT COUNT(*) INTO v_sku_count
    FROM product_sku
    WHERE product_id = p_product_id;

    -- 生成SKU编码
    v_sku_code := v_product_code || '-SKU-' || LPAD((v_sku_count + 1)::TEXT, 2, '0');

    -- 创建新SKU
    INSERT INTO product_sku (
        product_id,
        sku_code,
        sku_name,
        package_spec,
        package_quantity,
        base_unit_quantity,
        brand_name,
        default_supplier_id,
        is_default,
        is_active,
        sort_order
    ) VALUES (
        p_product_id,
        v_sku_code,
        p_sku_name,
        p_package_spec,
        p_package_quantity,
        p_base_unit_quantity,
        p_brand_name,
        p_supplier_id,
        FALSE,  -- 新增规格默认不是默认SKU
        TRUE,
        v_sku_count + 1
    )
    RETURNING sku_id INTO v_sku_id;

    RETURN v_sku_id;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION create_sku_variant(INT, VARCHAR, VARCHAR, DECIMAL, DECIMAL, VARCHAR, INT) IS
    '为产品创建新的规格变体SKU';

-- ============================================================================
-- 脚本完成
-- ============================================================================
--
-- 使用示例:
--
-- 1. 重新初始化所有默认SKU:
--    CALL init_default_skus();
--
-- 2. 为单个产品创建默认SKU:
--    SELECT create_default_sku_for_product(123);
--
-- 3. 为产品创建新规格变体:
--    SELECT create_sku_variant(
--        123,               -- 产品ID（如：盐）
--        '盐-大袋25kg',     -- SKU名称
--        '25kg/袋',         -- 包装规格
--        25000,             -- 每包装数量
--        25000,             -- 基础单位数量(g)
--        '中盐',            -- 品牌
--        NULL               -- 供应商ID
--    );
--
-- 4. 查看某产品的所有SKU:
--    SELECT * FROM product_sku WHERE product_id = 123 ORDER BY sort_order;
--
-- ============================================================================
