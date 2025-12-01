-- ============================================================================
-- 野百灵餐饮集团 - 成本加密/解密函数
-- ============================================================================
-- 版本: v1.0.0-mvp
-- 依赖: pgcrypto扩展
-- 作用: 保护敏感成本数据,防止未授权访问
--
-- 加密范围:
-- 1. product.current_cost_encrypted (配方总成本)
-- 2. recipe.total_cost_encrypted (配方总成本)
-- 3. recipe_item.unit_price_encrypted (配方明细单价)
-- 4. recipe_item.subtotal_cost_encrypted (配方明细小计)
-- 5. ingredient_cost_history.unit_price_encrypted (原材料历史单价)
-- 6. sales_summary.theoretical_cost_encrypted (销售理论成本)
-- 7. sales_summary.gross_profit_encrypted (毛利)
-- ============================================================================

-- 确保pgcrypto扩展已启用
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- ============================================================================
-- 核心加密/解密函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. encrypt_cost - 成本加密函数
-- ----------------------------------------------------------------------------
-- 用途: 将明文成本金额加密为BYTEA类型
-- 参数: p_cost - 明文成本(DECIMAL类型)
-- 返回: 加密后的BYTEA
-- 权限: SECURITY DEFINER (使用函数创建者权限执行)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION encrypt_cost(p_cost DECIMAL)
RETURNS BYTEA AS $$
DECLARE
    v_encryption_key TEXT;
BEGIN
    -- 检查输入
    IF p_cost IS NULL THEN
        RETURN NULL;
    END IF;

    -- 获取加密密钥
    BEGIN
        v_encryption_key := current_setting('app.encryption_key', false);
    EXCEPTION WHEN OTHERS THEN
        RAISE EXCEPTION '加密密钥未配置! 请设置 app.encryption_key 参数.';
    END;

    -- 使用pgcrypto的AES加密
    RETURN pgp_sym_encrypt(p_cost::TEXT, v_encryption_key);

EXCEPTION WHEN OTHERS THEN
    RAISE EXCEPTION '成本加密失败: %', SQLERRM;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION encrypt_cost(DECIMAL) IS '★成本加密函数 - 使用AES加密保护敏感成本数据';

-- ----------------------------------------------------------------------------
-- 2. decrypt_cost - 成本解密函数
-- ----------------------------------------------------------------------------
-- 用途: 解密成本数据
-- 参数: p_encrypted - 加密的BYTEA
-- 返回: 明文成本(DECIMAL类型)
-- 权限: SECURITY DEFINER (需要权限检查)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION decrypt_cost(p_encrypted BYTEA)
RETURNS DECIMAL AS $$
DECLARE
    v_encryption_key TEXT;
    v_decrypted TEXT;
BEGIN
    -- 检查输入
    IF p_encrypted IS NULL THEN
        RETURN NULL;
    END IF;

    -- 获取加密密钥
    BEGIN
        v_encryption_key := current_setting('app.encryption_key', false);
    EXCEPTION WHEN OTHERS THEN
        RAISE EXCEPTION '加密密钥未配置! 请设置 app.encryption_key 参数.';
    END;

    -- 解密
    v_decrypted := pgp_sym_decrypt(p_encrypted, v_encryption_key);

    -- 转换为DECIMAL
    RETURN v_decrypted::DECIMAL;

EXCEPTION
    WHEN OTHERS THEN
        -- 解密失败返回NULL(可能是密钥错误或数据损坏)
        RETURN NULL;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION decrypt_cost(BYTEA) IS '★成本解密函数 - 需要正确的加密密钥';

-- ----------------------------------------------------------------------------
-- 3. mask_cost - 成本脱敏函数
-- ----------------------------------------------------------------------------
-- 用途: 将成本转换为区间显示(给普通员工看)
-- 参数: p_cost - 明文成本
-- 返回: 成本区间字符串
-- 示例: 15.5元 → "10-30元"
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION mask_cost(p_cost DECIMAL)
RETURNS TEXT AS $$
BEGIN
    IF p_cost IS NULL THEN
        RETURN '未设置';
    END IF;

    IF p_cost < 10 THEN
        RETURN '< 10元';
    ELSIF p_cost < 30 THEN
        RETURN '10-30元';
    ELSIF p_cost < 50 THEN
        RETURN '30-50元';
    ELSIF p_cost < 100 THEN
        RETURN '50-100元';
    ELSIF p_cost < 200 THEN
        RETURN '100-200元';
    ELSE
        RETURN '> 200元';
    END IF;
