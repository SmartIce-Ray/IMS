-- ============================================================================
-- 野百灵餐饮集团 - 成本卡数据导入
-- ============================================================================
-- 版本: v1.0.0
-- 数据来源: 野百灵产品标准成本卡.xlsx
-- 原材料数量: 241
-- 产品数量: 87
-- 生成时间: 2025-11-22 08:15:26
-- ============================================================================

-- 设置加密密钥
SET app.encryption_key = 'ybl-restaurant-encryption-key-2025';

-- ============================================================================
-- 1. 原材料出成率更新
-- ============================================================================
-- 从成本卡更新原材料的标准出成率(std_yield_rate)
-- ============================================================================


UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '红油'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '乌鱼片'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '猪响皮'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '宣威火腿'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '水蜜桃'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '猪蹄'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.75
WHERE product_name = '鸡爪'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.75;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '鲜百合'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '血皮菜'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '鲜黄花'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '粗山药'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '姜柄瓜'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '花生芽'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '七彩土豆'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '藕'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '牛肝菌'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '球盖菇'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '鹿茸菇'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '绣球菌'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '小米辣'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '香茅'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '螺丝椒'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '番茄'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '折耳根'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '茄子'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '香菜'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '芭蕉叶'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '绿豆芽'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '黄瓜'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '青笋'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '黄豆芽'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.85
WHERE product_name = '薄荷'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.85;

UPDATE product SET std_yield_rate = 0.7
WHERE product_name = '甜玉米'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.7;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '洋葱'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '茴香苗'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '泡萝卜'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '去骨鸡腿肉'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.85
WHERE product_name = 'M9和牛'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.85;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '豆腐圆子'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '黄瓜花'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.7
WHERE product_name = '豌豆尖'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.7;

UPDATE product SET std_yield_rate = 0.3
WHERE product_name = '甜菊'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.3;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '甜笋'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '吊龙'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '匙仁'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.7
WHERE product_name = '胸口油'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.7;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '五花腱'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '铁棍山药面'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '花胶'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.7
WHERE product_name = '豌豆尖'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.7;

UPDATE product SET std_yield_rate = 0.85
WHERE product_name = '美肥'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.85;

UPDATE product SET std_yield_rate = 0.65
WHERE product_name = '龙须菜'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.65;

UPDATE product SET std_yield_rate = 0.6
WHERE product_name = '茼蒿'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.6;

UPDATE product SET std_yield_rate = 0.85
WHERE product_name = '人参苗'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.85;

UPDATE product SET std_yield_rate = 0.66
WHERE product_name = '紫白菜'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.66;

UPDATE product SET std_yield_rate = 0.7
WHERE product_name = '黄苦菊'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.7;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '新一代辣椒'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '毕节皱皮椒'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.9
WHERE product_name = '干花椒'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.9;

UPDATE product SET std_yield_rate = 0.95
WHERE product_name = '三黄鸡'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.95;

UPDATE product SET std_yield_rate = 0.8
WHERE product_name = '五花肉'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.8;

UPDATE product SET std_yield_rate = 0.6
WHERE product_name = '茼蒿'
  AND product_type = 'raw_material'
  AND std_yield_rate IS DISTINCT FROM 0.6;

-- 出成率<100%的原材料: 62 种

-- ============================================================================
-- 2. 新增原材料 (成本卡中有但数据库中没有的)
-- ============================================================================


-- 1. 红油 (品类:干杂, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-001',
    '红油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000100),
    0.95,
    '常温',
    '来源:自制 | 规格:- | 采购价:27.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '红油' AND product_type = 'raw_material'
);

-- 2. 水 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-002',
    '水',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:自制 | 规格:- | 采购价:0.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '水' AND product_type = 'raw_material'
);

-- 3. 冰块 (品类:其他, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-003',
    '冰块',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-OTHER'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:自制 | 规格:- | 采购价:0.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '冰块' AND product_type = 'raw_material'
);

-- 4. 香茅酱 (品类:自制酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-004',
    '香茅酱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-OTHER'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:自制 | 规格:- | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香茅酱' AND product_type = 'raw_material'
);

-- 5. 干巴菌酱 (品类:自制酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-005',
    '干巴菌酱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-OTHER'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:自制 | 规格:- | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干巴菌酱' AND product_type = 'raw_material'
);

-- 6. 鸭屎香乌龙茶汤 (品类:自制, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-006',
    '鸭屎香乌龙茶汤',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SELFMADE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '冷藏',
    '来源:自制 | 规格:- | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鸭屎香乌龙茶汤' AND product_type = 'raw_material'
);

-- 7. 山茶花茶汤 (品类:自制, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-007',
    '山茶花茶汤',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SELFMADE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '冷藏',
    '来源:自制 | 规格:- | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '山茶花茶汤' AND product_type = 'raw_material'
);

-- 8. 五指毛桃茶汤 (品类:自制, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-008',
    '五指毛桃茶汤',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SELFMADE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '冷藏',
    '来源:自制 | 规格:- | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五指毛桃茶汤' AND product_type = 'raw_material'
);

-- 9. 虾滑 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-009',
    '虾滑',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000736),
    1.0,
    '冷冻',
    '来源:7.虾滑群 | 规格:150g*30包/件 | 采购价:9.17元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '虾滑' AND product_type = 'raw_material'
);

-- 10. 乌鱼片 (品类:海鲜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-010',
    '乌鱼片',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000091),
    0.95,
    '冷冻',
    '来源:8.乌鱼片采购 | 规格:500g/袋 | 采购价:22.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '乌鱼片' AND product_type = 'raw_material'
);

-- 11. 雪花松板肉 (品类:肉类, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-011',
    '雪花松板肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000100),
    1.0,
    '冷冻',
    '来源:网采 | 规格:400g/袋 | 采购价:16.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '雪花松板肉' AND product_type = 'raw_material'
);

-- 12. 猪响皮 (品类:肉类, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-012',
    '猪响皮',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000100),
    0.95,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:25.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '猪响皮' AND product_type = 'raw_material'
);

-- 13. 糯米午餐肉 (品类:肉类, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-013',
    '糯米午餐肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000089),
    1.0,
    '常温',
    '来源:网采 | 规格:340g/罐 | 采购价:10.3元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糯米午餐肉' AND product_type = 'raw_material'
);

-- 14. 干花菜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-014',
    '干花菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000068),
    1.0,
    '常温',
    '来源:网采 | 规格:2500g/85.32元 | 采购价:17.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干花菜' AND product_type = 'raw_material'
);

-- 15. 干贡菜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-015',
    '干贡菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000182),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:45.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干贡菜' AND product_type = 'raw_material'
);

-- 16. 干黄花 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-016',
    '干黄花',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000106),
    1.0,
    '常温',
    '来源:网采 | 规格:20斤/件/530元 | 采购价:26.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干黄花' AND product_type = 'raw_material'
);

-- 17. 野菜卷（成品） (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-017',
    '野菜卷（成品）',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '冷藏',
    '来源:网采 | 规格:170元/件 20袋/件 10根/袋 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '野菜卷（成品）' AND product_type = 'raw_material'
);

-- 18. 木姜子油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-018',
    '木姜子油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:网采 | 规格:780ml/瓶 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '木姜子油' AND product_type = 'raw_material'
);

-- 19. 金蒜酥 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-019',
    '金蒜酥',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000080),
    1.0,
    '常温',
    '来源:9.泓泰商贸 | 规格:500g/袋 | 采购价:20.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '金蒜酥' AND product_type = 'raw_material'
);

-- 20. 黑松露酱 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-020',
    '黑松露酱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000500),
    1.0,
    '冷藏',
    '来源:网采 | 规格:500g/罐 | 采购价:125.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黑松露酱' AND product_type = 'raw_material'
);

-- 21. 墨鱼汁 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-021',
    '墨鱼汁',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000448),
    1.0,
    '冷藏',
    '来源:网采 | 规格:500g/罐 | 采购价:112.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '墨鱼汁' AND product_type = 'raw_material'
);

-- 22. 黄心皮蛋 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-022',
    '黄心皮蛋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(1.600000),
    1.0,
    '常温',
    '来源:网采 | 规格:个 | 采购价:1.6元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄心皮蛋' AND product_type = 'raw_material'
);

-- 23. 春卷皮 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-023',
    '春卷皮',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.200000),
    1.0,
    '冷藏',
    '来源:网采 | 规格:65张/斤/包 | 采购价:0.2元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '春卷皮' AND product_type = 'raw_material'
);

-- 24. 溏心蛋 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-024',
    '溏心蛋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:网采 | 规格:枚 | 采购价:2.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '溏心蛋' AND product_type = 'raw_material'
);

-- 25. 豆腐乳 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-025',
    '豆腐乳',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000075),
    1.0,
    '冷藏',
    '来源:网采 | 规格:310g/瓶 | 采购价:7.17元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豆腐乳' AND product_type = 'raw_material'
);

-- 26. 水豆豉 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-026',
    '水豆豉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000019),
    1.0,
    '冷藏',
    '来源:网采 | 规格:610g/瓶 | 采购价:7.13元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '水豆豉' AND product_type = 'raw_material'
);

-- 27. 黄天鹅无菌蛋 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-027',
    '黄天鹅无菌蛋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(1.890000),
    1.0,
    '常温15天',
    '来源:集采 | 规格:个 | 采购价:1.89元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄天鹅无菌蛋' AND product_type = 'raw_material'
);

-- 28. 玫瑰乳扇 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-028',
    '玫瑰乳扇',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000137),
    1.0,
    '冷藏',
    '来源:网采 | 规格:500g/袋 | 采购价:34.2元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '玫瑰乳扇' AND product_type = 'raw_material'
);

-- 29. 玫瑰酱 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-029',
    '玫瑰酱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000003),
    1.0,
    '冷藏',
    '来源:网采 | 规格:5000g/瓶 | 采购价:64.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '玫瑰酱' AND product_type = 'raw_material'
);

-- 30. 百香果原汁 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-030',
    '百香果原汁',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000032),
    1.0,
    '冷藏',
    '来源:网采 | 规格:10斤/80.8元 | 采购价:8.08元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '百香果原汁' AND product_type = 'raw_material'
);

-- 31. 干巴菌 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-031',
    '干巴菌',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000520),
    1.0,
    '常温',
    '来源:网采 | 规格:2斤/250元 | 采购价:130.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干巴菌' AND product_type = 'raw_material'
);

-- 32. 干玫瑰花 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-032',
    '干玫瑰花',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000472),
    1.0,
    '常温',
    '来源:网采 | 规格:- | 采购价:75.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干玫瑰花' AND product_type = 'raw_material'
);

-- 33. 宣威火腿 (品类:肉类, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-033',
    '宣威火腿',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000148),
    0.9,
    '冷藏',
    '来源:网采 | 规格:500g/块 | 采购价:36.96元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '宣威火腿' AND product_type = 'raw_material'
);

-- 34. 帕玛森干酪 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-034',
    '帕玛森干酪',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000745),
    1.0,
    '常温',
    '来源:网采 | 规格:200g/块 | 采购价:27.6元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '帕玛森干酪' AND product_type = 'raw_material'
);

-- 35. 香草冰淇淋 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-035',
    '香草冰淇淋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:网采 | 规格:3.5kg/桶 | 采购价:120.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香草冰淇淋' AND product_type = 'raw_material'
);

-- 36. 碧根果碎 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-036',
    '碧根果碎',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000120),
    1.0,
    '常温',
    '来源:网采 | 规格:500g*2罐/60元 | 采购价:30.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '碧根果碎' AND product_type = 'raw_material'
);

-- 37. 刺梨果干 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-037',
    '刺梨果干',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000061),
    1.0,
    '常温',
    '来源:网采 | 规格:450g/罐 | 采购价:12.4元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '刺梨果干' AND product_type = 'raw_material'
);

-- 38. 刺梨原浆 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-038',
    '刺梨原浆',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:网采 | 规格:200ml/袋*10袋/件 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '刺梨原浆' AND product_type = 'raw_material'
);

-- 39. 水蜜桃 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-039',
    '水蜜桃',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000100),
    0.9,
    '冷藏',
    '来源:绵阳水果 | 规格:- | 采购价:25.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '水蜜桃' AND product_type = 'raw_material'
);

-- 40. 荔枝 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-040',
    '荔枝',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(0.300000),
    1.0,
    '冷藏',
    '来源:绵阳水果 | 规格:颗 | 采购价:0.3元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '荔枝' AND product_type = 'raw_material'
);

-- 41. 猪蹄 (品类:肉类, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-041',
    '猪蹄',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000084),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:21.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '猪蹄' AND product_type = 'raw_material'
);

-- 42. 鸡爪 (品类:肉类, 出成率:75%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-042',
    '鸡爪',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000096),
    0.75,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:24.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鸡爪' AND product_type = 'raw_material'
);

-- 43. 鲜板栗 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-043',
    '鲜板栗',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜板栗' AND product_type = 'raw_material'
);

-- 44. 鲜百合 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-044',
    '鲜百合',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.002778),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:60g/袋 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜百合' AND product_type = 'raw_material'
);

-- 45. 血皮菜 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-045',
    '血皮菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '血皮菜' AND product_type = 'raw_material'
);

-- 46. 鲜黄花 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-046',
    '鲜黄花',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000120),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:30.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜黄花' AND product_type = 'raw_material'
);

-- 47. 粗山药 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-047',
    '粗山药',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000014),
    0.9,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:3.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '粗山药' AND product_type = 'raw_material'
);