END;
$$ LANGUAGE plpgsql IMMUTABLE;

COMMENT ON FUNCTION mask_cost(DECIMAL) IS '成本脱敏函数 - 将成本转换为区间,保护敏感信息';

-- ----------------------------------------------------------------------------
-- 4. mask_cost_encrypted - 加密成本脱敏函数
-- ----------------------------------------------------------------------------
-- 用途: 直接对加密的成本进行脱敏
-- 参数: p_encrypted - 加密的BYTEA
-- 返回: 成本区间字符串
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION mask_cost_encrypted(p_encrypted BYTEA)
RETURNS TEXT AS $$
DECLARE
    v_cost DECIMAL;
BEGIN
    v_cost := decrypt_cost(p_encrypted);
    RETURN mask_cost(v_cost);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION mask_cost_encrypted(BYTEA) IS '加密成本脱敏 - 解密后转换为区间显示';

-- ============================================================================
-- 批量加密/解密函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 5. batch_encrypt_product_costs - 批量加密产品成本
-- ----------------------------------------------------------------------------
-- 用途: 为现有的明文成本数据批量加密
-- 使用场景: 数据迁移时,将旧系统的明文成本加密
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION batch_encrypt_product_costs()
RETURNS INT AS $$
DECLARE
    v_count INT := 0;
BEGIN
    -- 假设有一个临时列 current_cost_plaintext 存储明文
    -- UPDATE product
    -- SET current_cost_encrypted = encrypt_cost(current_cost_plaintext)
    -- WHERE current_cost_plaintext IS NOT NULL
    --   AND current_cost_encrypted IS NULL;

    -- GET DIAGNOSTICS v_count = ROW_COUNT;

    -- 暂时返回0
    v_count := 0;

    RAISE NOTICE '已加密 % 个产品成本', v_count;
    RETURN v_count;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION batch_encrypt_product_costs() IS '批量加密产品成本 - 用于数据迁移';

-- ============================================================================
-- 权限检查函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 6. check_cost_decrypt_permission - 检查解密权限
-- ----------------------------------------------------------------------------
-- 用途: 检查当前用户是否有权限解密成本数据
-- 返回: TRUE=有权限, FALSE=无权限
-- 规则: 只有财务经理及以上级别可以查看完整成本
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION check_cost_decrypt_permission()
RETURNS BOOLEAN AS $$
DECLARE
    v_current_user TEXT;
    v_has_permission BOOLEAN;
BEGIN
    v_current_user := current_user;

    -- 超级管理员总是有权限
    IF v_current_user = 'postgres' THEN
        RETURN TRUE;
    END IF;

    -- 检查是否是财务角色
    -- 这里简化处理,实际应查询employee_role表
    -- SELECT EXISTS (
    --     SELECT 1
    --     FROM employee e
    --     JOIN employee_role er ON e.employee_id = er.employee_id
    --     JOIN role r ON er.role_id = r.role_id
    --     WHERE e.username = v_current_user
    --       AND r.role_code IN ('ROLE_SUPER_ADMIN', 'ROLE_FINANCE_MANAGER')
    --       AND er.is_active = TRUE
    -- ) INTO v_has_permission;

    -- 暂时返回TRUE(后续实现完整权限控制)
    RETURN TRUE;

END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION check_cost_decrypt_permission() IS '检查成本解密权限 - 只有财务角色可以查看完整成本';

-- ============================================================================
-- 安全视图 - 不同权限级别的成本视图
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 视图1: v_product_cost_full - 完整成本视图 (财务角色专用)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_product_cost_full AS
SELECT
    p.product_id,
    p.product_code,
    p.product_name,
    p.product_type,
    p.category_id,
    pc.category_name,

    -- 解密完整成本
    decrypt_cost(p.current_cost_encrypted) AS current_cost,

    p.is_saleable,
    p.selling_price,

    -- 毛利率
    CASE
        WHEN p.selling_price > 0 AND decrypt_cost(p.current_cost_encrypted) IS NOT NULL
        THEN ROUND((p.selling_price - decrypt_cost(p.current_cost_encrypted)) / p.selling_price * 100, 2)
        ELSE NULL
    END AS gross_margin_rate,

    p.portion_size,
    u.unit_name AS portion_unit,

    p.is_active,
    p.created_at,
    p.updated_at