-- 48. 姜柄瓜 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-048',
    '姜柄瓜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000032),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '姜柄瓜' AND product_type = 'raw_material'
);

-- 49. 花生芽 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-049',
    '花生芽',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000085),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:230g/袋 | 采购价:4.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '花生芽' AND product_type = 'raw_material'
);

-- 50. 七彩土豆 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-050',
    '七彩土豆',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000014),
    0.9,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:3.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '七彩土豆' AND product_type = 'raw_material'
);

-- 51. 藕 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-051',
    '藕',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    0.9,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '藕' AND product_type = 'raw_material'
);

-- 52. 黑豆腐 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-052',
    '黑豆腐',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000018),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:500g/盒 | 采购价:4.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黑豆腐' AND product_type = 'raw_material'
);

-- 53. 牛肝菌 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-053',
    '牛肝菌',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000128),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:32.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '牛肝菌' AND product_type = 'raw_material'
);

-- 54. 球盖菇 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-054',
    '球盖菇',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '球盖菇' AND product_type = 'raw_material'
);

-- 55. 鹿茸菇 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-055',
    '鹿茸菇',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000036),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:9.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鹿茸菇' AND product_type = 'raw_material'
);

-- 56. 绣球菌 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-056',
    '绣球菌',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000625),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:120g/包 | 采购价:9.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '绣球菌' AND product_type = 'raw_material'
);

-- 57. 金耳菌 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-057',
    '金耳菌',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000044),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:11.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '金耳菌' AND product_type = 'raw_material'
);

-- 58. 土豆 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-058',
    '土豆',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000005),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:1.3元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '土豆' AND product_type = 'raw_material'
);

-- 59. 姜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-059',
    '姜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '姜' AND product_type = 'raw_material'
);

-- 60. 大蒜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-060',
    '大蒜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000016),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:4.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '大蒜' AND product_type = 'raw_material'
);

-- 61. 小米辣 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-061',
    '小米辣',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000018),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:4.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '小米辣' AND product_type = 'raw_material'
);

-- 62. 香茅 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-062',
    '香茅',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香茅' AND product_type = 'raw_material'
);

-- 63. 蒜苗 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-063',
    '蒜苗',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000028),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:7.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '蒜苗' AND product_type = 'raw_material'
);

-- 64. 螺丝椒 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-064',
    '螺丝椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000016),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:4.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '螺丝椒' AND product_type = 'raw_material'
);

-- 65. 番茄 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-065',
    '番茄',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000014),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:3.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '番茄' AND product_type = 'raw_material'
);

-- 66. 折耳根 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-066',
    '折耳根',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '折耳根' AND product_type = 'raw_material'
);

-- 67. 茄子 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-067',
    '茄子',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000007),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:1.8元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '茄子' AND product_type = 'raw_material'
);

-- 68. 黄柠檬 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-068',
    '黄柠檬',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000026),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:6.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄柠檬' AND product_type = 'raw_material'
);

-- 69. 鲜花椒 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-069',
    '鲜花椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000050),
    1.0,
    '冷冻',
    '来源:2.绵阳蔬菜 | 规格:400g/袋 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜花椒' AND product_type = 'raw_material'
);

-- 70. 香菜 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-070',
    '香菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000026),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:6.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香菜' AND product_type = 'raw_material'
);

-- 71. 大香菜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-071',
    '大香菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000052),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:13.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '大香菜' AND product_type = 'raw_material'
);

-- 72. 美人椒 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-072',
    '美人椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000028),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:7.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '美人椒' AND product_type = 'raw_material'
);

-- 73. 小青柠 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-073',
    '小青柠',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000052),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:13.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '小青柠' AND product_type = 'raw_material'
);

-- 74. 芭蕉叶 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-074',
    '芭蕉叶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    0.9,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '芭蕉叶' AND product_type = 'raw_material'
);

-- 75. 绿豆芽 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-075',
    '绿豆芽',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000006),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:1.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '绿豆芽' AND product_type = 'raw_material'
);

-- 76. 黄瓜 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-076',
    '黄瓜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000016),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:4.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄瓜' AND product_type = 'raw_material'
);

-- 77. 青笋 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-077',
    '青笋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000008),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:2.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '青笋' AND product_type = 'raw_material'
);

-- 78. 豆皮 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-078',
    '豆皮',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豆皮' AND product_type = 'raw_material'
);

-- 79. 凉面 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-079',
    '凉面',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000012),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:3.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '凉面' AND product_type = 'raw_material'
);

-- 80. 二荆条 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-080',
    '二荆条',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '二荆条' AND product_type = 'raw_material'
);

-- 81. 黄豆芽 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-081',
    '黄豆芽',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000006),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:1.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄豆芽' AND product_type = 'raw_material'
);

-- 82. 小葱 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-082',
    '小葱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000015),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:3.8元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '小葱' AND product_type = 'raw_material'
);

-- 83. 大葱 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-083',
    '大葱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000008),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:2.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '大葱' AND product_type = 'raw_material'
);

-- 84. 法香 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-084',
    '法香',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000028),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:7.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '法香' AND product_type = 'raw_material'
);

-- 85. 千叶吊兰 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-085',
    '千叶吊兰',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:盆 | 采购价:18.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '千叶吊兰' AND product_type = 'raw_material'
);

-- 86. 羊齿叶 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-086',
    '羊齿叶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '羊齿叶' AND product_type = 'raw_material'
);

-- 87. 薄荷 (品类:蔬菜, 出成率:85%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-087',
    '薄荷',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000036),
    0.85,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:9.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '薄荷' AND product_type = 'raw_material'
);

-- 88. 紫苏叶 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-088',
    '紫苏叶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000032),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '紫苏叶' AND product_type = 'raw_material'
);

-- 89. 紫苏碎 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-089',
    '紫苏碎',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '紫苏碎' AND product_type = 'raw_material'
);

-- 90. 斑斓叶 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-090',
    '斑斓叶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '斑斓叶' AND product_type = 'raw_material'
);

-- 91. 莲白 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-091',
    '莲白',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000004),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:1.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '莲白' AND product_type = 'raw_material'
);

-- 92. 羽衣甘蓝 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-092',
    '羽衣甘蓝',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000032),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '羽衣甘蓝' AND product_type = 'raw_material'
);

-- 93. 红叶生菜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-093',
    '红叶生菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000028),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:7.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '红叶生菜' AND product_type = 'raw_material'
);

-- 94. 甜玉米 (品类:蔬菜, 出成率:70%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-094',
    '甜玉米',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000009),
    0.7,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:2.3元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '甜玉米' AND product_type = 'raw_material'
);

-- 95. 口蘑 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-095',
    '口蘑',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000044),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:11.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '口蘑' AND product_type = 'raw_material'
);

-- 96. 仔姜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-096',
    '仔姜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000028),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:7.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '仔姜' AND product_type = 'raw_material'
);

-- 97. 洋葱 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-097',
    '洋葱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000026),
    0.95,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:6.4元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '洋葱' AND product_type = 'raw_material'
);

-- 98. 粽叶 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-098',
    '粽叶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '粽叶' AND product_type = 'raw_material'
);

-- 99. 茴香苗 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-099',
    '茴香苗',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000036),
    0.9,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:9.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '茴香苗' AND product_type = 'raw_material'
);

-- 100. 白芹菜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-100',
    '白芹菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000014),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:3.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '白芹菜' AND product_type = 'raw_material'
);

-- 101. 猪肉沫 (品类:肉类, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-101',
    '猪肉沫',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000042),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '猪肉沫' AND product_type = 'raw_material'
);

-- 102. 饺子皮 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-102',
    '饺子皮',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000012),
    1.0,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:3.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '饺子皮' AND product_type = 'raw_material'
);

-- 103. 猪肉 (品类:肉类, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-103',
    '猪肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '猪肉' AND product_type = 'raw_material'
);

-- 104. 仔姜 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-104',
    '仔姜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000028),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:7.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '仔姜' AND product_type = 'raw_material'
);

-- 105. 罗非鱼 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-105',
    '罗非鱼',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(17.000000),
    1.0,
    '水养',
    '来源:4.绵阳海鲜 | 规格:条 | 采购价:17.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '罗非鱼' AND product_type = 'raw_material'
);

-- 106. 基围虾 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-106',
    '基围虾',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(2.000000),
    1.0,
    '水养',
    '来源:4.绵阳海鲜 | 规格:20g/只 | 采购价:2.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '基围虾' AND product_type = 'raw_material'
);

-- 107. 10头鲍 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-107',
    '10头鲍',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(6.500000),
    1.0,
    '水养',
    '来源:4.绵阳海鲜 | 规格:50g/个 | 采购价:6.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '10头鲍' AND product_type = 'raw_material'
);

-- 108. 小管 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-108',
    '小管',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(8.000000),
    1.0,
    '冷冻',
    '来源:4.绵阳海鲜 | 规格:个 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '小管' AND product_type = 'raw_material'
);

-- 109. 生蚝 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-109',
    '生蚝',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(3.500000),
    1.0,
    '水养',
    '来源:4.绵阳海鲜 | 规格:个 | 采购价:3.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '生蚝' AND product_type = 'raw_material'
);

-- 110. 海带丝 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-110',
    '海带丝',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000032),
    1.0,
    '冷藏',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '海带丝' AND product_type = 'raw_material'
);

-- 111. 泡萝卜 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-111',
    '泡萝卜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000016),
    0.95,
    '冷藏',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:4.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '泡萝卜' AND product_type = 'raw_material'
);

-- 112. 色拉油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-112',
    '色拉油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:- | 采购价:5.1元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '色拉油' AND product_type = 'raw_material'
);

-- 113. 菜籽油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-113',
    '菜籽油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000026),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:5000g/桶 | 采购价:7.2元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '菜籽油' AND product_type = 'raw_material'
);

-- 114. 鸡精 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-114',
    '鸡精',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:2500g/袋 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鸡精' AND product_type = 'raw_material'
);

-- 115. 味精 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-115',
    '味精',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000039),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:454g/袋 | 采购价:7.95元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '味精' AND product_type = 'raw_material'
);

-- 116. 盐 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-116',
    '盐',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000009),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:350g/袋 | 采购价:1.07元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '盐' AND product_type = 'raw_material'
);

-- 117. 胡椒粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-117',
    '胡椒粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000160),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:40.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '胡椒粉' AND product_type = 'raw_material'
);

-- 118. 花椒粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-118',
    '花椒粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000220),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:60.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '花椒粉' AND product_type = 'raw_material'
);

-- 119. 五香粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-119',
    '五香粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000048),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:12.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五香粉' AND product_type = 'raw_material'
);

-- 120. 小麦自发粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-120',
    '小麦自发粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000012),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:2500/袋 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '小麦自发粉' AND product_type = 'raw_material'
);

-- 121. 生粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-121',
    '生粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000022),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:5.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '生粉' AND product_type = 'raw_material'
);

-- 122. 红薯淀粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-122',
    '红薯淀粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000024),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:6.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '红薯淀粉' AND product_type = 'raw_material'
);

-- 123. 草果粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-123',
    '草果粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000168),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:42.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '草果粉' AND product_type = 'raw_material'
);

-- 124. 白糖 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-124',
    '白糖',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000016),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:4.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '白糖' AND product_type = 'raw_material'
);

-- 125. 郫县豆瓣 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-125',
    '郫县豆瓣',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000016),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:7斤/瓶 | 采购价:4.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '郫县豆瓣' AND product_type = 'raw_material'
);

-- 126. 藤椒油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-126',
    '藤椒油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000092),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:500ml/瓶 | 采购价:23.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '藤椒油' AND product_type = 'raw_material'
);

-- 127. 花椒油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-127',
    '花椒油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:330ml/瓶 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '花椒油' AND product_type = 'raw_material'
);

-- 128. 生抽 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-128',
    '生抽',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:1.75L/瓶 6瓶/件 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '生抽' AND product_type = 'raw_material'
);

-- 129. 陈醋 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-129',
    '陈醋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000017),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:420ml/瓶 24瓶/件 | 采购价:3.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '陈醋' AND product_type = 'raw_material'
);

-- 130. 苹果醋 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-130',
    '苹果醋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:450ml/瓶 12瓶/件 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '苹果醋' AND product_type = 'raw_material'
);

-- 131. 大米 (品类:干杂, 出成率:150%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-131',
    '大米',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000010),
    1.5,
    '常温',
    '来源:3.绵阳干杂 | 规格:50斤/袋 | 采购价:3.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '大米' AND product_type = 'raw_material'
);

-- 132. 鸡蛋 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-132',
    '鸡蛋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'piece'),
    encrypt_cost(0.500000),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:个 | 采购价:0.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鸡蛋' AND product_type = 'raw_material'
);

-- 133. 芥末 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-133',
    '芥末',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.002704),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:43g/盒 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '芥末' AND product_type = 'raw_material'
);

-- 134. 猪油 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-134',
    '猪油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000032),
    1.0,
    '常温',
    '来源:网采 | 规格:2.5kg/桶 | 采购价:6.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '猪油' AND product_type = 'raw_material'
);

-- 135. 香油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-135',
    '香油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000126),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:378ml/瓶 | 采购价:5.88元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香油' AND product_type = 'raw_material'
);

-- 136. 蚝油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-136',
    '蚝油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000001),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:6L/桶 | 采购价:40.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '蚝油' AND product_type = 'raw_material'
);

-- 137. 黄灯笼辣椒酱 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-137',
    '黄灯笼辣椒酱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:700g/瓶 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄灯笼辣椒酱' AND product_type = 'raw_material'
);