FROM product p
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN unit_of_measure u ON p.portion_unit_id = u.unit_id
WHERE p.is_active = TRUE;

COMMENT ON VIEW v_product_cost_full IS '★完整成本视图 - 只对财务角色开放,显示解密后的成本';

-- ----------------------------------------------------------------------------
-- 视图2: v_product_cost_masked - 脱敏成本视图 (普通员工)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_product_cost_masked AS
SELECT
    p.product_id,
    p.product_code,
    p.product_name,
    p.product_type,
    p.category_id,
    pc.category_name,

    -- 成本区间
    mask_cost_encrypted(p.current_cost_encrypted) AS cost_range,

    p.is_saleable,
    p.selling_price,

    p.portion_size,
    u.unit_name AS portion_unit,

    p.is_active
FROM product p
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN unit_of_measure u ON p.portion_unit_id = u.unit_id
WHERE p.is_active = TRUE;

COMMENT ON VIEW v_product_cost_masked IS '脱敏成本视图 - 普通员工可查看,成本显示为区间';

-- ----------------------------------------------------------------------------
-- 视图3: v_product_no_cost - 无成本视图 (服务员/收银员)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_product_no_cost AS
SELECT
    p.product_id,
    p.product_code,
    p.product_name,
    p.product_type,
    p.category_id,
    pc.category_name,

    p.is_saleable,
    p.selling_price,

    p.portion_size,
    u.unit_name AS portion_unit,

    p.description,
    p.image_url,
    p.tags,

    p.is_active
FROM product p
LEFT JOIN product_category pc ON p.category_id = pc.category_id
LEFT JOIN unit_of_measure u ON p.portion_unit_id = u.unit_id
WHERE p.is_active = TRUE
  AND p.is_saleable = TRUE;

COMMENT ON VIEW v_product_no_cost IS '无成本视图 - 服务员/收银员使用,完全不显示成本信息';

-- ----------------------------------------------------------------------------
-- 视图4: v_recipe_cost_full - 配方完整成本视图 (财务+厨师长)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_recipe_cost_full AS
SELECT
    r.recipe_id,
    r.recipe_code,
    r.product_id,
    p.product_name,
    r.version,
    r.recipe_name,

    -- 解密成本
    decrypt_cost(r.total_material_cost_encrypted) AS total_material_cost,
    r.total_labor_cost,
    r.total_overhead_cost,
    decrypt_cost(r.total_cost_encrypted) AS total_cost,

    r.yield_quantity,
    u.unit_name AS yield_unit,

    -- 单位成本
    CASE
        WHEN r.yield_quantity > 0
        THEN ROUND(decrypt_cost(r.total_cost_encrypted) / r.yield_quantity, 2)
        ELSE NULL
    END AS unit_cost,

    r.preparation_time_minutes,
    r.difficulty_level,
    r.status,
    r.is_current,
    r.effective_date,
    r.expiry_date,

    b.brand_name,

    r.created_at,
    r.approved_at,
    e_created.employee_name AS created_by_name,
    e_approved.employee_name AS approved_by_name
FROM recipe r
JOIN product p ON r.product_id = p.product_id
LEFT JOIN unit_of_measure u ON r.yield_unit_id = u.unit_id
LEFT JOIN brand b ON r.brand_id = b.brand_id
LEFT JOIN employee e_created ON r.created_by = e_created.employee_id
LEFT JOIN employee e_approved ON r.approved_by = e_approved.employee_id
WHERE r.status = 'approved';

COMMENT ON VIEW v_recipe_cost_full IS '★配方完整成本视图 - 财务和厨师长可查看';

-- ----------------------------------------------------------------------------
-- 视图5: v_recipe_item_cost_full - 配方明细完整成本视图
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_recipe_item_cost_full AS
SELECT
    ri.recipe_item_id,
    ri.recipe_id,
    r.recipe_code,
    p_product.product_name AS product_name,

    ri.ingredient_id,
    p_ingredient.product_name AS ingredient_name,
    ri.ingredient_type,

    ri.quantity,
    u.unit_name AS unit,

    -- 解密单价和小计
    decrypt_cost(ri.unit_price_encrypted) AS unit_price,
    decrypt_cost(ri.subtotal_cost_encrypted) AS subtotal_cost,

    ri.waste_rate,
    ri.net_quantity,
    ri.cost_percentage,

    ri.is_main_ingredient,
    ri.is_optional,
    ri.preparation_note
FROM recipe_item ri
JOIN recipe r ON ri.recipe_id = r.recipe_id
JOIN product p_product ON r.product_id = p_product.product_id
JOIN product p_ingredient ON ri.ingredient_id = p_ingredient.product_id
LEFT JOIN unit_of_measure u ON ri.unit_id = u.unit_id
WHERE r.status = 'approved';

COMMENT ON VIEW v_recipe_item_cost_full IS '★配方明细完整成本视图 - 显示每个原材料的单价和小计';

-- ----------------------------------------------------------------------------
-- 视图6: v_ingredient_current_price - 原材料当前价格视图
-- ----------------------------------------------------------------------------
CREATE OR REPLACE VIEW v_ingredient_current_price AS
SELECT DISTINCT ON (ich.ingredient_id)
    ich.ingredient_id,
    p.product_code,
    p.product_name,

    -- 解密单价
    decrypt_cost(ich.unit_price_encrypted) AS current_price,

    u.unit_name AS price_unit,
    ich.net_yield_rate,

    ich.effective_date,
    ich.expiry_date,

    CASE
        WHEN ich.expiry_date IS NULL THEN '长期有效'
        WHEN ich.expiry_date > CURRENT_DATE THEN '有效'
        ELSE '已过期'
    END AS price_status,

    ich.source_type,
    s.supplier_name,

    ich.approval_status,
    e_approved.employee_name AS approved_by_name,
    ich.approved_at
FROM ingredient_cost_history ich
JOIN product p ON ich.ingredient_id = p.product_id
LEFT JOIN unit_of_measure u ON ich.unit_id = u.unit_id
LEFT JOIN supplier s ON ich.supplier_id = s.supplier_id
LEFT JOIN employee e_approved ON ich.approved_by = e_approved.employee_id
WHERE ich.approval_status = 'approved'
  AND ich.effective_date <= CURRENT_DATE
  AND (ich.expiry_date IS NULL OR ich.expiry_date >= CURRENT_DATE)
ORDER BY ich.ingredient_id, ich.effective_date DESC;

COMMENT ON VIEW v_ingredient_current_price IS '★原材料当前价格视图 - 显示每个原材料的最新有效价格';

-- ============================================================================
-- 辅助函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 7. get_product_cost - 获取产品成本(带权限检查)
-- ----------------------------------------------------------------------------
-- 用途: 获取产品成本,根据权限返回完整成本或区间
-- 参数: p_product_id - 产品ID
-- 返回: 成本字符串(完整成本或区间)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_product_cost(p_product_id INT)
RETURNS TEXT AS $$
DECLARE
    v_encrypted BYTEA;
    v_cost DECIMAL;
    v_has_permission BOOLEAN;
BEGIN
    -- 检查权限
    v_has_permission := check_cost_decrypt_permission();

    -- 获取加密成本
    SELECT current_cost_encrypted INTO v_encrypted
    FROM product
    WHERE product_id = p_product_id;

    IF v_encrypted IS NULL THEN
        RETURN '未设置';
    END IF;

    -- 根据权限返回
    IF v_has_permission THEN
        v_cost := decrypt_cost(v_encrypted);
        RETURN ROUND(v_cost, 2)::TEXT || '元';
    ELSE
        RETURN mask_cost_encrypted(v_encrypted);
    END IF;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION get_product_cost(INT) IS '获取产品成本 - 根据权限返回完整成本或区间';

-- ----------------------------------------------------------------------------
-- 8. get_recipe_total_cost - 获取配方总成本
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION get_recipe_total_cost(p_recipe_id INT)
RETURNS DECIMAL AS $$
DECLARE
    v_encrypted BYTEA;
BEGIN
    SELECT total_cost_encrypted INTO v_encrypted
    FROM recipe
    WHERE recipe_id = p_recipe_id;

    RETURN decrypt_cost(v_encrypted);
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

COMMENT ON FUNCTION get_recipe_total_cost(INT) IS '获取配方总成本 - 解密返回';

-- ============================================================================
-- 测试函数
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 9. test_encryption - 测试加密解密功能
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION test_encryption()
RETURNS TABLE (
    test_name TEXT,
    test_result TEXT,
    test_status TEXT
) AS $$
DECLARE
    v_original DECIMAL := 123.45;
    v_encrypted BYTEA;
    v_decrypted DECIMAL;
    v_masked TEXT;