-- 138. 蒜蓉辣椒酱 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-138',
    '蒜蓉辣椒酱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000002),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:6.3kg/桶 98元 | 采购价:98.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '蒜蓉辣椒酱' AND product_type = 'raw_material'
);

-- 139. 干红花椒 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-139',
    '干红花椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000220),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:55.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干红花椒' AND product_type = 'raw_material'
);

-- 140. 辣鲜露 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-140',
    '辣鲜露',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'ml'),
    encrypt_cost(0.000164),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:448ml/瓶 | 采购价:33.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '辣鲜露' AND product_type = 'raw_material'
);

-- 141. 鸡油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-141',
    '鸡油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000009),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:5斤/桶 | 采购价:55.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鸡油' AND product_type = 'raw_material'
);

-- 142. 东古酱油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-142',
    '东古酱油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:12瓶/108元 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '东古酱油' AND product_type = 'raw_material'
);

-- 143. 泡野山椒 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-143',
    '泡野山椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000032),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '泡野山椒' AND product_type = 'raw_material'
);

-- 144. 新一代辣椒面 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-144',
    '新一代辣椒面',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000064),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:16.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '新一代辣椒面' AND product_type = 'raw_material'
);

-- 145. 去骨鸡腿肉 (品类:肉类, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-145',
    '去骨鸡腿肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000030),
    0.95,
    '冷藏',
    '来源:6.绵阳干冰 | 规格:- | 采购价:7.4元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '去骨鸡腿肉' AND product_type = 'raw_material'
);

-- 146. 干冰 (品类:低值易耗, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-146',
    '干冰',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-OTHER'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000014),
    1.0,
    '常温',
    '来源:6.绵阳干冰 | 规格:称重 | 采购价:3.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干冰' AND product_type = 'raw_material'
);

-- 147. 啤酒 (品类:酒水, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-147',
    '啤酒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-LIQUOR'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000024),
    1.0,
    '常温',
    '来源:5.酒商 | 规格:瓶 | 采购价:6.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '啤酒' AND product_type = 'raw_material'
);

-- 148. M9和牛 (品类:肉类, 出成率:85%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-148',
    'M9和牛',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000320),
    0.85,
    '冷冻',
    '来源:集采 | 规格:称重 | 采购价:80.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = 'M9和牛' AND product_type = 'raw_material'
);

-- 149. 和牛肉糜 (品类:肉类, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-149',
    '和牛肉糜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '冷冻',
    '来源:集采 | 规格:称重 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '和牛肉糜' AND product_type = 'raw_material'
);

-- 150. 软哨 (品类:肉类, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-150',
    '软哨',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000144),
    1.0,
    '冷藏',
    '来源:集采 | 规格:500g/袋 | 采购价:36.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '软哨' AND product_type = 'raw_material'
);

-- 151. 木姜子 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-151',
    '木姜子',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000072),
    1.0,
    '冷冻',
    '来源:集采 | 规格:称重 | 采购价:18.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '木姜子' AND product_type = 'raw_material'
);

-- 152. 糍粑辣椒 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-152',
    '糍粑辣椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    1.0,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糍粑辣椒' AND product_type = 'raw_material'
);

-- 153. 糊辣椒 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-153',
    '糊辣椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000100),
    1.0,
    '常温',
    '来源:集采 | 规格:称重 | 采购价:25.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糊辣椒' AND product_type = 'raw_material'
);

-- 154. 贵州五香辣椒面 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-154',
    '贵州五香辣椒面',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000080),
    1.0,
    '常温',
    '来源:集采 | 规格:称重 | 采购价:20.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '贵州五香辣椒面' AND product_type = 'raw_material'
);

-- 155. 脆哨 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-155',
    '脆哨',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000108),
    1.0,
    '冷藏',
    '来源:集采 | 规格:500g/袋 | 采购价:27.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '脆哨' AND product_type = 'raw_material'
);

-- 156. 豆腐圆子 (品类:干杂, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-156',
    '豆腐圆子',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    0.9,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豆腐圆子' AND product_type = 'raw_material'
);

-- 157. 糟辣椒 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-157',
    '糟辣椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    1.0,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糟辣椒' AND product_type = 'raw_material'
);

-- 158. 脆哨沫 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-158',
    '脆哨沫',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000052),
    1.0,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:13.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '脆哨沫' AND product_type = 'raw_material'
);

-- 159. 软哨片 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-159',
    '软哨片',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000144),
    1.0,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:36.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '软哨片' AND product_type = 'raw_material'
);

-- 160. 软哨颗粒 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-160',
    '软哨颗粒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000144),
    1.0,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:36.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '软哨颗粒' AND product_type = 'raw_material'
);

-- 161. 蘸料辣椒 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-161',
    '蘸料辣椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000220),
    1.0,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:55.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '蘸料辣椒' AND product_type = 'raw_material'
);

-- 162. 烧椒 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-162',
    '烧椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000184),
    1.0,
    '冷藏',
    '来源:集采 | 规格:称重 | 采购价:46.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '烧椒' AND product_type = 'raw_material'
);

-- 163. 酸汤底料 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-163',
    '酸汤底料',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000234),
    1.0,
    '常温',
    '来源:集采 | 规格:160g*48袋/件 | 采购价:6.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '酸汤底料' AND product_type = 'raw_material'
);

-- 164. 香辣包 (品类:酱料, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-164',
    '香辣包',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SAUCE'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000111),
    1.0,
    '常温',
    '来源:集采 | 规格:- | 采购价:2.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香辣包' AND product_type = 'raw_material'
);

-- 165. 果葡糖浆 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-165',
    '果葡糖浆',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000003),
    1.0,
    '常温',
    '来源:集采 | 规格:2.5kg*6桶 | 采购价:20.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '果葡糖浆' AND product_type = 'raw_material'
);

-- 166. 薏仁罐头 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-166',
    '薏仁罐头',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000019),
    1.0,
    '常温',
    '来源:集采 | 规格:900g/罐 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '薏仁罐头' AND product_type = 'raw_material'
);

-- 167. 鸭屎香乌龙茶茶叶 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-167',
    '鸭屎香乌龙茶茶叶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000322),
    1.0,
    '常温',
    '来源:集采 | 规格:300g/包 | 采购价:29.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鸭屎香乌龙茶茶叶' AND product_type = 'raw_material'
);

-- 168. 山茶花乌龙茶 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-168',
    '山茶花乌龙茶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000500),
    1.0,
    '常温',
    '来源:集采 | 规格:300g/包*30包/箱 | 采购价:45.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '山茶花乌龙茶' AND product_type = 'raw_material'
);

-- 169. 五指毛桃茶包 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-169',
    '五指毛桃茶包',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:集采 | 规格:8g/泡*50泡/包*20包/箱 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五指毛桃茶包' AND product_type = 'raw_material'
);

-- 170. 家乐柠檬粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-170',
    '家乐柠檬粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000106),
    1.0,
    '常温',
    '来源:9.泓泰商贸 | 规格:400g/袋 | 采购价:17.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '家乐柠檬粉' AND product_type = 'raw_material'
);

-- 171. 泰船味露 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-171',
    '泰船味露',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000003),
    1.0,
    '常温',
    '来源:9.泓泰商贸 | 规格:4.5L/桶 | 采购价:56.25元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '泰船味露' AND product_type = 'raw_material'
);

-- 172. 鱼露 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-172',
    '鱼露',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:9.泓泰商贸 | 规格:4.5L/桶 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鱼露' AND product_type = 'raw_material'
);

-- 173. 干香茅草 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-173',
    '干香茅草',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    1.0,
    '常温',
    '来源:10.干茅草、五指毛桃群 | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干香茅草' AND product_type = 'raw_material'
);

-- 174. 五指毛桃干 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-174',
    '五指毛桃干',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000080),
    1.0,
    '常温',
    '来源:干茅草、五指毛桃群 | 规格:称重 | 采购价:25.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五指毛桃干' AND product_type = 'raw_material'
);

-- 175. 黄瓜花 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-175',
    '黄瓜花',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000140),
    0.9,
    '冷藏',
    '来源:2.成都蔬菜 | 规格:称重 | 采购价:35.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄瓜花' AND product_type = 'raw_material'
);

-- 176. 豌豆尖 (品类:蔬菜, 出成率:70%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-176',
    '豌豆尖',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000044),
    0.7,
    '冷藏',
    '来源:2.成都蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豌豆尖' AND product_type = 'raw_material'
);

-- 177. 波斯草 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-177',
    '波斯草',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '冷藏',
    '来源:2.成都蔬菜 | 规格:称重 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '波斯草' AND product_type = 'raw_material'
);

-- 178. 甜菊 (品类:蔬菜, 出成率:30%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-178',
    '甜菊',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    0.3,
    '冷藏',
    '来源:2.成都蔬菜 | 规格:称重 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '甜菊' AND product_type = 'raw_material'
);

-- 179. 甜笋 (品类:蔬菜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-179',
    '甜笋',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000048),
    0.9,
    '冷藏',
    '来源:2.成都蔬菜 | 规格:称重 | 采购价:12.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '甜笋' AND product_type = 'raw_material'
);

-- 180. 吊龙 (品类:肉类, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-180',
    '吊龙',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000208),
    0.9,
    '冷藏',
    '来源:1.成都牛肉供货商 | 规格:称重 | 采购价:52.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '吊龙' AND product_type = 'raw_material'
);

-- 181. 匙仁 (品类:肉类, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-181',
    '匙仁',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000184),
    0.9,
    '冷藏',
    '来源:1.成都牛肉供货商 | 规格:称重 | 采购价:46.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '匙仁' AND product_type = 'raw_material'
);

-- 182. 胸口油 (品类:肉类, 出成率:70%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-182',
    '胸口油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000208),
    0.7,
    '冷藏',
    '来源:1.成都牛肉供货商 | 规格:称重 | 采购价:52.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '胸口油' AND product_type = 'raw_material'
);

-- 183. 五花腱 (品类:肉类, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-183',
    '五花腱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000180),
    0.9,
    '冷藏',
    '来源:1.成都牛肉供货商 | 规格:称重 | 采购价:45.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五花腱' AND product_type = 'raw_material'
);

-- 184. 香水柠檬 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-184',
    '香水柠檬',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000036),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:9.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香水柠檬' AND product_type = 'raw_material'
);

-- 185. 铁棍山药面 (品类:主食, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-185',
    '铁棍山药面',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-OTHER'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    0.9,
    '常温',
    '来源:网采 | 规格:10斤 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '铁棍山药面' AND product_type = 'raw_material'
);

-- 186. 带皮牛肉 (品类:肉类, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-186',
    '带皮牛肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000149),
    1.0,
    '冷冻',
    '来源:- | 规格:150g/袋 | 采购价:37.33元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '带皮牛肉' AND product_type = 'raw_material'
);

-- 187. 红枫叶 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-187',
    '红枫叶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000000),
    1.0,
    '常温',
    '来源:网采 | 规格:90张/35元 | 采购价:0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '红枫叶' AND product_type = 'raw_material'
);

-- 188. 花胶 (品类:海鲜, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-188',
    '花胶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000173),
    0.9,
    '常温',
    '来源:- | 规格:150g/袋*50袋 | 采购价:43.33元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '花胶' AND product_type = 'raw_material'
);

-- 189. 豌豆尖 (品类:蔬菜, 出成率:70%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-189',
    '豌豆尖',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000044),
    0.7,
    '常温',
    '来源:2.成都蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豌豆尖' AND product_type = 'raw_material'
);

-- 190. 脆三丁 (品类:其他, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-190',
    '脆三丁',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-OTHER'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000140),
    1.0,
    '常温',
    '来源:- | 规格:称重 | 采购价:35.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '脆三丁' AND product_type = 'raw_material'
);

-- 191. 美肥 (品类:肉类, 出成率:85%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-191',
    '美肥',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-MEAT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000180),
    0.85,
    '常温',
    '来源:1.成都牛肉供货商 | 规格:称重 | 采购价:45.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '美肥' AND product_type = 'raw_material'
);

-- 192. 油炸折耳根 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-192',
    '油炸折耳根',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000120),
    1.0,
    '常温',
    '来源:- | 规格:称重 | 采购价:30.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '油炸折耳根' AND product_type = 'raw_material'
);

-- 193. 龙须菜 (品类:蔬菜, 出成率:65%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-193',
    '龙须菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000044),
    0.65,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:11.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '龙须菜' AND product_type = 'raw_material'
);

-- 194. 茼蒿 (品类:蔬菜, 出成率:60%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-194',
    '茼蒿',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000024),
    0.6,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:6.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '茼蒿' AND product_type = 'raw_material'
);

-- 195. 人参苗 (品类:蔬菜, 出成率:85%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-195',
    '人参苗',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    0.85,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '人参苗' AND product_type = 'raw_material'
);

-- 196. 紫白菜 (品类:蔬菜, 出成率:66%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-196',
    '紫白菜',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000048),
    0.66,
    '冷藏',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:12.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '紫白菜' AND product_type = 'raw_material'
);

-- 197. 黄苦菊 (品类:蔬菜, 出成率:70%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-197',
    '黄苦菊',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000048),
    0.7,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:12.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄苦菊' AND product_type = 'raw_material'
);

-- 198. 小米渣 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-198',
    '小米渣',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000132),
    1.0,
    '冷冻',
    '来源:网采 | 规格:称重 | 采购价:21.13元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '小米渣' AND product_type = 'raw_material'
);

-- 199. 斑斓酱 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-199',
    '斑斓酱',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000168),
    1.0,
    '冷藏',
    '来源:- | 规格:称重 | 采购价:88.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '斑斓酱' AND product_type = 'raw_material'
);

-- 200. 新一代辣椒面 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-200',
    '新一代辣椒面',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:16.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '新一代辣椒面' AND product_type = 'raw_material'
);

-- 201. 新一代辣椒 (品类:干杂, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-201',
    '新一代辣椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000064),
    0.9,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:18.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '新一代辣椒' AND product_type = 'raw_material'
);

-- 202. 毕节皱皮椒 (品类:干杂, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-202',
    '毕节皱皮椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000120),
    0.9,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:24.6元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '毕节皱皮椒' AND product_type = 'raw_material'
);

-- 203. 芝麻 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-203',
    '芝麻',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000042),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '芝麻' AND product_type = 'raw_material'
);

-- 204. 干花椒 (品类:干杂, 出成率:90%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-204',
    '干花椒',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000122),
    0.9,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:55.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干花椒' AND product_type = 'raw_material'
);

-- 205. 三黄鸡 (品类:蔬菜, 出成率:95%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-205',
    '三黄鸡',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000048),
    0.95,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:12.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '三黄鸡' AND product_type = 'raw_material'
);

-- 206. 鲈鱼 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-206',
    '鲈鱼',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000064),
    1.0,
    '常温',
    '来源:4.绵阳海鲜 | 规格:称重 | 采购价:16.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲈鱼' AND product_type = 'raw_material'
);

-- 207. 黄辣丁 (品类:海鲜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-207',
    '黄辣丁',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-SEAFOOD'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000056),
    1.0,
    '常温',
    '来源:4.绵阳海鲜 | 规格:称重 | 采购价:14.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄辣丁' AND product_type = 'raw_material'
);

-- 208. 五花肉 (品类:蔬菜, 出成率:80%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-208',
    '五花肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000064),
    0.8,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:16.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五花肉' AND product_type = 'raw_material'
);

-- 209. 耗油 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-209',
    '耗油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000018),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:4.58元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '耗油' AND product_type = 'raw_material'
);

-- 210. 芒果 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-210',
    '芒果',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000040),
    1.0,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:10.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '芒果' AND product_type = 'raw_material'
);

-- 211. 莲子罐头 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-211',
    '莲子罐头',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000037),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:29.8元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '莲子罐头' AND product_type = 'raw_material'
);

-- 212. 烧仙草罐头 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-212',
    '烧仙草罐头',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000022),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '烧仙草罐头' AND product_type = 'raw_material'
);

-- 213. 芋泥罐头 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-213',
    '芋泥罐头',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000020),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:15.8元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '芋泥罐头' AND product_type = 'raw_material'
);

-- 214. 荔枝罐头 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-214',
    '荔枝罐头',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000029),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:21.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '荔枝罐头' AND product_type = 'raw_material'
);

-- 215. 糖桂花 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-215',
    '糖桂花',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000056),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:5.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糖桂花' AND product_type = 'raw_material'
);

-- 216. 海石花 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-216',
    '海石花',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000212),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:53.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '海石花' AND product_type = 'raw_material'
);

-- 217. 网状春卷皮 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-217',
    '网状春卷皮',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000053),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:13.18元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '网状春卷皮' AND product_type = 'raw_material'
);

-- 218. 红辣椒丝 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-218',
    '红辣椒丝',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.059000),
    1.0,
    '常温',
    '来源:- | 规格:称重 | 采购价:6.6元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '红辣椒丝' AND product_type = 'raw_material'
);

-- 219. 千丝酥皮 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-219',
    '千丝酥皮',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000130),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:32.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '千丝酥皮' AND product_type = 'raw_material'
);

-- 220. 茼蒿 (品类:蔬菜, 出成率:60%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-220',
    '茼蒿',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000024),
    0.6,
    '常温',
    '来源:2.绵阳蔬菜 | 规格:称重 | 采购价:6.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '茼蒿' AND product_type = 'raw_material'
);

-- 221. 烟熏腊肉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-221',
    '烟熏腊肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000066),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:16.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '烟熏腊肉' AND product_type = 'raw_material'
);

-- 222. 蜜薯 (品类:蔬菜, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-222',
    '蜜薯',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-VEG'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000017),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:4.15元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '蜜薯' AND product_type = 'raw_material'
);

-- 223. 糖粉 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-223',
    '糖粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000099),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:15.8元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糖粉' AND product_type = 'raw_material'
);

-- 224. 干桂花 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-224',
    '干桂花',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000273),
    1.0,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:62.5元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干桂花' AND product_type = 'raw_material'
);

-- 225. 豆米底料 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-225',
    '豆米底料',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000045),
    1.0,
    '常温',
    '来源:集采 | 规格:称重 | 采购价:12.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豆米底料' AND product_type = 'raw_material'
);

-- 226. 米饭 (品类:干杂, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-226',
    '米饭',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000005),
    1.0,
    '常温',
    '来源:3.绵阳干杂 | 规格:称重 | 采购价:1.33元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '米饭' AND product_type = 'raw_material'
);

-- 227. 冷冻龙眼肉 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-227',
    '冷冻龙眼肉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000160),
    1.0,
    '常温',
    '来源:集采 | 规格:500g/袋*20 袋/箱 | 采购价:40.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '冷冻龙眼肉' AND product_type = 'raw_material'
);

-- 228. 桂花酒酿 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-228',
    '桂花酒酿',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000037),
    1.0,
    '常温',
    '来源:集采 | 规格:1 .2kg/瓶*12 瓶/箱 | 采购价:54.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '桂花酒酿' AND product_type = 'raw_material'
);

-- 229. 蔗糖糖浆 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-229',
    '蔗糖糖浆',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000007),
    1.0,
    '常温',
    '来源:集采 | 规格:2.5kg/瓶*8 瓶/箱 | 采购价:42.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '蔗糖糖浆' AND product_type = 'raw_material'
);

-- 230. 牛乳粉 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-230',
    '牛乳粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000050),
    1.0,
    '常温',
    '来源:集采 | 规格:1kg/包/*20包/箱 | 采购价:50.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '牛乳粉' AND product_type = 'raw_material'
);

-- 231. 糯米 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-231',
    '糯米',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000016),
    1.0,
    '常温',
    '来源:- | 规格:称重 | 采购价:4.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糯米' AND product_type = 'raw_material'
);

-- 232. 鲜龙眼 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-232',
    '鲜龙眼',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    1.0,
    '常温',
    '来源:- | 规格:称重 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜龙眼' AND product_type = 'raw_material'
);

-- 233. 雪域藏茶 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-233',
    '雪域藏茶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000320),
    1.0,
    '常温',
    '来源:集采 | 规格:500g/袋*25 袋/箱 | 采购价:80.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '雪域藏茶' AND product_type = 'raw_material'
);

-- 234. 雪域藏茶茶汤 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-234',
    '雪域藏茶茶汤',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000004),
    1.0,
    '常温',
    '来源:自制 | 规格:称重 | 采购价:8.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '雪域藏茶茶汤' AND product_type = 'raw_material'
);

-- 235. 金桔柠檬果蓉 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-235',
    '金桔柠檬果蓉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000033),
    1.0,
    '常温',
    '来源:集采 | 规格:1 .2kg/瓶*12 瓶/箱 | 采购价:48.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '金桔柠檬果蓉' AND product_type = 'raw_material'
);

-- 236. 冷冻柿子浆 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-236',
    '冷冻柿子浆',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000060),
    1.0,
    '常温',
    '来源:集采 | 规格:500g/袋*20 袋/箱 | 采购价:15.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '冷冻柿子浆' AND product_type = 'raw_material'
);

-- 237. 奶油奶酪 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-237',
    '奶油奶酪',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000008),
    1.0,
    '常温',
    '来源:网采 | 规格:2kg/袋*3袋/箱 | 采购价:276.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '奶油奶酪' AND product_type = 'raw_material'
);

-- 238. 淡奶油 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-238',
    '淡奶油',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000023),
    1.0,
    '常温',
    '来源:网采 | 规格:1000g/盒*12盒/箱 | 采购价:22.92元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '淡奶油' AND product_type = 'raw_material'
);

-- 239. 全脂牛奶 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-239',
    '全脂牛奶',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000011),
    1.0,
    '常温',
    '来源:网采 | 规格:1000g/盒*12盒/箱 | 采购价:12.08元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '全脂牛奶' AND product_type = 'raw_material'
);

-- 240. 百利凝胶片 (品类:糖水铺, 出成率:100%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-240',
    '百利凝胶片',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DESSERT'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000075),
    1.0,
    '常温',
    '来源:网采 | 规格:1kg/盒 | 采购价:75.0元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '百利凝胶片' AND product_type = 'raw_material'
);

-- 241. 定西土豆粉 (品类:干杂, 出成率:290%)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, std_yield_rate, storage_condition,
    description, is_active
)
SELECT
    'RM-CC-241',
    '定西土豆粉',
    'raw_material',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-DRY'),
    FALSE,
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
    encrypt_cost(0.000026),
    2.9,
    '常温',
    '来源:网采 | 规格:称重 | 采购价:6.6元',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '定西土豆粉' AND product_type = 'raw_material'
);


-- ============================================================================
-- 3. 成品产品数据 (来自成本卡)
-- ============================================================================