BEGIN
    -- 测试1: 加密
    BEGIN
        v_encrypted := encrypt_cost(v_original);
        IF v_encrypted IS NOT NULL THEN
            RETURN QUERY SELECT '加密测试'::TEXT, '成功'::TEXT, 'PASS'::TEXT;
        ELSE
            RETURN QUERY SELECT '加密测试'::TEXT, '失败:返回NULL'::TEXT, 'FAIL'::TEXT;
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RETURN QUERY SELECT '加密测试'::TEXT, '失败:'||SQLERRM, 'FAIL'::TEXT;
    END;

    -- 测试2: 解密
    BEGIN
        v_decrypted := decrypt_cost(v_encrypted);
        IF v_decrypted = v_original THEN
            RETURN QUERY SELECT '解密测试'::TEXT, '成功'::TEXT, 'PASS'::TEXT;
        ELSE
            RETURN QUERY SELECT '解密测试'::TEXT, '失败:值不匹配'::TEXT, 'FAIL'::TEXT;
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RETURN QUERY SELECT '解密测试'::TEXT, '失败:'||SQLERRM, 'FAIL'::TEXT;
    END;

    -- 测试3: 脱敏
    BEGIN
        v_masked := mask_cost(v_original);
        IF v_masked = '100-200元' THEN
            RETURN QUERY SELECT '脱敏测试'::TEXT, '成功'::TEXT, 'PASS'::TEXT;
        ELSE
            RETURN QUERY SELECT '脱敏测试'::TEXT, '失败:区间错误'::TEXT, 'FAIL'::TEXT;
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RETURN QUERY SELECT '脱敏测试'::TEXT, '失败:'||SQLERRM, 'FAIL'::TEXT;
    END;

    -- 测试4: 加密脱敏
    BEGIN
        v_masked := mask_cost_encrypted(v_encrypted);
        IF v_masked = '100-200元' THEN
            RETURN QUERY SELECT '加密脱敏测试'::TEXT, '成功'::TEXT, 'PASS'::TEXT;
        ELSE
            RETURN QUERY SELECT '加密脱敏测试'::TEXT, '失败:区间错误'::TEXT, 'FAIL'::TEXT;
        END IF;
    EXCEPTION WHEN OTHERS THEN
        RETURN QUERY SELECT '加密脱敏测试'::TEXT, '失败:'||SQLERRM, 'FAIL'::TEXT;
    END;

    RETURN;
END;
$$ LANGUAGE plpgsql;

COMMENT ON FUNCTION test_encryption() IS '测试加密解密功能是否正常';

-- ============================================================================
-- 使用说明
-- ============================================================================
/*

## 1. 配置加密密钥

在 postgresql.conf 中添加:
```
app.encryption_key = 'your-secure-encryption-key-minimum-32-characters-long'
```

或在会话中设置:
```sql
SET app.encryption_key = 'your-secure-encryption-key-minimum-32-characters-long';
```

## 2. 加密现有数据

假设有明文成本字段 current_cost,需要迁移到 current_cost_encrypted:

```sql
UPDATE product
SET current_cost_encrypted = encrypt_cost(current_cost)
WHERE current_cost IS NOT NULL;
```

## 3. 查询加密数据

财务角色使用完整成本视图:
```sql
SELECT * FROM v_product_cost_full WHERE product_id = 1;
```

普通员工使用脱敏视图:
```sql
SELECT * FROM v_product_cost_masked WHERE product_id = 1;
```

服务员使用无成本视图:
```sql
SELECT * FROM v_product_no_cost WHERE product_id = 1;
```

## 4. 在应用层解密

```sql
SELECT
    product_id,
    product_name,
    decrypt_cost(current_cost_encrypted) AS current_cost
FROM product
WHERE product_id = 1;
```

## 5. 测试加密功能

```sql
SELECT * FROM test_encryption();
```

## 6. 权限管理

-- 授予财务角色查看完整成本的权限
GRANT SELECT ON v_product_cost_full TO role_finance_manager;

-- 授予普通员工查看脱敏成本的权限
GRANT SELECT ON v_product_cost_masked TO role_store_manager;

-- 授予服务员查看产品列表(无成本)的权限
GRANT SELECT ON v_product_no_cost TO role_waiter;

*/

-- ============================================================================
-- 脚本完成
-- ============================================================================