-- 1. 云山雪花吊龙 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-001',
    '云山雪花吊龙',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '云山雪花吊龙' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 2. 木姜子鲜黄牛肉 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-002',
    '木姜子鲜黄牛肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '木姜子鲜黄牛肉' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 3. 糊辣椒鲜黄牛匙仁 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-003',
    '糊辣椒鲜黄牛匙仁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糊辣椒鲜黄牛匙仁' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 4. 野蒜酥五花趾 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-004',
    '野蒜酥五花趾',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '野蒜酥五花趾' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 5. 紫苏半边云 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-005',
    '紫苏半边云',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '紫苏半边云' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 6. 大地飞雪(M9纯血和牛) (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-006',
    '大地飞雪(M9纯血和牛)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '大地飞雪(M9纯血和牛)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 7. 黑松露和牛肉开口笑 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-007',
    '黑松露和牛肉开口笑',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黑松露和牛肉开口笑' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 8. 黑松露和牛肉开口笑 (原材料:6种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-008',
    '黑松露和牛肉开口笑',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 6种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黑松露和牛肉开口笑' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 9. 贵州传统软哨 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-009',
    '贵州传统软哨',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '贵州传统软哨' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 10. 水晶滑肉混合物(半成品) (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-010',
    '水晶滑肉混合物(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '水晶滑肉混合物(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 11. 手工水晶滑肉 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-011',
    '手工水晶滑肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '手工水晶滑肉' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 12. 过油响皮 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-012',
    '过油响皮',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '过油响皮' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 13. 糯米午餐肉 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-013',
    '糯米午餐肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糯米午餐肉' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 14. 净水鲜虾 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-014',
    '净水鲜虾',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '净水鲜虾' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 15. 乌鱼片 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-015',
    '乌鱼片',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '乌鱼片' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 16. 海鲜拼盘 (原材料:5种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-016',
    '海鲜拼盘',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 5种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '海鲜拼盘' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 17. 黑金虾滑 (原材料:4种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-017',
    '黑金虾滑',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 4种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黑金虾滑' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 18. 鲜板栗 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-018',
    '鲜板栗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜板栗' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 19. 鲜百合 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-019',
    '鲜百合',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜百合' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 20. 血皮菜 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-020',
    '血皮菜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '血皮菜' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 21. 鲜黄花 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-021',
    '鲜黄花',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鲜黄花' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 22. 山药 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-022',
    '山药',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '山药' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 23. 甜笋(刺身级) (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-023',
    '甜笋(刺身级)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '甜笋(刺身级)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 24. 三脆碗 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-024',
    '三脆碗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '三脆碗' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 25. 姜柄瓜 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-025',
    '姜柄瓜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '姜柄瓜' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 26. 双花碗 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-026',
    '双花碗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '双花碗' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 27. 彩云土豆 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-027',
    '彩云土豆',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '彩云土豆' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 28. 藕 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-028',
    '藕',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '藕' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 29. 石磨黑豆腐 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-029',
    '石磨黑豆腐',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '石磨黑豆腐' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 30. 野篮子菌菇组合 (原材料:7种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-030',
    '野篮子菌菇组合',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 7种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '野篮子菌菇组合' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 31. 香茅酱(半成品) (原材料:10种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-031',
    '香茅酱(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 10种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '香茅酱(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 32. 火烧云铜锅油焖鸡 (原材料:8种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-032',
    '火烧云铜锅油焖鸡',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 8种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '火烧云铜锅油焖鸡' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 33. 息烽虎皮猪蹄 (原材料:9种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-033',
    '息烽虎皮猪蹄',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 9种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '息烽虎皮猪蹄' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 34. 干巴菌酱(半成品) (原材料:4种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-034',
    '干巴菌酱(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 4种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干巴菌酱(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 35. 干巴菌炒饭 (原材料:8种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-035',
    '干巴菌炒饭',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 8种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '干巴菌炒饭' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 36. 糟辣椒炒饭 (原材料:4种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-036',
    '糟辣椒炒饭',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 4种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '糟辣椒炒饭' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 37. 野佐料擂椒皮蛋 (原材料:18种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-037',
    '野佐料擂椒皮蛋',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 18种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '野佐料擂椒皮蛋' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 38. 木姜子鸡爪 (原材料:13种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-038',
    '木姜子鸡爪',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 13种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '木姜子鸡爪' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 39. 青柠檬汁(半成品) (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-039',
    '青柠檬汁(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '青柠檬汁(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 40. 酸辣酱(半成品) (原材料:8种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-040',
    '酸辣酱(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 8种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '酸辣酱(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 41. 混合香草(半成品) (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-041',
    '混合香草(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '混合香草(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 42. 傣村手撕罗非鱼 (原材料:6种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-042',
    '傣村手撕罗非鱼',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 6种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '傣村手撕罗非鱼' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 43. 贵州非遗丝娃娃 (原材料:15种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-043',
    '贵州非遗丝娃娃',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 15种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '贵州非遗丝娃娃' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 44. 老凯里非遗酸汤 (原材料:12种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-044',
    '老凯里非遗酸汤',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 12种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '老凯里非遗酸汤' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 45. 豆腐丸子蘸酱(半成品) (原材料:11种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-045',
    '豆腐丸子蘸酱(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 11种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豆腐丸子蘸酱(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 46. 苗侗空气丸子 (原材料:4种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-046',
    '苗侗空气丸子',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 4种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '苗侗空气丸子' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 47. 玉米糊(半成品) (原材料:6种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-047',
    '玉米糊(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 6种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '玉米糊(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 48. 雪顶冰淇淋玉米粑 (原材料:4种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-048',
    '雪顶冰淇淋玉米粑',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 4种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '雪顶冰淇淋玉米粑' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 49. 野菜卷 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-049',
    '野菜卷',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '野菜卷' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 50. 山玫瑰炸乳扇 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-050',
    '山玫瑰炸乳扇',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '山玫瑰炸乳扇' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 51. 怪噜洋芋酱(半成品) (原材料:7种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-051',
    '怪噜洋芋酱(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 7种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '怪噜洋芋酱(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 52. 怪噜洋芋 (原材料:6种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-052',
    '怪噜洋芋',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 6种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '怪噜洋芋' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 53. 紫苏汤(半成品) (原材料:6种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-053',
    '紫苏汤(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 6种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '紫苏汤(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 54. 紫苏桃子 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-054',
    '紫苏桃子',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '紫苏桃子' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 55. 铁棍山药面 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-055',
    '铁棍山药面',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '铁棍山药面' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 56. 黔南布依带皮牛肉 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-056',
    '黔南布依带皮牛肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黔南布依带皮牛肉' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 57. 净海老鱼花胶 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-057',
    '净海老鱼花胶',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '净海老鱼花胶' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 58. 豌豆尖 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-058',
    '豌豆尖',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豌豆尖' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 59. 薄荷 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-059',
    '薄荷',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '薄荷' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 60. 贵阳非遗脆三丁 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-060',
    '贵阳非遗脆三丁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '贵阳非遗脆三丁' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 61. 花生芽 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-061',
    '花生芽',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '花生芽' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 62. 安格斯雪花牛 (原材料:2种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-062',
    '安格斯雪花牛',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '安格斯雪花牛' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 63. 龙须菜 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-063',
    '龙须菜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '龙须菜' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 64. 茼蒿 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-064',
    '茼蒿',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '茼蒿' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 65. 人参苗 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-065',
    '人参苗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '人参苗' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 66. 野篮子蔬菜组合 (原材料:6种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-066',
    '野篮子蔬菜组合',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 6种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '野篮子蔬菜组合' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 67. 息烽阳朗辣子鸡 (原材料:12种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-067',
    '息烽阳朗辣子鸡',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 12种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '息烽阳朗辣子鸡' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 68. 灯捕鲈鱼 (原材料:3种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-068',
    '灯捕鲈鱼',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '灯捕鲈鱼' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 69. 扎佐薄荷五花丁 (原材料:17种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-069',
    '扎佐薄荷五花丁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 17种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '扎佐薄荷五花丁' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 70. 黄辣丁 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-070',
    '黄辣丁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄辣丁' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 71. 紫白菜 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-071',
    '紫白菜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '紫白菜' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 72. 黄苦菊 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-072',
    '黄苦菊',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '黄苦菊' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 73. 豆米汤饭 (原材料:9种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-073',
    '豆米汤饭',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 9种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '豆米汤饭' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 74. 定西土豆粉 (原材料:1种, 来源:肉类、海鲜（涮菜）)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-074',
    '定西土豆粉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 肉类、海鲜（涮菜） | 原材料种类: 1种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '定西土豆粉' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 75. 山茶花茶汤(半成品) (原材料:4种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-075',
    '山茶花茶汤(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 4种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '山茶花茶汤(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 76. 野刺梨山茶 (原材料:5种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-076',
    '野刺梨山茶',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 5种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '野刺梨山茶' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 77. 五指毛桃茶汤(半成品) (原材料:3种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-077',
    '五指毛桃茶汤(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 3种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五指毛桃茶汤(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 78. 五指毛桃山茶 (原材料:5种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-078',
    '五指毛桃山茶',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 5种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '五指毛桃山茶' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 79. 鸭屎香乌龙茶汤(半成品) (原材料:2种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-079',
    '鸭屎香乌龙茶汤(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '鸭屎香乌龙茶汤(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 80. 柠檬山茶 (原材料:5种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-080',
    '柠檬山茶',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 5种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '柠檬山茶' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 81. 雪域藏茶茶汤(半成品) (原材料:2种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-081',
    '雪域藏茶茶汤(半成品)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 2种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '雪域藏茶茶汤(半成品)' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 82. 柠檬藏茶 (原材料:5种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-082',
    '柠檬藏茶',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 5种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '柠檬藏茶' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 83. 四果汤 (原材料:7种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-083',
    '四果汤',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 7种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '四果汤' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 84. 千层酥小米渣 (原材料:5种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-084',
    '千层酥小米渣',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 5种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '千层酥小米渣' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 85. 桂花蜜薯 (原材料:4种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-085',
    '桂花蜜薯',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 4种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '桂花蜜薯' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 86. 米酿龙眼桂花冰 (原材料:8种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-086',
    '米酿龙眼桂花冰',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 8种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '米酿龙眼桂花冰' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();

-- 87. 柿子半熟生酪 (原材料:7种, 来源:糖水铺)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    cost_calculation_method, description, is_active
)
SELECT
    'FP-CC-087',
    '柿子半熟生酪',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'standard',
    '来源: 糖水铺 | 原材料种类: 7种',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM product WHERE product_name = '柿子半熟生酪' AND product_type = 'finished'
)
ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    description = EXCLUDED.description,
    updated_at = NOW();


-- ============================================================================
-- 4. 配方主表
-- ============================================================================


-- 配方: 云山雪花吊龙
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-001-v1',
    p.product_id,
    'v1.0',
    '云山雪花吊龙 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '云山雪花吊龙'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 木姜子鲜黄牛肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-002-v1',
    p.product_id,
    'v1.0',
    '木姜子鲜黄牛肉 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '木姜子鲜黄牛肉'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 糊辣椒鲜黄牛匙仁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-003-v1',
    p.product_id,
    'v1.0',
    '糊辣椒鲜黄牛匙仁 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '糊辣椒鲜黄牛匙仁'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 野蒜酥五花趾
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-004-v1',
    p.product_id,
    'v1.0',
    '野蒜酥五花趾 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '野蒜酥五花趾'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 紫苏半边云
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-005-v1',
    p.product_id,
    'v1.0',
    '紫苏半边云 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '紫苏半边云'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 大地飞雪(M9纯血和牛)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-006-v1',
    p.product_id,
    'v1.0',
    '大地飞雪(M9纯血和牛) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '大地飞雪(M9纯血和牛)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 黑松露和牛肉开口笑
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-007-v1',
    p.product_id,
    'v1.0',
    '黑松露和牛肉开口笑 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '黑松露和牛肉开口笑'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 黑松露和牛肉开口笑
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-008-v1',
    p.product_id,
    'v1.0',
    '黑松露和牛肉开口笑 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '黑松露和牛肉开口笑'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 贵州传统软哨
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-009-v1',
    p.product_id,
    'v1.0',
    '贵州传统软哨 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '贵州传统软哨'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 水晶滑肉混合物(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-010-v1',
    p.product_id,
    'v1.0',
    '水晶滑肉混合物(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '水晶滑肉混合物(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 手工水晶滑肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-011-v1',
    p.product_id,
    'v1.0',
    '手工水晶滑肉 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '手工水晶滑肉'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 过油响皮
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-012-v1',
    p.product_id,
    'v1.0',
    '过油响皮 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '过油响皮'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 糯米午餐肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-013-v1',
    p.product_id,
    'v1.0',
    '糯米午餐肉 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '糯米午餐肉'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 净水鲜虾
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-014-v1',
    p.product_id,
    'v1.0',
    '净水鲜虾 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '净水鲜虾'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 乌鱼片
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-015-v1',
    p.product_id,
    'v1.0',
    '乌鱼片 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '乌鱼片'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 海鲜拼盘
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-016-v1',
    p.product_id,
    'v1.0',
    '海鲜拼盘 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '海鲜拼盘'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 黑金虾滑
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-017-v1',
    p.product_id,
    'v1.0',
    '黑金虾滑 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '黑金虾滑'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 鲜板栗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-018-v1',
    p.product_id,
    'v1.0',
    '鲜板栗 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '鲜板栗'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 鲜百合
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-019-v1',
    p.product_id,
    'v1.0',
    '鲜百合 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '鲜百合'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 血皮菜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-020-v1',
    p.product_id,
    'v1.0',
    '血皮菜 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '血皮菜'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 鲜黄花
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-021-v1',
    p.product_id,
    'v1.0',
    '鲜黄花 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '鲜黄花'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 山药
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-022-v1',
    p.product_id,
    'v1.0',
    '山药 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '山药'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 甜笋(刺身级)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-023-v1',
    p.product_id,
    'v1.0',
    '甜笋(刺身级) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '甜笋(刺身级)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 三脆碗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-024-v1',
    p.product_id,
    'v1.0',
    '三脆碗 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '三脆碗'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 姜柄瓜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-025-v1',
    p.product_id,
    'v1.0',
    '姜柄瓜 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '姜柄瓜'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 双花碗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-026-v1',
    p.product_id,
    'v1.0',
    '双花碗 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '双花碗'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 彩云土豆
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-027-v1',
    p.product_id,
    'v1.0',
    '彩云土豆 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '彩云土豆'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 藕
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-028-v1',
    p.product_id,
    'v1.0',
    '藕 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '藕'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 石磨黑豆腐
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-029-v1',
    p.product_id,
    'v1.0',
    '石磨黑豆腐 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '石磨黑豆腐'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 野篮子菌菇组合
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-030-v1',
    p.product_id,
    'v1.0',
    '野篮子菌菇组合 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '野篮子菌菇组合'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 香茅酱(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-031-v1',
    p.product_id,
    'v1.0',
    '香茅酱(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '香茅酱(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 火烧云铜锅油焖鸡
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-032-v1',
    p.product_id,
    'v1.0',
    '火烧云铜锅油焖鸡 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '火烧云铜锅油焖鸡'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 息烽虎皮猪蹄
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-033-v1',
    p.product_id,
    'v1.0',
    '息烽虎皮猪蹄 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '息烽虎皮猪蹄'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 干巴菌酱(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-034-v1',
    p.product_id,
    'v1.0',
    '干巴菌酱(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '干巴菌酱(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 干巴菌炒饭
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-035-v1',
    p.product_id,
    'v1.0',
    '干巴菌炒饭 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '干巴菌炒饭'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 糟辣椒炒饭
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-036-v1',
    p.product_id,
    'v1.0',
    '糟辣椒炒饭 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '糟辣椒炒饭'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 野佐料擂椒皮蛋
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-037-v1',
    p.product_id,
    'v1.0',
    '野佐料擂椒皮蛋 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '野佐料擂椒皮蛋'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 木姜子鸡爪
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-038-v1',
    p.product_id,
    'v1.0',
    '木姜子鸡爪 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '木姜子鸡爪'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 青柠檬汁(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-039-v1',
    p.product_id,
    'v1.0',
    '青柠檬汁(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '青柠檬汁(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 酸辣酱(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-040-v1',
    p.product_id,
    'v1.0',
    '酸辣酱(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '酸辣酱(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 混合香草(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-041-v1',
    p.product_id,
    'v1.0',
    '混合香草(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '混合香草(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 傣村手撕罗非鱼
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-042-v1',
    p.product_id,
    'v1.0',
    '傣村手撕罗非鱼 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '傣村手撕罗非鱼'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 贵州非遗丝娃娃
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-043-v1',
    p.product_id,
    'v1.0',
    '贵州非遗丝娃娃 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '贵州非遗丝娃娃'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 老凯里非遗酸汤
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-044-v1',
    p.product_id,
    'v1.0',
    '老凯里非遗酸汤 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '老凯里非遗酸汤'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 豆腐丸子蘸酱(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-045-v1',
    p.product_id,
    'v1.0',
    '豆腐丸子蘸酱(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '豆腐丸子蘸酱(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 苗侗空气丸子
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-046-v1',
    p.product_id,
    'v1.0',
    '苗侗空气丸子 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '苗侗空气丸子'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 玉米糊(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-047-v1',
    p.product_id,
    'v1.0',
    '玉米糊(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '玉米糊(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 雪顶冰淇淋玉米粑
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-048-v1',
    p.product_id,
    'v1.0',
    '雪顶冰淇淋玉米粑 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '雪顶冰淇淋玉米粑'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 野菜卷
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-049-v1',
    p.product_id,
    'v1.0',
    '野菜卷 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '野菜卷'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 山玫瑰炸乳扇
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-050-v1',
    p.product_id,
    'v1.0',
    '山玫瑰炸乳扇 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '山玫瑰炸乳扇'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 怪噜洋芋酱(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-051-v1',
    p.product_id,
    'v1.0',
    '怪噜洋芋酱(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '怪噜洋芋酱(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 怪噜洋芋
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-052-v1',
    p.product_id,
    'v1.0',
    '怪噜洋芋 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '怪噜洋芋'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 紫苏汤(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-053-v1',
    p.product_id,
    'v1.0',
    '紫苏汤(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '紫苏汤(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 紫苏桃子
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-054-v1',
    p.product_id,
    'v1.0',
    '紫苏桃子 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '紫苏桃子'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 铁棍山药面
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-055-v1',
    p.product_id,
    'v1.0',
    '铁棍山药面 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '铁棍山药面'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 黔南布依带皮牛肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-056-v1',
    p.product_id,
    'v1.0',
    '黔南布依带皮牛肉 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '黔南布依带皮牛肉'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 净海老鱼花胶
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-057-v1',
    p.product_id,
    'v1.0',
    '净海老鱼花胶 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '净海老鱼花胶'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 豌豆尖
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-058-v1',
    p.product_id,
    'v1.0',
    '豌豆尖 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '豌豆尖'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 薄荷
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-059-v1',
    p.product_id,
    'v1.0',
    '薄荷 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '薄荷'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 贵阳非遗脆三丁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-060-v1',
    p.product_id,
    'v1.0',
    '贵阳非遗脆三丁 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '贵阳非遗脆三丁'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 花生芽
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-061-v1',
    p.product_id,
    'v1.0',
    '花生芽 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '花生芽'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 安格斯雪花牛
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-062-v1',
    p.product_id,
    'v1.0',
    '安格斯雪花牛 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '安格斯雪花牛'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 龙须菜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-063-v1',
    p.product_id,
    'v1.0',
    '龙须菜 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '龙须菜'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 茼蒿
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-064-v1',
    p.product_id,
    'v1.0',
    '茼蒿 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '茼蒿'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 人参苗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-065-v1',
    p.product_id,
    'v1.0',
    '人参苗 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '人参苗'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 野篮子蔬菜组合
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-066-v1',
    p.product_id,
    'v1.0',
    '野篮子蔬菜组合 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '野篮子蔬菜组合'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 息烽阳朗辣子鸡
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-067-v1',
    p.product_id,
    'v1.0',
    '息烽阳朗辣子鸡 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '息烽阳朗辣子鸡'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 灯捕鲈鱼
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-068-v1',
    p.product_id,
    'v1.0',
    '灯捕鲈鱼 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '灯捕鲈鱼'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 扎佐薄荷五花丁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-069-v1',
    p.product_id,
    'v1.0',
    '扎佐薄荷五花丁 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '扎佐薄荷五花丁'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 黄辣丁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-070-v1',
    p.product_id,
    'v1.0',
    '黄辣丁 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '黄辣丁'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 紫白菜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-071-v1',
    p.product_id,
    'v1.0',
    '紫白菜 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '紫白菜'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 黄苦菊
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-072-v1',
    p.product_id,
    'v1.0',
    '黄苦菊 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '黄苦菊'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 豆米汤饭
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-073-v1',
    p.product_id,
    'v1.0',
    '豆米汤饭 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '豆米汤饭'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 定西土豆粉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-074-v1',
    p.product_id,
    'v1.0',
    '定西土豆粉 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '定西土豆粉'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 山茶花茶汤(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-075-v1',
    p.product_id,
    'v1.0',
    '山茶花茶汤(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '山茶花茶汤(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 野刺梨山茶
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-076-v1',
    p.product_id,
    'v1.0',
    '野刺梨山茶 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '野刺梨山茶'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 五指毛桃茶汤(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-077-v1',
    p.product_id,
    'v1.0',
    '五指毛桃茶汤(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '五指毛桃茶汤(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 五指毛桃山茶
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-078-v1',
    p.product_id,
    'v1.0',
    '五指毛桃山茶 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '五指毛桃山茶'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 鸭屎香乌龙茶汤(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-079-v1',
    p.product_id,
    'v1.0',
    '鸭屎香乌龙茶汤(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '鸭屎香乌龙茶汤(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 柠檬山茶
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-080-v1',
    p.product_id,
    'v1.0',
    '柠檬山茶 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '柠檬山茶'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 雪域藏茶茶汤(半成品)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-081-v1',
    p.product_id,
    'v1.0',
    '雪域藏茶茶汤(半成品) 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '雪域藏茶茶汤(半成品)'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 柠檬藏茶
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-082-v1',
    p.product_id,
    'v1.0',
    '柠檬藏茶 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '柠檬藏茶'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 四果汤
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-083-v1',
    p.product_id,
    'v1.0',
    '四果汤 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '四果汤'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 千层酥小米渣
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-084-v1',
    p.product_id,
    'v1.0',
    '千层酥小米渣 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '千层酥小米渣'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 桂花蜜薯
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-085-v1',
    p.product_id,
    'v1.0',
    '桂花蜜薯 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '桂花蜜薯'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 米酿龙眼桂花冰
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-086-v1',
    p.product_id,
    'v1.0',
    '米酿龙眼桂花冰 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '米酿龙眼桂花冰'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();

-- 配方: 柿子半熟生酪
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current, yield_quantity, yield_unit_id, status
)
SELECT
    'RCP-CC-087-v1',
    p.product_id,
    'v1.0',
    '柿子半熟生酪 标准配方(成本卡)',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    'approved'
FROM product p
WHERE p.product_name = '柿子半熟生酪'
  AND p.product_type = 'finished'
ON CONFLICT (recipe_code) DO UPDATE SET
    recipe_name = EXCLUDED.recipe_name,
    updated_at = NOW();


-- ============================================================================
-- 5. 配方明细 (recipe_item)
-- ============================================================================


-- 配方明细: 云山雪花吊龙
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-001-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-001-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 吊龙 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '吊龙'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 吊龙';
    END IF;


    -- 原材料 2: 法香 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '法香'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 法香';
    END IF;


    -- 原材料 3: 干冰 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干冰'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干冰';
    END IF;


END $$;


-- 配方明细: 木姜子鲜黄牛肉
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-002-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-002-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 吊龙 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '吊龙'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 吊龙';
    END IF;


    -- 原材料 2: 木姜子 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 木姜子';
    END IF;


END $$;


-- 配方明细: 糊辣椒鲜黄牛匙仁
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-003-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-003-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 匙仁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '匙仁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 匙仁';
    END IF;


    -- 原材料 2: 糊辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 3: 干香茅草 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干香茅草'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干香茅草';
    END IF;


END $$;


-- 配方明细: 野蒜酥五花趾
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-004-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-004-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 五花腱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五花腱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五花腱';
    END IF;


    -- 原材料 2: 金蒜酥 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金蒜酥'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 金蒜酥';
    END IF;


END $$;


-- 配方明细: 紫苏半边云
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-005-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-005-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 胸口油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '胸口油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 胸口油';
    END IF;


    -- 原材料 2: 紫苏叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏叶';
    END IF;


    -- 原材料 3: 紫苏碎 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏碎';
    END IF;


END $$;


-- 配方明细: 大地飞雪(M9纯血和牛)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-006-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-006-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: M9和牛 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = 'M9和牛'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: M9和牛';
    END IF;


END $$;


-- 配方明细: 黑松露和牛肉开口笑
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-007-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-007-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 和牛肉糜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '和牛肉糜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 和牛肉糜';
    END IF;


    -- 原材料 2: 黑松露酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑松露酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黑松露酱';
    END IF;


    -- 原材料 3: 饺子皮 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '饺子皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 饺子皮';
    END IF;


END $$;


-- 配方明细: 黑松露和牛肉开口笑
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-008-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-008-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 匙仁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '匙仁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 匙仁';
    END IF;


    -- 原材料 2: 胸口油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '胸口油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 胸口油';
    END IF;


    -- 原材料 3: 五花腱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五花腱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五花腱';
    END IF;


    -- 原材料 4: M9和牛 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = 'M9和牛'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: M9和牛';
    END IF;


    -- 原材料 5: 黑松露酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑松露酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黑松露酱';
    END IF;


    -- 原材料 6: 饺子皮 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '饺子皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 饺子皮';
    END IF;


END $$;


-- 配方明细: 贵州传统软哨
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-009-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-009-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 软哨片 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '软哨片'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 软哨片';
    END IF;


    -- 原材料 2: 芭蕉叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芭蕉叶';
    END IF;


END $$;


-- 配方明细: 水晶滑肉混合物(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-010-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-010-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 雪花松板肉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雪花松板肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 雪花松板肉';
    END IF;


    -- 原材料 2: 红薯淀粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红薯淀粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红薯淀粉';
    END IF;


END $$;


-- 配方明细: 手工水晶滑肉
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-011-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-011-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 水晶滑肉混合物 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水晶滑肉混合物'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水晶滑肉混合物';
    END IF;


    -- 原材料 2: 红叶生菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红叶生菜';
    END IF;


END $$;


-- 配方明细: 过油响皮
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-012-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-012-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 猪响皮 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪响皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 猪响皮';
    END IF;


END $$;


-- 配方明细: 糯米午餐肉
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-013-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-013-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 糯米午餐肉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糯米午餐肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糯米午餐肉';
    END IF;


END $$;


-- 配方明细: 净水鲜虾
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-014-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-014-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 基围虾 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '基围虾'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 基围虾';
    END IF;


END $$;


-- 配方明细: 乌鱼片
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-015-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-015-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 乌鱼片 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '乌鱼片'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 乌鱼片';
    END IF;


    -- 原材料 2: 甜菊 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜菊'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 甜菊';
    END IF;


END $$;


-- 配方明细: 海鲜拼盘
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-016-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-016-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 小管 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小管'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小管';
    END IF;


    -- 原材料 2: 10头鲍 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '10头鲍'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 10头鲍';
    END IF;


    -- 原材料 3: 生蚝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生蚝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生蚝';
    END IF;


    -- 原材料 4: 基围虾 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '基围虾'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 基围虾';
    END IF;


    -- 原材料 5: 紫苏叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏叶';
    END IF;


END $$;


-- 配方明细: 黑金虾滑
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-017-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-017-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 虾滑 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '虾滑'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 虾滑';
    END IF;


    -- 原材料 2: 墨鱼汁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '墨鱼汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 墨鱼汁';
    END IF;


    -- 原材料 3: 金蒜酥 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金蒜酥'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 金蒜酥';
    END IF;


    -- 原材料 4: 芭蕉叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芭蕉叶';
    END IF;


END $$;


-- 配方明细: 鲜板栗
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-018-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-018-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲜板栗 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜板栗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜板栗';
    END IF;


    -- 原材料 2: 羽衣甘蓝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 羽衣甘蓝';
    END IF;


END $$;


-- 配方明细: 鲜百合
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-019-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-019-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲜百合 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜百合'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜百合';
    END IF;


END $$;


-- 配方明细: 血皮菜
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-020-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-020-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 血皮菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '血皮菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 血皮菜';
    END IF;


END $$;


-- 配方明细: 鲜黄花
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-021-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-021-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲜黄花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜黄花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜黄花';
    END IF;


    -- 原材料 2: 红叶生菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红叶生菜';
    END IF;


END $$;


-- 配方明细: 山药
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-022-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-022-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 粗山药 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '粗山药'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 粗山药';
    END IF;


    -- 原材料 2: 甜菊 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜菊'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 甜菊';
    END IF;


END $$;


-- 配方明细: 甜笋(刺身级)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-023-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-023-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 甜笋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜笋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 甜笋';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


END $$;


-- 配方明细: 三脆碗
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-024-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-024-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 干黄花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干黄花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干黄花';
    END IF;


    -- 原材料 2: 干花菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干花菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干花菜';
    END IF;


    -- 原材料 3: 干贡菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干贡菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干贡菜';
    END IF;


END $$;


-- 配方明细: 姜柄瓜
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-025-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-025-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 姜柄瓜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜柄瓜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜柄瓜';
    END IF;


    -- 原材料 2: 羽衣甘蓝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 羽衣甘蓝';
    END IF;


END $$;


-- 配方明细: 双花碗
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-026-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-026-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 花生芽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花生芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花生芽';
    END IF;


    -- 原材料 2: 黄瓜花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄瓜花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄瓜花';
    END IF;


END $$;


-- 配方明细: 彩云土豆
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-027-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-027-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 七彩土豆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '七彩土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 七彩土豆';
    END IF;


END $$;


-- 配方明细: 藕
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-028-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-028-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 藕 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藕'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 藕';
    END IF;


    -- 原材料 2: 红叶生菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红叶生菜';
    END IF;


    -- 原材料 3: 羽衣甘蓝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 羽衣甘蓝';
    END IF;


END $$;


-- 配方明细: 石磨黑豆腐
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-029-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-029-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 黑豆腐 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑豆腐'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黑豆腐';
    END IF;


    -- 原材料 2: 红叶生菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红叶生菜';
    END IF;


END $$;


-- 配方明细: 野篮子菌菇组合
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-030-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-030-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 牛肝菌 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '牛肝菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 牛肝菌';
    END IF;


    -- 原材料 2: 球盖菇 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '球盖菇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 球盖菇';
    END IF;


    -- 原材料 3: 鹿茸菇 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鹿茸菇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鹿茸菇';
    END IF;


    -- 原材料 4: 金耳菌 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金耳菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 金耳菌';
    END IF;


    -- 原材料 5: 绣球菌 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '绣球菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 绣球菌';
    END IF;


    -- 原材料 6: 莲白 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '莲白'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 莲白';
    END IF;


    -- 原材料 7: 羽衣甘蓝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 羽衣甘蓝';
    END IF;


END $$;


-- 配方明细: 香茅酱(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-031-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-031-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 小米辣 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小米辣';
    END IF;


    -- 原材料 2: 香茅 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香茅'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香茅';
    END IF;


    -- 原材料 3: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 4: 盐 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 盐';
    END IF;


    -- 原材料 5: 鸡精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 6: 味精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 7: 生抽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 8: 蚝油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


    -- 原材料 9: 草果粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '草果粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 草果粉';
    END IF;


    -- 原材料 10: 五香粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五香粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五香粉';
    END IF;


END $$;


-- 配方明细: 火烧云铜锅油焖鸡
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-032-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-032-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 红油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红油';
    END IF;


    -- 原材料 2: 番茄 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 3: 香茅酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香茅酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香茅酱';
    END IF;


    -- 原材料 4: 土豆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 土豆';
    END IF;


    -- 原材料 5: 去骨鸡腿肉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '去骨鸡腿肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 去骨鸡腿肉';
    END IF;


    -- 原材料 6: 百香果原汁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '百香果原汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 百香果原汁';
    END IF;


    -- 原材料 7: 大香菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大香菜';
    END IF;


    -- 原材料 8: 大葱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大葱';
    END IF;


END $$;


-- 配方明细: 息烽虎皮猪蹄
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-033-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-033-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 猪蹄 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪蹄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 猪蹄';
    END IF;


    -- 原材料 2: 郫县豆瓣 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '郫县豆瓣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 郫县豆瓣';
    END IF;


    -- 原材料 3: 糍粑辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糍粑辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糍粑辣椒';
    END IF;


    -- 原材料 4: 姜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 5: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 6: 蒜苗 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜苗';
    END IF;


    -- 原材料 7: 菜籽油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菜籽油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 菜籽油';
    END IF;


    -- 原材料 8: 啤酒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '啤酒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 啤酒';
    END IF;


    -- 原材料 9: 五香粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五香粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五香粉';
    END IF;


END $$;


-- 配方明细: 干巴菌酱(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-034-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-034-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鸡油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡油';
    END IF;


    -- 原材料 2: 干巴菌 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干巴菌';
    END IF;


    -- 原材料 3: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 4: 洋葱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '洋葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 洋葱';
    END IF;


END $$;


-- 配方明细: 干巴菌炒饭
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-035-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-035-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 干巴菌酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干巴菌酱';
    END IF;


    -- 原材料 2: 牛肉碎 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '牛肉碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 牛肉碎';
    END IF;


    -- 原材料 3: 口蘑 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '口蘑'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 口蘑';
    END IF;


    -- 原材料 4: 干巴菌 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干巴菌';
    END IF;


    -- 原材料 5: 宣威火腿 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '宣威火腿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 宣威火腿';
    END IF;


    -- 原材料 6: 螺丝椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '螺丝椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 螺丝椒';
    END IF;


    -- 原材料 7: 黄天鹅无菌蛋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄天鹅无菌蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄天鹅无菌蛋';
    END IF;


    -- 原材料 8: 大米 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大米'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大米';
    END IF;


END $$;


-- 配方明细: 糟辣椒炒饭
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-036-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-036-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鸡蛋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡蛋';
    END IF;


    -- 原材料 2: 糟辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糟辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糟辣椒';
    END IF;


    -- 原材料 3: 脆哨 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 4: 大米 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大米'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大米';
    END IF;


END $$;


-- 配方明细: 野佐料擂椒皮蛋
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-037-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-037-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 茄子 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茄子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茄子';
    END IF;


    -- 原材料 2: 盐 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 盐';
    END IF;


    -- 原材料 3: 鸡精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 4: 味精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 5: 白糖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 6: 贵州五香辣椒面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 7: 糊辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 8: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 9: 生抽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 10: 蚝油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


    -- 原材料 11: 藤椒油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藤椒油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 藤椒油';
    END IF;


    -- 原材料 12: 黄心皮蛋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄心皮蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄心皮蛋';
    END IF;


    -- 原材料 13: 螺丝椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '螺丝椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 螺丝椒';
    END IF;


    -- 原材料 14: 番茄 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 15: 香菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            15,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香菜';
    END IF;


    -- 原材料 16: 小米辣 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            16,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小米辣';
    END IF;


    -- 原材料 17: 折耳根 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            17,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 18: 脆哨 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            18,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


END $$;


-- 配方明细: 木姜子鸡爪
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-038-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-038-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鸡爪 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡爪'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡爪';
    END IF;


    -- 原材料 2: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 3: 黄柠檬 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄柠檬';
    END IF;


    -- 原材料 4: 东古酱油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '东古酱油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 东古酱油';
    END IF;


    -- 原材料 5: 陈醋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '陈醋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 陈醋';
    END IF;


    -- 原材料 6: 蚝油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


    -- 原材料 7: 白糖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 8: 红油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红油';
    END IF;


    -- 原材料 9: 泡野山椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡野山椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡野山椒';
    END IF;


    -- 原材料 10: 木姜子油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 木姜子油';
    END IF;


    -- 原材料 11: 藤椒油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藤椒油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 藤椒油';
    END IF;


    -- 原材料 12: 鲜花椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜花椒';
    END IF;


    -- 原材料 13: 青柠檬汁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '青柠檬汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 青柠檬汁';
    END IF;


END $$;


-- 配方明细: 青柠檬汁(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-039-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-039-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 家乐柠檬粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '家乐柠檬粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 家乐柠檬粉';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


END $$;


-- 配方明细: 酸辣酱(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-040-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-040-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 2: 小米辣 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小米辣';
    END IF;


    -- 原材料 3: 香菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香菜';
    END IF;


    -- 原材料 4: 鱼露 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鱼露'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鱼露';
    END IF;


    -- 原材料 5: 青柠檬汁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '青柠檬汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 青柠檬汁';
    END IF;


    -- 原材料 6: 白糖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 7: 味精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 8: 蚝油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


END $$;


-- 配方明细: 混合香草(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-041-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-041-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 大香菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大香菜';
    END IF;


    -- 原材料 2: 香菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香菜';
    END IF;


    -- 原材料 3: 茴香苗 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茴香苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茴香苗';
    END IF;


END $$;


-- 配方明细: 傣村手撕罗非鱼
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-042-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-042-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 新一代辣椒面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新一代辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 新一代辣椒面';
    END IF;


    -- 原材料 2: 黄柠檬 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄柠檬';
    END IF;


    -- 原材料 3: 芭蕉叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芭蕉叶';
    END IF;


    -- 原材料 4: 酸辣酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '酸辣酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 酸辣酱';
    END IF;


    -- 原材料 5: 混合香草 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '混合香草'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 混合香草';
    END IF;


    -- 原材料 6: 罗非鱼 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '罗非鱼'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 罗非鱼';
    END IF;


END $$;


-- 配方明细: 贵州非遗丝娃娃
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-043-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-043-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 青笋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '青笋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 青笋';
    END IF;


    -- 原材料 2: 绿豆芽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '绿豆芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 绿豆芽';
    END IF;


    -- 原材料 3: 海带丝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '海带丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 海带丝';
    END IF;


    -- 原材料 4: 泡萝卜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡萝卜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡萝卜';
    END IF;


    -- 原材料 5: 黄瓜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄瓜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄瓜';
    END IF;


    -- 原材料 6: 折耳根 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 7: 土豆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 土豆';
    END IF;


    -- 原材料 8: 脆哨 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 9: 凉面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '凉面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 凉面';
    END IF;


    -- 原材料 10: 春卷皮 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '春卷皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 春卷皮';
    END IF;


    -- 原材料 11: 芥末 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芥末'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芥末';
    END IF;


    -- 原材料 12: 糊辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 13: 贵州五香辣椒面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 14: 老凯里非遗酸汤 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '老凯里非遗酸汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 老凯里非遗酸汤';
    END IF;


    -- 原材料 15: 小葱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            15,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小葱';
    END IF;


END $$;


-- 配方明细: 老凯里非遗酸汤
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-044-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-044-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 酸汤底料 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '酸汤底料'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 酸汤底料';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


    -- 原材料 3: 鸡精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 4: 味精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 5: 猪油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 猪油';
    END IF;


    -- 原材料 6: 鲜花椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜花椒';
    END IF;


    -- 原材料 7: 木姜子 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 木姜子';
    END IF;


    -- 原材料 8: 番茄 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 9: 黄豆芽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄豆芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄豆芽';
    END IF;


    -- 原材料 10: 蒜苗 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜苗';
    END IF;


    -- 原材料 11: 小葱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小葱';
    END IF;


    -- 原材料 12: 姜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


END $$;


-- 配方明细: 豆腐丸子蘸酱(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-045-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-045-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 折耳根 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 2: 小葱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小葱';
    END IF;


    -- 原材料 3: 香菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香菜';
    END IF;


    -- 原材料 4: 泡萝卜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡萝卜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡萝卜';
    END IF;


    -- 原材料 5: 大香菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大香菜';
    END IF;


    -- 原材料 6: 糊辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 7: 贵州五香辣椒面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 8: 花椒粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花椒粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花椒粉';
    END IF;


    -- 原材料 9: 生抽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 10: 鸡精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 11: 味精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


END $$;


-- 配方明细: 苗侗空气丸子
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-046-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-046-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 豆腐丸子蘸酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豆腐丸子蘸酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 豆腐丸子蘸酱';
    END IF;


    -- 原材料 2: 脆哨 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 3: 帕玛森干酪 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '帕玛森干酪'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 帕玛森干酪';
    END IF;


    -- 原材料 4: 豆腐圆子 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豆腐圆子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 豆腐圆子';
    END IF;


END $$;


-- 配方明细: 玉米糊(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-047-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-047-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 甜玉米 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜玉米'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 甜玉米';
    END IF;


    -- 原材料 2: 盐 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 盐';
    END IF;


    -- 原材料 3: 生粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生粉';
    END IF;


    -- 原材料 4: 小麦自发粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小麦自发粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小麦自发粉';
    END IF;


    -- 原材料 5: 鸡蛋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡蛋';
    END IF;


    -- 原材料 6: 白糖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


END $$;


-- 配方明细: 雪顶冰淇淋玉米粑
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-048-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-048-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 甜玉糊 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜玉糊'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 甜玉糊';
    END IF;


    -- 原材料 2: 帕玛森干酪 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '帕玛森干酪'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 帕玛森干酪';
    END IF;


    -- 原材料 3: 香草冰淇淋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香草冰淇淋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香草冰淇淋';
    END IF;


    -- 原材料 4: 碧根果碎 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '碧根果碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 碧根果碎';
    END IF;


END $$;


-- 配方明细: 野菜卷
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-049-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-049-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 野菜卷（成品） (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '野菜卷（成品）'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 野菜卷（成品）';
    END IF;


END $$;


-- 配方明细: 山玫瑰炸乳扇
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-050-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-050-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 玫瑰乳扇 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '玫瑰乳扇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 玫瑰乳扇';
    END IF;


    -- 原材料 2: 玫瑰酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '玫瑰酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 玫瑰酱';
    END IF;


    -- 原材料 3: 干玫瑰花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干玫瑰花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干玫瑰花';
    END IF;


END $$;


-- 配方明细: 怪噜洋芋酱(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-051-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-051-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 蒜蓉辣椒酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜蓉辣椒酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜蓉辣椒酱';
    END IF;


    -- 原材料 2: 番茄 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 3: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 4: 姜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 5: 黄灯笼辣椒酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄灯笼辣椒酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄灯笼辣椒酱';
    END IF;


    -- 原材料 6: 色拉油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '色拉油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 色拉油';
    END IF;


    -- 原材料 7: 猪肉沫 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪肉沫'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 猪肉沫';
    END IF;


END $$;


-- 配方明细: 怪噜洋芋
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-052-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-052-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 土豆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 土豆';
    END IF;


    -- 原材料 2: 贵州五香辣椒面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 3: 折耳根 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 4: 泡萝卜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡萝卜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡萝卜';
    END IF;


    -- 原材料 5: 怪噜洋芋酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '怪噜洋芋酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 怪噜洋芋酱';
    END IF;


    -- 原材料 6: 油炸折耳根 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '油炸折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 油炸折耳根';
    END IF;


END $$;


-- 配方明细: 紫苏汤(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-053-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-053-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 紫苏叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏叶';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


    -- 原材料 3: 白糖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 4: 苹果醋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '苹果醋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 苹果醋';
    END IF;


    -- 原材料 5: 仔姜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '仔姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 仔姜';
    END IF;


    -- 原材料 6: 紫苏叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏叶';
    END IF;


END $$;


-- 配方明细: 紫苏桃子
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-054-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-054-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 水蜜桃 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水蜜桃'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水蜜桃';
    END IF;


    -- 原材料 2: 荔枝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '荔枝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 荔枝';
    END IF;


    -- 原材料 3: 紫苏汤 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏汤';
    END IF;


END $$;


-- 配方明细: 铁棍山药面
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-055-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-055-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 铁棍山药面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '铁棍山药面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 铁棍山药面';
    END IF;


END $$;


-- 配方明细: 黔南布依带皮牛肉
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-056-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-056-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 带皮牛肉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '带皮牛肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 带皮牛肉';
    END IF;


    -- 原材料 2: 粽叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '粽叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 粽叶';
    END IF;


END $$;


-- 配方明细: 净海老鱼花胶
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-057-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-057-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 花胶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花胶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花胶';
    END IF;


    -- 原材料 2: 红枫叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红枫叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红枫叶';
    END IF;


END $$;


-- 配方明细: 豌豆尖
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-058-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-058-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 豌豆尖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豌豆尖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 豌豆尖';
    END IF;


END $$;


-- 配方明细: 薄荷
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-059-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-059-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 薄荷 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薄荷'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 薄荷';
    END IF;


END $$;


-- 配方明细: 贵阳非遗脆三丁
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-060-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-060-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 脆三丁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆三丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆三丁';
    END IF;


END $$;


-- 配方明细: 花生芽
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-061-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-061-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 花生芽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花生芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花生芽';
    END IF;


END $$;


-- 配方明细: 安格斯雪花牛
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-062-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-062-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 美肥 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '美肥'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 美肥';
    END IF;


    -- 原材料 2: 粽叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '粽叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 粽叶';
    END IF;


END $$;


-- 配方明细: 龙须菜
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-063-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-063-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 龙须菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '龙须菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 龙须菜';
    END IF;


END $$;


-- 配方明细: 茼蒿
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-064-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-064-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 茼蒿 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茼蒿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茼蒿';
    END IF;


END $$;


-- 配方明细: 人参苗
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-065-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-065-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 人参苗 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '人参苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 人参苗';
    END IF;


END $$;


-- 配方明细: 野篮子蔬菜组合
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-066-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-066-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 紫白菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫白菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫白菜';
    END IF;


    -- 原材料 2: 龙须菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '龙须菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 龙须菜';
    END IF;


    -- 原材料 3: 茼蒿 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茼蒿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茼蒿';
    END IF;


    -- 原材料 4: 人参苗 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '人参苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 人参苗';
    END IF;


    -- 原材料 5: 薄荷 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薄荷'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 薄荷';
    END IF;


    -- 原材料 6: 血皮菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '血皮菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 血皮菜';
    END IF;


END $$;


-- 配方明细: 息烽阳朗辣子鸡
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-067-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-067-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 三黄鸡 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '三黄鸡'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 三黄鸡';
    END IF;


    -- 原材料 2: 菜籽油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菜籽油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 菜籽油';
    END IF;


    -- 原材料 3: 姜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 4: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 5: 干花椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干花椒';
    END IF;


    -- 原材料 6: 糍粑辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糍粑辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糍粑辣椒';
    END IF;


    -- 原材料 7: 郫县豆瓣 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '郫县豆瓣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 郫县豆瓣';
    END IF;


    -- 原材料 8: 啤酒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '啤酒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 啤酒';
    END IF;


    -- 原材料 9: 生抽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 10: 味精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 11: 鸡精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 12: 白糖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


END $$;


-- 配方明细: 灯捕鲈鱼
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-068-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-068-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲈鱼 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲈鱼'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲈鱼';
    END IF;


    -- 原材料 2: 红枫叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红枫叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红枫叶';
    END IF;


    -- 原材料 3: 小青柠 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小青柠'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小青柠';
    END IF;


END $$;


-- 配方明细: 扎佐薄荷五花丁
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-069-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-069-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 五花肉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五花肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五花肉';
    END IF;


    -- 原材料 2: 味精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 3: 鸡精 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 4: 耗油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '耗油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 耗油';
    END IF;


    -- 原材料 5: 生抽 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 6: 草果粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '草果粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 草果粉';
    END IF;


    -- 原材料 7: 花椒粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花椒粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花椒粉';
    END IF;


    -- 原材料 8: 新一代辣椒面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新一代辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 新一代辣椒面';
    END IF;


    -- 原材料 9: 生粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生粉';
    END IF;


    -- 原材料 10: 薄荷 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薄荷'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 薄荷';
    END IF;


    -- 原材料 11: 脆三丁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆三丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆三丁';
    END IF;


    -- 原材料 12: 新一代辣椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新一代辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 新一代辣椒';
    END IF;


    -- 原材料 13: 毕节皱皮椒 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '毕节皱皮椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 毕节皱皮椒';
    END IF;


    -- 原材料 14: 芝麻 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芝麻'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芝麻';
    END IF;


    -- 原材料 15: 姜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            15,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 16: 大蒜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            16,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 17: 贵州五香辣椒面 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            17,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


END $$;


-- 配方明细: 黄辣丁
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-070-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-070-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 黄辣丁 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄辣丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄辣丁';
    END IF;


END $$;


-- 配方明细: 紫白菜
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-071-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-071-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 紫白菜 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫白菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫白菜';
    END IF;


END $$;


-- 配方明细: 黄苦菊
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-072-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-072-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 黄苦菊 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄苦菊'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄苦菊';
    END IF;


END $$;


-- 配方明细: 豆米汤饭
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-073-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-073-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 豆米底料 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豆米底料'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 豆米底料';
    END IF;


    -- 原材料 2: 米饭 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '米饭'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 米饭';
    END IF;


    -- 原材料 3: 鸡蛋 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡蛋';
    END IF;


    -- 原材料 4: 茼蒿 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茼蒿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茼蒿';
    END IF;


    -- 原材料 5: 球盖菇 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '球盖菇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 球盖菇';
    END IF;


    -- 原材料 6: 脆哨 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 7: 蒜苗 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜苗';
    END IF;


    -- 原材料 8: 番茄 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 9: 烟熏腊肉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '烟熏腊肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 烟熏腊肉';
    END IF;


END $$;


-- 配方明细: 定西土豆粉
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-074-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-074-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 定西土豆粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '定西土豆粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 定西土豆粉';
    END IF;


END $$;


-- 配方明细: 山茶花茶汤(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-075-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-075-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 山茶花乌龙茶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '山茶花乌龙茶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 山茶花乌龙茶';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


    -- 原材料 3: 冰块 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰块'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冰块';
    END IF;


    -- 原材料 4: 冰块 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰块'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冰块';
    END IF;


END $$;


-- 配方明细: 野刺梨山茶
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-076-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-076-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 刺梨原浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '刺梨原浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 刺梨原浆';
    END IF;


    -- 原材料 2: 山茶花茶汤 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '山茶花茶汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 山茶花茶汤';
    END IF;


    -- 原材料 3: 果葡糖浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '果葡糖浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 果葡糖浆';
    END IF;


    -- 原材料 4: 冰块 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰块'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冰块';
    END IF;


    -- 原材料 5: 刺梨果干 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '刺梨果干'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 刺梨果干';
    END IF;


END $$;


-- 配方明细: 五指毛桃茶汤(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-077-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-077-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 五指毛桃茶包 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五指毛桃茶包'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五指毛桃茶包';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


    -- 原材料 3: 果葡糖浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '果葡糖浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 果葡糖浆';
    END IF;


END $$;


-- 配方明细: 五指毛桃山茶
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-078-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-078-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 五指毛桃茶汤 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五指毛桃茶汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五指毛桃茶汤';
    END IF;


    -- 原材料 2: 薏仁罐头 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薏仁罐头'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 薏仁罐头';
    END IF;


    -- 原材料 3: 果葡糖浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '果葡糖浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 果葡糖浆';
    END IF;


    -- 原材料 4: 冰块 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰块'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冰块';
    END IF;


    -- 原材料 5: 五指毛桃干 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五指毛桃干'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五指毛桃干';
    END IF;


END $$;


-- 配方明细: 鸭屎香乌龙茶汤(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-079-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-079-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鸭屎香乌龙茶茶叶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸭屎香乌龙茶茶叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸭屎香乌龙茶茶叶';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


END $$;


-- 配方明细: 柠檬山茶
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-080-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-080-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 香水柠檬 (0g, 出成率:85%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香水柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.85,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香水柠檬';
    END IF;


    -- 原材料 2: 鸭屎香乌龙茶汤 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸭屎香乌龙茶汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸭屎香乌龙茶汤';
    END IF;


    -- 原材料 3: 果葡糖浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '果葡糖浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 果葡糖浆';
    END IF;


    -- 原材料 4: 香水柠檬 (0g, 出成率:85%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香水柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.85,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香水柠檬';
    END IF;


    -- 原材料 5: 黄柠檬 (0g, 出成率:85%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.85,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄柠檬';
    END IF;


END $$;


-- 配方明细: 雪域藏茶茶汤(半成品)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-081-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-081-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 雪域藏茶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雪域藏茶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 雪域藏茶';
    END IF;


    -- 原材料 2: 水 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


END $$;


-- 配方明细: 柠檬藏茶
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-082-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-082-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 香水柠檬 (0g, 出成率:85%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香水柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.85,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香水柠檬';
    END IF;


    -- 原材料 2: 蔗糖糖浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蔗糖糖浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蔗糖糖浆';
    END IF;


    -- 原材料 3: 金桔柠檬果蓉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金桔柠檬果蓉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 金桔柠檬果蓉';
    END IF;


    -- 原材料 4: 冰块 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰块'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冰块';
    END IF;


    -- 原材料 5: 雪域藏茶茶汤 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雪域藏茶茶汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 雪域藏茶茶汤';
    END IF;


END $$;


-- 配方明细: 四果汤
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-083-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-083-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 芒果 (0g, 出成率:55%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芒果'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.55,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芒果';
    END IF;


    -- 原材料 2: 荔枝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '荔枝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 荔枝';
    END IF;


    -- 原材料 3: 莲子罐头 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '莲子罐头'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 莲子罐头';
    END IF;


    -- 原材料 4: 烧仙草罐头 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '烧仙草罐头'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 烧仙草罐头';
    END IF;


    -- 原材料 5: 芋泥罐头 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芋泥罐头'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芋泥罐头';
    END IF;


    -- 原材料 6: 糖桂花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糖桂花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糖桂花';
    END IF;


    -- 原材料 7: 海石花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '海石花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 海石花';
    END IF;


END $$;


-- 配方明细: 千层酥小米渣
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-084-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-084-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 小米渣 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米渣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小米渣';
    END IF;


    -- 原材料 2: 斑斓酱 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '斑斓酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 斑斓酱';
    END IF;


    -- 原材料 3: 网状春卷皮 (0g, 出成率:90%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '网状春卷皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.9,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 网状春卷皮';
    END IF;


    -- 原材料 4: 千丝酥皮 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '千丝酥皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 千丝酥皮';
    END IF;


    -- 原材料 5: 红辣椒丝 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红辣椒丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红辣椒丝';
    END IF;


END $$;


-- 配方明细: 桂花蜜薯
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-085-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-085-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 蜜薯 (0g, 出成率:50%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蜜薯'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.5,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蜜薯';
    END IF;


    -- 原材料 2: 糖桂花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糖桂花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糖桂花';
    END IF;


    -- 原材料 3: 鲜百合 (0g, 出成率:90%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜百合'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.9,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜百合';
    END IF;


    -- 原材料 4: 干桂花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干桂花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干桂花';
    END IF;


END $$;


-- 配方明细: 米酿龙眼桂花冰
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-086-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-086-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 冷冻龙眼肉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冷冻龙眼肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冷冻龙眼肉';
    END IF;


    -- 原材料 2: 桂花酒酿 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '桂花酒酿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 桂花酒酿';
    END IF;


    -- 原材料 3: 蔗糖糖浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蔗糖糖浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蔗糖糖浆';
    END IF;


    -- 原材料 4: 牛乳粉 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '牛乳粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 牛乳粉';
    END IF;


    -- 原材料 5: 冰块 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰块'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冰块';
    END IF;


    -- 原材料 6: 糯米 (0g, 出成率:3%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糯米'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.0255,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糯米';
    END IF;


    -- 原材料 7: 干桂花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干桂花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干桂花';
    END IF;


    -- 原材料 8: 鲜龙眼 (0g, 出成率:90%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜龙眼'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            0.9,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜龙眼';
    END IF;


END $$;


-- 配方明细: 柿子半熟生酪
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-CC-087-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-CC-087-v1';
        RETURN;
    END IF;

    -- 清空原有配方明细
    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 奶油奶酪 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '奶油奶酪'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 奶油奶酪';
    END IF;


    -- 原材料 2: 全脂牛奶 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '全脂牛奶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 全脂牛奶';
    END IF;


    -- 原材料 3: 百利凝胶片 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '百利凝胶片'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 百利凝胶片';
    END IF;


    -- 原材料 4: 冷冻柿子浆 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冷冻柿子浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 冷冻柿子浆';
    END IF;


    -- 原材料 5: 白糖 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 6: 干桂花 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干桂花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干桂花';
    END IF;


    -- 原材料 7: 淡奶油 (0g, 出成率:100%)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '淡奶油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, usage_yield_rate, is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            1.0,
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 淡奶油';
    END IF;


END $$;


-- ============================================================================
-- 6. 数据验证
-- ============================================================================
-- 验证导入的原材料数量
-- SELECT COUNT(*) AS raw_material_count FROM product WHERE product_type = 'raw_material';

-- 验证导入的成品数量
-- SELECT COUNT(*) AS finished_product_count FROM product WHERE product_type = 'finished';

-- 验证配方完整性
-- SELECT
--     r.recipe_code,
--     p.product_name,
--     COUNT(ri.recipe_item_id) AS ingredient_count
-- FROM recipe r
-- JOIN product p ON r.product_id = p.product_id
-- LEFT JOIN recipe_item ri ON r.recipe_id = ri.recipe_id
-- WHERE r.is_current = TRUE
-- GROUP BY r.recipe_code, p.product_name
-- ORDER BY r.recipe_code;

-- ============================================================================
-- 脚本完成
-- ============================================================================
