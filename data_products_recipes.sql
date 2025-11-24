-- ============================================================================
-- 野百灵餐饮集团 - 成品菜与配方数据录入
-- ============================================================================
-- 版本: v1.2.0
-- 数据来源:
--   - 配方: 成本卡_产品配方_最终修正版.json
--   - 价格: 原材料价格及规格明细表.md (标准价格源)
--   - 出成率: WL成本卡.xlsx (原材料价格表)
-- 产品数量: 63
-- 出成率<100%原材料: 60种
-- 成本公式: 实际成本 = 用量 × 单价 / 出成率
-- 生成时间: 2025-11-22 07:14:09
-- ============================================================================

-- 设置加密密钥
SET app.encryption_key = 'ybl-restaurant-encryption-key-2025';

-- ============================================================================
-- 1. 成品菜产品数据 (product_type = 'finished')
-- ============================================================================


-- 1. 云山雪花吊龙 (标准成本: 30.71元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-001',
    '云山雪花吊龙',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(30.71),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 2. 木姜子鲜黄牛肉 (标准成本: 16.03元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-002',
    '木姜子鲜黄牛肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(16.03),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 3. 糊辣椒鲜黄牛匙仁 (标准成本: 14.27元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-003',
    '糊辣椒鲜黄牛匙仁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(14.27),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 4. 野蒜酥五花趾 (标准成本: 13.6元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-004',
    '野蒜酥五花趾',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(13.6),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 5. 紫苏半边云(鲜牛胸口) (标准成本: 18.14元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-005',
    '紫苏半边云(鲜牛胸口)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(18.14),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 6. 大地飞雪(M9纯血和牛) (标准成本: 37.65元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-006',
    '大地飞雪(M9纯血和牛)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(37.65),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 7. 贵州传统软哨 (标准成本: 7.31元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-007',
    '贵州传统软哨',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(7.31),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 8. 手工水晶滑肉 (标准成本: 4.5元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-008',
    '手工水晶滑肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(4.5),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 9. 过油响皮 (标准成本: 2.63元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-009',
    '过油响皮',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.63),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 10. 糯米午餐肉 (标准成本: 5.17元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-010',
    '糯米午餐肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.17),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 11. 净水鲜虾 (标准成本: 16.0元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-011',
    '净水鲜虾',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(16.0),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 12. 乌鱼片 (标准成本: 7.1元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-012',
    '乌鱼片',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(7.1),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 13. 海鲜拼盘 (标准成本: 42.53元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-013',
    '海鲜拼盘',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(42.53),
    'standard',
    '原材料种类: 5种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 14. 黑金虾滑 (标准成本: 11.37元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-014',
    '黑金虾滑',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.37),
    'standard',
    '原材料种类: 4种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 15. 鲜板栗 (标准成本: 2.84元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-015',
    '鲜板栗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.84),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 16. 鲜百合 (标准成本: 9.26元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-016',
    '鲜百合',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(9.26),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 17. 血皮菜 (标准成本: 1.44元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-017',
    '血皮菜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(1.44),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 18. 鲜黄花 (标准成本: 4.42元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-018',
    '鲜黄花',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(4.42),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 19. 山药 (标准成本: 2.33元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-019',
    '山药',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.33),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 20. 甜笋(刺身级) (标准成本: 2.13元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-020',
    '甜笋(刺身级)',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.13),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 21. 三脆碗 (标准成本: 6.67元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-021',
    '三脆碗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(6.67),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 22. 姜柄瓜 (标准成本: 2.68元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-022',
    '姜柄瓜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.68),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 23. 双花碗 (标准成本: 6.36元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-023',
    '双花碗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(6.36),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 24. 彩云土豆 (标准成本: 0.78元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-024',
    '彩云土豆',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(0.78),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 25. 藕 (标准成本: 2.08元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-025',
    '藕',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.08),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 26. 石磨黑豆腐 (标准成本: 2.67元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-026',
    '石磨黑豆腐',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.67),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 27. 野篮子菌菇组合 (标准成本: 13.29元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-027',
    '野篮子菌菇组合',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(13.29),
    'standard',
    '原材料种类: 7种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 28. 火烧云铜锅油焖鸡 (标准成本: 17.45元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-028',
    '火烧云铜锅油焖鸡',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(17.45),
    'standard',
    '原材料种类: 17种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 29. 息烽虎皮猪蹄 (标准成本: 28.81元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-029',
    '息烽虎皮猪蹄',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(28.81),
    'standard',
    '原材料种类: 9种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 30. 干巴菌炒饭 (标准成本: 12.68元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-030',
    '干巴菌炒饭',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(12.68),
    'standard',
    '原材料种类: 11种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 31. 糟辣椒炒饭 (标准成本: 3.14元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-031',
    '糟辣椒炒饭',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.14),
    'standard',
    '原材料种类: 4种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 32. 野佐料擂椒皮蛋 (标准成本: 9.09元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-032',
    '野佐料擂椒皮蛋',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(9.09),
    'standard',
    '原材料种类: 18种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 33. 木姜子鸡爪 (标准成本: 21.29元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-033',
    '木姜子鸡爪',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(21.29),
    'standard',
    '原材料种类: 14种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 34. 傣村手撕罗非鱼 (标准成本: 20.15元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-034',
    '傣村手撕罗非鱼',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(20.15),
    'standard',
    '原材料种类: 8种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 35. 贵州非遗丝娃娃 (标准成本: 11.99元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-035',
    '贵州非遗丝娃娃',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.99),
    'standard',
    '原材料种类: 15种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 36. 苗侗空气丸子 (标准成本: 8.21元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-036',
    '苗侗空气丸子',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(8.21),
    'standard',
    '原材料种类: 14种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 37. 雪顶冰淇淋玉米粑 (标准成本: 5.27元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-037',
    '雪顶冰淇淋玉米粑',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.27),
    'standard',
    '原材料种类: 4种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 38. 野菜卷 (标准成本: 5.1元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-038',
    '野菜卷',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.1),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 39. 山玫瑰炸乳扇 (标准成本: 3.34元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-039',
    '山玫瑰炸乳扇',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.34),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 40. 怪噜洋芋 (标准成本: 2.83元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-040',
    '怪噜洋芋',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.83),
    'standard',
    '原材料种类: 12种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 41. 紫苏桃子 (标准成本: 11.04元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-041',
    '紫苏桃子',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.04),
    'standard',
    '原材料种类: 8种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 42. 铁棍山药面 (标准成本: 2.64元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-042',
    '铁棍山药面',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.64),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 43. 黔南布依带皮牛肉 (标准成本: 11.3元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-043',
    '黔南布依带皮牛肉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.3),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 44. 净海老鱼花胶 (标准成本: 11.95元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-044',
    '净海老鱼花胶',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.95),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 45. 豌豆尖 (标准成本: 3.43元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-045',
    '豌豆尖',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.43),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 46. 薄荷 (标准成本: 1.69元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-046',
    '薄荷',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(1.69),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 47. 贵阳非遗脆三丁 (标准成本: 7.0元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-047',
    '贵阳非遗脆三丁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(7.0),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 48. 花生芽 (标准成本: 3.09元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-048',
    '花生芽',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.09),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 49. 安格斯雪花牛 (标准成本: 12.81元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-049',
    '安格斯雪花牛',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(12.81),
    'standard',
    '原材料种类: 2种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 50. 龙须菜 (标准成本: 5.08元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-050',
    '龙须菜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.08),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 51. 茼蒿 (标准成本: 3.0元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-051',
    '茼蒿',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.0),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 52. 人参苗 (标准成本: 3.53元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-052',
    '人参苗',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.53),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 53. 野篮子蔬菜组合 (标准成本: 11.39元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-053',
    '野篮子蔬菜组合',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.39),
    'standard',
    '原材料种类: 6种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 54. 息烽阳朗辣子鸡 (标准成本: 19.18元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-054',
    '息烽阳朗辣子鸡',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(19.18),
    'standard',
    '原材料种类: 12种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 55. 灯捕鲈鱼 (标准成本: 16.78元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-055',
    '灯捕鲈鱼',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(16.78),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 56. 扎佐薄荷五花丁 (标准成本: 19.62元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-056',
    '扎佐薄荷五花丁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(19.62),
    'standard',
    '原材料种类: 17种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 57. 黄辣丁 (标准成本: 8500.0元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-057',
    '黄辣丁',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(8500.0),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 58. 紫白菜 (标准成本: 6.55元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-058',
    '紫白菜',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(6.55),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 59. 黄苦菊 (标准成本: 4.46元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-059',
    '黄苦菊',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(4.46),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 60. 豆米汤饭 (标准成本: 34.56元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-060',
    '豆米汤饭',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(34.56),
    'standard',
    '原材料种类: 9种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 61. 定西土豆粉 (标准成本: 0.48元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-061',
    '定西土豆粉',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(0.48),
    'standard',
    '原材料种类: 1种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 62. 黑松露和牛开口笑 (标准成本: 8.32元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-062',
    '黑松露和牛开口笑',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(8.32),
    'standard',
    '原材料种类: 3种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- 63. 老凯里非遗酸汤 (标准成本: 13.89元)
INSERT INTO product (
    product_code, product_name, product_type, category_id,
    is_saleable, is_ingredient, base_unit_id,
    current_cost_encrypted, cost_calculation_method,
    description, is_active
) VALUES (
    'FP-063',
    '老凯里非遗酸汤',
    'finished',
    (SELECT category_id FROM product_category WHERE category_code = 'CAT-FINISHED'),
    TRUE,
    FALSE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(13.89),
    'standard',
    '原材料种类: 12种 | 基于标准价格表计算',
    TRUE
) ON CONFLICT (product_code) DO UPDATE SET
    product_name = EXCLUDED.product_name,
    current_cost_encrypted = EXCLUDED.current_cost_encrypted,
    description = EXCLUDED.description,
    updated_at = NOW();


-- ============================================================================
-- 2. 配方主表 (recipe)
-- ============================================================================


-- 配方: 云山雪花吊龙
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-001-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-001'),
    'v1.0',
    '云山雪花吊龙 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(30.71),
    encrypt_cost(30.71),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 木姜子鲜黄牛肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-002-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-002'),
    'v1.0',
    '木姜子鲜黄牛肉 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(16.03),
    encrypt_cost(16.03),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 糊辣椒鲜黄牛匙仁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-003-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-003'),
    'v1.0',
    '糊辣椒鲜黄牛匙仁 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(14.27),
    encrypt_cost(14.27),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 野蒜酥五花趾
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-004-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-004'),
    'v1.0',
    '野蒜酥五花趾 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(13.6),
    encrypt_cost(13.6),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 紫苏半边云(鲜牛胸口)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-005-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-005'),
    'v1.0',
    '紫苏半边云(鲜牛胸口) 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(18.14),
    encrypt_cost(18.14),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 大地飞雪(M9纯血和牛)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-006-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-006'),
    'v1.0',
    '大地飞雪(M9纯血和牛) 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(37.65),
    encrypt_cost(37.65),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 贵州传统软哨
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-007-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-007'),
    'v1.0',
    '贵州传统软哨 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(7.31),
    encrypt_cost(7.31),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 手工水晶滑肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-008-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-008'),
    'v1.0',
    '手工水晶滑肉 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(4.5),
    encrypt_cost(4.5),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 过油响皮
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-009-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-009'),
    'v1.0',
    '过油响皮 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.63),
    encrypt_cost(2.63),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 糯米午餐肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-010-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-010'),
    'v1.0',
    '糯米午餐肉 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.17),
    encrypt_cost(5.17),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 净水鲜虾
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-011-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-011'),
    'v1.0',
    '净水鲜虾 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(16.0),
    encrypt_cost(16.0),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 乌鱼片
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-012-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-012'),
    'v1.0',
    '乌鱼片 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(7.1),
    encrypt_cost(7.1),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 海鲜拼盘
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-013-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-013'),
    'v1.0',
    '海鲜拼盘 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(42.53),
    encrypt_cost(42.53),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 黑金虾滑
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-014-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-014'),
    'v1.0',
    '黑金虾滑 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.37),
    encrypt_cost(11.37),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 鲜板栗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-015-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-015'),
    'v1.0',
    '鲜板栗 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.84),
    encrypt_cost(2.84),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 鲜百合
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-016-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-016'),
    'v1.0',
    '鲜百合 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(9.26),
    encrypt_cost(9.26),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 血皮菜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-017-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-017'),
    'v1.0',
    '血皮菜 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(1.44),
    encrypt_cost(1.44),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 鲜黄花
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-018-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-018'),
    'v1.0',
    '鲜黄花 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(4.42),
    encrypt_cost(4.42),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 山药
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-019-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-019'),
    'v1.0',
    '山药 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.33),
    encrypt_cost(2.33),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 甜笋(刺身级)
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-020-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-020'),
    'v1.0',
    '甜笋(刺身级) 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.13),
    encrypt_cost(2.13),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 三脆碗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-021-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-021'),
    'v1.0',
    '三脆碗 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(6.67),
    encrypt_cost(6.67),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 姜柄瓜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-022-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-022'),
    'v1.0',
    '姜柄瓜 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.68),
    encrypt_cost(2.68),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 双花碗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-023-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-023'),
    'v1.0',
    '双花碗 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(6.36),
    encrypt_cost(6.36),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 彩云土豆
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-024-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-024'),
    'v1.0',
    '彩云土豆 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(0.78),
    encrypt_cost(0.78),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 藕
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-025-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-025'),
    'v1.0',
    '藕 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.08),
    encrypt_cost(2.08),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 石磨黑豆腐
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-026-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-026'),
    'v1.0',
    '石磨黑豆腐 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.67),
    encrypt_cost(2.67),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 野篮子菌菇组合
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-027-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-027'),
    'v1.0',
    '野篮子菌菇组合 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(13.29),
    encrypt_cost(13.29),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 火烧云铜锅油焖鸡
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-028-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-028'),
    'v1.0',
    '火烧云铜锅油焖鸡 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(17.45),
    encrypt_cost(17.45),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 息烽虎皮猪蹄
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-029-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-029'),
    'v1.0',
    '息烽虎皮猪蹄 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(28.81),
    encrypt_cost(28.81),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 干巴菌炒饭
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-030-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-030'),
    'v1.0',
    '干巴菌炒饭 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(12.68),
    encrypt_cost(12.68),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 糟辣椒炒饭
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-031-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-031'),
    'v1.0',
    '糟辣椒炒饭 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.14),
    encrypt_cost(3.14),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 野佐料擂椒皮蛋
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-032-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-032'),
    'v1.0',
    '野佐料擂椒皮蛋 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(9.09),
    encrypt_cost(9.09),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 木姜子鸡爪
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-033-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-033'),
    'v1.0',
    '木姜子鸡爪 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(21.29),
    encrypt_cost(21.29),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 傣村手撕罗非鱼
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-034-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-034'),
    'v1.0',
    '傣村手撕罗非鱼 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(20.15),
    encrypt_cost(20.15),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 贵州非遗丝娃娃
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-035-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-035'),
    'v1.0',
    '贵州非遗丝娃娃 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.99),
    encrypt_cost(11.99),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 苗侗空气丸子
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-036-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-036'),
    'v1.0',
    '苗侗空气丸子 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(8.21),
    encrypt_cost(8.21),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 雪顶冰淇淋玉米粑
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-037-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-037'),
    'v1.0',
    '雪顶冰淇淋玉米粑 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.27),
    encrypt_cost(5.27),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 野菜卷
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-038-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-038'),
    'v1.0',
    '野菜卷 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.1),
    encrypt_cost(5.1),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 山玫瑰炸乳扇
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-039-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-039'),
    'v1.0',
    '山玫瑰炸乳扇 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.34),
    encrypt_cost(3.34),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 怪噜洋芋
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-040-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-040'),
    'v1.0',
    '怪噜洋芋 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.83),
    encrypt_cost(2.83),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 紫苏桃子
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-041-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-041'),
    'v1.0',
    '紫苏桃子 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.04),
    encrypt_cost(11.04),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 铁棍山药面
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-042-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-042'),
    'v1.0',
    '铁棍山药面 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(2.64),
    encrypt_cost(2.64),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 黔南布依带皮牛肉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-043-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-043'),
    'v1.0',
    '黔南布依带皮牛肉 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.3),
    encrypt_cost(11.3),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 净海老鱼花胶
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-044-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-044'),
    'v1.0',
    '净海老鱼花胶 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.95),
    encrypt_cost(11.95),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 豌豆尖
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-045-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-045'),
    'v1.0',
    '豌豆尖 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.43),
    encrypt_cost(3.43),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 薄荷
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-046-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-046'),
    'v1.0',
    '薄荷 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(1.69),
    encrypt_cost(1.69),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 贵阳非遗脆三丁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-047-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-047'),
    'v1.0',
    '贵阳非遗脆三丁 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(7.0),
    encrypt_cost(7.0),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 花生芽
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-048-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-048'),
    'v1.0',
    '花生芽 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.09),
    encrypt_cost(3.09),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 安格斯雪花牛
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-049-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-049'),
    'v1.0',
    '安格斯雪花牛 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(12.81),
    encrypt_cost(12.81),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 龙须菜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-050-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-050'),
    'v1.0',
    '龙须菜 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(5.08),
    encrypt_cost(5.08),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 茼蒿
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-051-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-051'),
    'v1.0',
    '茼蒿 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.0),
    encrypt_cost(3.0),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 人参苗
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-052-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-052'),
    'v1.0',
    '人参苗 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(3.53),
    encrypt_cost(3.53),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 野篮子蔬菜组合
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-053-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-053'),
    'v1.0',
    '野篮子蔬菜组合 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(11.39),
    encrypt_cost(11.39),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 息烽阳朗辣子鸡
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-054-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-054'),
    'v1.0',
    '息烽阳朗辣子鸡 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(19.18),
    encrypt_cost(19.18),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 灯捕鲈鱼
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-055-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-055'),
    'v1.0',
    '灯捕鲈鱼 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(16.78),
    encrypt_cost(16.78),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 扎佐薄荷五花丁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-056-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-056'),
    'v1.0',
    '扎佐薄荷五花丁 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(19.62),
    encrypt_cost(19.62),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 黄辣丁
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-057-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-057'),
    'v1.0',
    '黄辣丁 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(8500.0),
    encrypt_cost(8500.0),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 紫白菜
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-058-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-058'),
    'v1.0',
    '紫白菜 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(6.55),
    encrypt_cost(6.55),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 黄苦菊
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-059-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-059'),
    'v1.0',
    '黄苦菊 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(4.46),
    encrypt_cost(4.46),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 豆米汤饭
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-060-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-060'),
    'v1.0',
    '豆米汤饭 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(34.56),
    encrypt_cost(34.56),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 定西土豆粉
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-061-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-061'),
    'v1.0',
    '定西土豆粉 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(0.48),
    encrypt_cost(0.48),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 黑松露和牛开口笑
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-062-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-062'),
    'v1.0',
    '黑松露和牛开口笑 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(8.32),
    encrypt_cost(8.32),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- 配方: 老凯里非遗酸汤
INSERT INTO recipe (
    recipe_code, product_id, version, recipe_name,
    effective_date, is_current,
    yield_quantity, yield_unit_id,
    total_material_cost_encrypted, total_cost_encrypted,
    status
) VALUES (
    'RCP-063-v1',
    (SELECT product_id FROM product WHERE product_code = 'FP-063'),
    'v1.0',
    '老凯里非遗酸汤 标准配方',
    '2025-01-01',
    TRUE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'serving'),
    encrypt_cost(13.89),
    encrypt_cost(13.89),
    'approved'
) ON CONFLICT (recipe_code) DO UPDATE SET
    total_material_cost_encrypted = EXCLUDED.total_material_cost_encrypted,
    total_cost_encrypted = EXCLUDED.total_cost_encrypted,
    updated_at = NOW();


-- ============================================================================
-- 3. 配方明细 (recipe_item)
-- ============================================================================
-- 价格来源: 原材料价格及规格明细表.md
-- 出成率来源: WL成本卡.xlsx
-- 成本公式: 实际成本 = 用量 × 单价 / 出成率
-- ============================================================================


-- 配方明细: 云山雪花吊龙
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-001-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-001-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 吊龙 (用量:250.0g, 单价:0.1040/g, 出成率:90%, 成本:28.89元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '吊龙'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            250.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.104000),
            0.9,
            0,
            encrypt_cost(28.8889),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 吊龙';
    END IF;


    -- 原材料 2: 法香 (用量:120.0g, 单价:0.0140/g, 成本:1.68元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '法香'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(1.6800),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 法香';
    END IF;


    -- 原材料 3: 干冰 (用量:20.0g, 单价:0.0070/g, 成本:0.14元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干冰'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            1.0,
            0,
            encrypt_cost(0.1400),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-002-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-002-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 吊龙 (用量:120.0g, 单价:0.1040/g, 出成率:90%, 成本:13.87元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '吊龙'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.104000),
            0.9,
            0,
            encrypt_cost(13.8667),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 吊龙';
    END IF;


    -- 原材料 2: 木姜子 (用量:60.0g, 单价:0.0360/g, 成本:2.16元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            60.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.036000),
            1.0,
            0,
            encrypt_cost(2.1600),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-003-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-003-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 匙仁 (用量:120.0g, 单价:0.0920/g, 出成率:90%, 成本:12.27元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '匙仁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.092000),
            0.9,
            0,
            encrypt_cost(12.2667),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 匙仁';
    END IF;


    -- 原材料 2: 糊辣椒 (用量:25.0g, 单价:0.0500/g, 成本:1.25元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.050000),
            1.0,
            0,
            encrypt_cost(1.2500),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 3: 干香茅草 (用量:25.0g, 单价:0.0300/g, 成本:0.75元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干香茅草'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030000),
            1.0,
            0,
            encrypt_cost(0.7500),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-004-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-004-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 五花腱 (用量:120.0g, 单价:0.0900/g, 出成率:90%, 成本:12.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五花腱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.090000),
            0.9,
            0,
            encrypt_cost(12.0000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五花腱';
    END IF;


    -- 原材料 2: 金蒜酥 (用量:40.0g, 单价:0.0400/g, 成本:1.60元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金蒜酥'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            40.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(1.6000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 金蒜酥';
    END IF;


END $$;


-- 配方明细: 紫苏半边云(鲜牛胸口)
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-005-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-005-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 胸口油 (用量:120.0g, 单价:0.1040/g, 出成率:70%, 成本:17.83元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '胸口油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.104000),
            0.7,
            0,
            encrypt_cost(17.8286),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 胸口油';
    END IF;


    -- 原材料 2: 紫苏叶 (用量:10.0g, 单价:0.0160/g, 成本:0.16元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.1600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏叶';
    END IF;


    -- 原材料 3: 紫苏碎 (用量:5.0g, 单价:0.0300/g, 成本:0.15元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030000),
            1.0,
            0,
            encrypt_cost(0.1500),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-006-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-006-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: M9和牛 (用量:200.0g, 单价:0.1600/g, 出成率:85%, 成本:37.65元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = 'M9和牛'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            200.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.160000),
            0.85,
            0,
            encrypt_cost(37.6471),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: M9和牛';
    END IF;


END $$;


-- 配方明细: 贵州传统软哨
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-007-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-007-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 软哨片 (用量:100.0g, 单价:0.0720/g, 成本:7.20元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '软哨片'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.072000),
            1.0,
            0,
            encrypt_cost(7.2000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 软哨片';
    END IF;


    -- 原材料 2: 芭蕉叶 (用量:5.0g, 单价:0.0200/g, 出成率:90%, 成本:0.11元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.9,
            0,
            encrypt_cost(0.1111),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芭蕉叶';
    END IF;


END $$;


-- 配方明细: 手工水晶滑肉
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-008-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-008-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 雪花松板肉 (用量:96.39g, 单价:0.0400/g, 成本:3.86元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雪花松板肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            96.39,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(3.8556),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 雪花松板肉';
    END IF;


    -- 原材料 2: 红薯淀粉 (用量:36.14g, 单价:0.0120/g, 成本:0.43元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红薯淀粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            36.14,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.012000),
            1.0,
            0,
            encrypt_cost(0.4337),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红薯淀粉';
    END IF;


    -- 原材料 3: 红叶生菜 (用量:15.0g, 单价:0.0140/g, 成本:0.21元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.2100),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-009-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-009-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 猪响皮 (用量:50.0g, 单价:0.0500/g, 出成率:95%, 成本:2.63元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪响皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.050000),
            0.95,
            0,
            encrypt_cost(2.6316),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-010-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-010-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 糯米午餐肉 (用量:170.0g, 单价:0.0304/g, 成本:5.17元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糯米午餐肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            170.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030400),
            1.0,
            0,
            encrypt_cost(5.1680),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-011-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-011-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 基围虾 (用量:8.0g, 单价:2.0000/g, 成本:16.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '基围虾'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            8.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(2.000000),
            1.0,
            0,
            encrypt_cost(16.0000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-012-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-012-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 乌鱼片 (用量:130.0g, 单价:0.0440/g, 出成率:95%, 成本:6.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '乌鱼片'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            130.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.044000),
            0.95,
            0,
            encrypt_cost(6.0211),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 乌鱼片';
    END IF;


    -- 原材料 2: 甜菊 (用量:1.5g, 单价:0.2162/g, 出成率:30%, 成本:1.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜菊'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.5,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.216200),
            0.3,
            0,
            encrypt_cost(1.0810),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-013-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-013-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 小管 (用量:1.0g, 单价:8.0000/g, 成本:8.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小管'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(8.000000),
            1.0,
            0,
            encrypt_cost(8.0000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小管';
    END IF;


    -- 原材料 2: 10头鲍 (用量:3.0g, 单价:6.5000/g, 成本:19.50元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '8头鲍'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(6.500000),
            1.0,
            0,
            encrypt_cost(19.5000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 8头鲍';
    END IF;


    -- 原材料 3: 生蚝 (用量:2.0g, 单价:3.5000/g, 成本:7.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生蚝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(3.500000),
            1.0,
            0,
            encrypt_cost(7.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生蚝';
    END IF;


    -- 原材料 4: 基围虾 (用量:4.0g, 单价:2.0000/g, 成本:8.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '基围虾'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            4.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(2.000000),
            1.0,
            0,
            encrypt_cost(8.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 基围虾';
    END IF;


    -- 原材料 5: 紫苏叶 (用量:2.0g, 单价:0.0160/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.0320),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-014-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-014-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 虾滑 (用量:150.0g, 单价:0.0733/g, 成本:11.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '虾滑'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.073300),
            1.0,
            0,
            encrypt_cost(10.9950),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 虾滑';
    END IF;


    -- 原材料 2: 墨鱼汁 (用量:1.0g, 单价:0.2240/g, 成本:0.22元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '墨鱼汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.224000),
            1.0,
            0,
            encrypt_cost(0.2240),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 墨鱼汁';
    END IF;


    -- 原材料 3: 金蒜酥 (用量:1.0g, 单价:0.0400/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金蒜酥'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(0.0400),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 金蒜酥';
    END IF;


    -- 原材料 4: 芭蕉叶 (用量:5.0g, 单价:0.0200/g, 出成率:90%, 成本:0.11元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.9,
            0,
            encrypt_cost(0.1111),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-015-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-015-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲜板栗 (用量:130.0g, 单价:0.0200/g, 成本:2.60元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜板栗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            130.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            1.0,
            0,
            encrypt_cost(2.6000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜板栗';
    END IF;


    -- 原材料 2: 羽衣甘蓝 (用量:15.0g, 单价:0.0160/g, 成本:0.24元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.2400),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-016-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-016-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲜百合 (用量:50.0g, 单价:0.1667/g, 出成率:90%, 成本:9.26元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜百合'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.166700),
            0.9,
            0,
            encrypt_cost(9.2611),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-017-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-017-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 血皮菜 (用量:130.0g, 单价:0.0100/g, 出成率:90%, 成本:1.44元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '血皮菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            130.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            0.9,
            0,
            encrypt_cost(1.4444),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-018-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-018-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲜黄花 (用量:60.0g, 单价:0.0600/g, 出成率:90%, 成本:4.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜黄花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            60.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.060000),
            0.9,
            0,
            encrypt_cost(4.0000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜黄花';
    END IF;


    -- 原材料 2: 红叶生菜 (用量:30.0g, 单价:0.0140/g, 成本:0.42元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.4200),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-019-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-019-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 粗山药 (用量:160.0g, 单价:0.0070/g, 出成率:90%, 成本:1.24元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '粗山药'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            160.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            0.9,
            0,
            encrypt_cost(1.2444),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 粗山药';
    END IF;


    -- 原材料 2: 甜菊 (用量:1.5g, 单价:0.2162/g, 出成率:30%, 成本:1.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜菊'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.5,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.216200),
            0.3,
            0,
            encrypt_cost(1.0810),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-020-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-020-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 甜笋 (用量:80.0g, 单价:0.0240/g, 出成率:90%, 成本:2.13元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜笋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            80.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            0.9,
            0,
            encrypt_cost(2.1333),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 甜笋';
    END IF;


    -- 原材料 2: 水 (用量:80.0g, 单价:0.0000/g, 成本:0.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            80.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.000000),
            1.0,
            0,
            encrypt_cost(0.0000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-021-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-021-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 干黄花 (用量:25.0g, 单价:0.0530/g, 成本:1.32元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干黄花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.053000),
            1.0,
            0,
            encrypt_cost(1.3250),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干黄花';
    END IF;


    -- 原材料 2: 干花菜 (用量:50.0g, 单价:0.0341/g, 成本:1.70元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干花菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.034100),
            1.0,
            0,
            encrypt_cost(1.7050),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干花菜';
    END IF;


    -- 原材料 3: 干贡菜 (用量:40.0g, 单价:0.0910/g, 成本:3.64元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干贡菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            40.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.091000),
            1.0,
            0,
            encrypt_cost(3.6400),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-022-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-022-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 姜柄瓜 (用量:140.0g, 单价:0.0160/g, 出成率:95%, 成本:2.36元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜柄瓜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            140.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            0.95,
            0,
            encrypt_cost(2.3579),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜柄瓜';
    END IF;


    -- 原材料 2: 羽衣甘蓝 (用量:20.0g, 单价:0.0160/g, 成本:0.32元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.3200),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-023-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-023-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 花生芽 (用量:120.0g, 单价:0.0196/g, 出成率:95%, 成本:2.48元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花生芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.019600),
            0.95,
            0,
            encrypt_cost(2.4758),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花生芽';
    END IF;


    -- 原材料 2: 黄瓜花 (用量:50.0g, 单价:0.0700/g, 出成率:90%, 成本:3.89元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄瓜花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.070000),
            0.9,
            0,
            encrypt_cost(3.8889),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-024-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-024-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 七彩土豆 (用量:100.0g, 单价:0.0070/g, 出成率:90%, 成本:0.78元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '七彩土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            0.9,
            0,
            encrypt_cost(0.7778),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-025-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-025-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 藕 (用量:120.0g, 单价:0.0100/g, 出成率:90%, 成本:1.33元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藕'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            0.9,
            0,
            encrypt_cost(1.3333),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 藕';
    END IF;


    -- 原材料 2: 红叶生菜 (用量:25.0g, 单价:0.0140/g, 成本:0.35元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.3500),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红叶生菜';
    END IF;


    -- 原材料 3: 羽衣甘蓝 (用量:25.0g, 单价:0.0160/g, 成本:0.40元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.4000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-026-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-026-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 黑豆腐 (用量:250.0g, 单价:0.0090/g, 成本:2.25元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑豆腐'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            250.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.009000),
            1.0,
            0,
            encrypt_cost(2.2500),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黑豆腐';
    END IF;


    -- 原材料 2: 红叶生菜 (用量:30.0g, 单价:0.0140/g, 成本:0.42元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.4200),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-027-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-027-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 牛肝菌 (用量:50.0g, 单价:0.0640/g, 出成率:95%, 成本:3.37元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '牛肝菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.064000),
            0.95,
            0,
            encrypt_cost(3.3684),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 牛肝菌';
    END IF;


    -- 原材料 2: 球盖菇 (用量:50.0g, 单价:0.0200/g, 出成率:95%, 成本:1.05元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '球盖菇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.95,
            0,
            encrypt_cost(1.0526),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 球盖菇';
    END IF;


    -- 原材料 3: 鹿茸菇 (用量:60.0g, 单价:0.0180/g, 出成率:95%, 成本:1.14元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鹿茸菇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            60.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.018000),
            0.95,
            0,
            encrypt_cost(1.1368),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鹿茸菇';
    END IF;


    -- 原材料 4: 金耳菌 (用量:80.0g, 单价:0.0220/g, 成本:1.76元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金耳菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            80.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.022000),
            1.0,
            0,
            encrypt_cost(1.7600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 金耳菌';
    END IF;


    -- 原材料 5: 绣球菌 (用量:60.0g, 单价:0.0750/g, 出成率:95%, 成本:4.74元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '绣球菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            60.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.075000),
            0.95,
            0,
            encrypt_cost(4.7368),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 绣球菌';
    END IF;


    -- 原材料 6: 莲白 (用量:300.0g, 单价:0.0020/g, 成本:0.60元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '莲白'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            300.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.002000),
            1.0,
            0,
            encrypt_cost(0.6000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 莲白';
    END IF;


    -- 原材料 7: 羽衣甘蓝 (用量:40.0g, 单价:0.0160/g, 成本:0.64元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            40.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.6400),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 羽衣甘蓝';
    END IF;


END $$;


-- 配方明细: 火烧云铜锅油焖鸡
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-028-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-028-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 红油 (用量:100.0g, 单价:0.0540/g, 出成率:95%, 成本:5.68元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.054000),
            0.95,
            0,
            encrypt_cost(5.6842),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红油';
    END IF;


    -- 原材料 2: 番茄 (用量:150.0g, 单价:0.0070/g, 出成率:95%, 成本:1.11元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            0.95,
            0,
            encrypt_cost(1.1053),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 3: 小米辣 (用量:38.22g, 单价:0.0090/g, 出成率:95%, 成本:0.36元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            38.22,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.009000),
            0.95,
            0,
            encrypt_cost(0.3621),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小米辣';
    END IF;


    -- 原材料 4: 香茅 (用量:47.77g, 单价:0.0200/g, 出成率:90%, 成本:1.06元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香茅'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            47.77,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.9,
            0,
            encrypt_cost(1.0616),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香茅';
    END IF;


    -- 原材料 5: 大蒜 (用量:33.44g, 单价:0.0080/g, 成本:0.27元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            33.44,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.2675),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 6: 盐 (用量:0.96g, 单价:0.0023/g, 成本:0.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            0.96,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.002300),
            1.0,
            0,
            encrypt_cost(0.0022),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 盐';
    END IF;


    -- 原材料 7: 鸡精 (用量:4.78g, 单价:0.0288/g, 成本:0.14元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            4.78,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.028800),
            1.0,
            0,
            encrypt_cost(0.1377),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 8: 味精 (用量:3.82g, 单价:0.0176/g, 成本:0.07元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            3.82,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.017600),
            1.0,
            0,
            encrypt_cost(0.0672),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 9: 生抽 (用量:9.55g, 单价:0.0074/g, 成本:0.07元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            9.55,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007400),
            1.0,
            0,
            encrypt_cost(0.0707),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 10: 蚝油 (用量:9.55g, 单价:0.0067/g, 成本:0.06元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            9.55,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006700),
            1.0,
            0,
            encrypt_cost(0.0640),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


    -- 原材料 11: 草果粉 (用量:0.96g, 单价:0.0840/g, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '草果粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0.96,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.084000),
            1.0,
            0,
            encrypt_cost(0.0806),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 草果粉';
    END IF;


    -- 原材料 12: 五香粉 (用量:0.96g, 单价:0.0240/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五香粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0.96,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            1.0,
            0,
            encrypt_cost(0.0230),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五香粉';
    END IF;


    -- 原材料 13: 土豆 (用量:600.0g, 单价:0.0026/g, 成本:1.56元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            600.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.002600),
            1.0,
            0,
            encrypt_cost(1.5600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 土豆';
    END IF;


    -- 原材料 14: 去骨鸡腿肉 (用量:400.0g, 单价:0.0148/g, 出成率:95%, 成本:6.23元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '去骨鸡腿肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            400.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014800),
            0.95,
            0,
            encrypt_cost(6.2316),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 去骨鸡腿肉';
    END IF;


    -- 原材料 15: 百香果原汁 (用量:35.0g, 单价:0.0162/g, 成本:0.57元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '百香果原汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            15,
            35.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016200),
            1.0,
            0,
            encrypt_cost(0.5670),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 百香果原汁';
    END IF;


    -- 原材料 16: 大香菜 (用量:5.0g, 单价:0.0260/g, 成本:0.13元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            16,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.026000),
            1.0,
            0,
            encrypt_cost(0.1300),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大香菜';
    END IF;


    -- 原材料 17: 大葱 (用量:10.0g, 单价:0.0040/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            17,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.004000),
            1.0,
            0,
            encrypt_cost(0.0400),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-029-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-029-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 猪蹄 (用量:400.0g, 单价:0.0420/g, 出成率:90%, 成本:18.67元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪蹄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            400.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.042000),
            0.9,
            0,
            encrypt_cost(18.6667),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 猪蹄';
    END IF;


    -- 原材料 2: 郫县豆瓣 (用量:15.0g, 单价:0.0080/g, 成本:0.12元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '郫县豆瓣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.1200),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 郫县豆瓣';
    END IF;


    -- 原材料 3: 糍粑辣椒 (用量:150.0g, 单价:0.0300/g, 成本:4.50元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糍粑辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030000),
            1.0,
            0,
            encrypt_cost(4.5000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糍粑辣椒';
    END IF;


    -- 原材料 4: 姜 (用量:20.0g, 单价:0.0100/g, 成本:0.20元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            1.0,
            0,
            encrypt_cost(0.2000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 5: 大蒜 (用量:30.0g, 单价:0.0080/g, 成本:0.24元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.2400),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 6: 蒜苗 (用量:20.0g, 单价:0.0140/g, 成本:0.28元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.2800),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜苗';
    END IF;


    -- 原材料 7: 菜籽油 (用量:200.0g, 单价:0.0144/g, 成本:2.88元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菜籽油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            200.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014400),
            1.0,
            0,
            encrypt_cost(2.8800),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 菜籽油';
    END IF;


    -- 原材料 8: 啤酒 (用量:200.0g, 单价:0.0095/g, 成本:1.90元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雪花纯生'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            200.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.009500),
            1.0,
            0,
            encrypt_cost(1.9000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 雪花纯生';
    END IF;


    -- 原材料 9: 五香粉 (用量:1.0g, 单价:0.0240/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五香粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            1.0,
            0,
            encrypt_cost(0.0240),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五香粉';
    END IF;


END $$;


-- 配方明细: 干巴菌炒饭
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-030-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-030-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鸡油 (用量:24.24g, 单价:0.0220/g, 成本:0.53元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            24.24,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.022000),
            1.0,
            0,
            encrypt_cost(0.5333),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡油';
    END IF;


    -- 原材料 2: 干巴菌 (用量:6.06g, 单价:0.2600/g, 成本:1.58元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            6.06,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.260000),
            1.0,
            0,
            encrypt_cost(1.5756),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干巴菌';
    END IF;


    -- 原材料 3: 大蒜 (用量:3.64g, 单价:0.0080/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            3.64,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.0291),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 4: 洋葱 (用量:6.06g, 单价:0.0128/g, 出成率:95%, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '洋葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            6.06,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.012800),
            0.95,
            0,
            encrypt_cost(0.0817),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 洋葱';
    END IF;


    -- 原材料 5: 牛肉碎 (用量:30.0g, 单价:0.0975/g, 成本:2.93元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '牛肉碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.097500),
            1.0,
            0,
            encrypt_cost(2.9250),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 牛肉碎';
    END IF;


    -- 原材料 6: 口蘑 (用量:25.0g, 单价:0.0220/g, 成本:0.55元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '口蘑'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.022000),
            1.0,
            0,
            encrypt_cost(0.5500),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 口蘑';
    END IF;


    -- 原材料 7: 干巴菌 (用量:8.0g, 单价:0.2600/g, 成本:2.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            8.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.260000),
            1.0,
            0,
            encrypt_cost(2.0800),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干巴菌';
    END IF;


    -- 原材料 8: 宣威火腿 (用量:20.0g, 单价:0.0739/g, 出成率:90%, 成本:1.64元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '宣威火腿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.073900),
            0.9,
            0,
            encrypt_cost(1.6422),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 宣威火腿';
    END IF;


    -- 原材料 9: 螺丝椒 (用量:20.0g, 单价:0.0080/g, 出成率:90%, 成本:0.18元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '螺丝椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            0.9,
            0,
            encrypt_cost(0.1778),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 螺丝椒';
    END IF;


    -- 原材料 10: 黄天鹅无菌蛋 (用量:1.0g, 单价:1.8900/g, 成本:1.89元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄天鹅无菌蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(1.890000),
            1.0,
            0,
            encrypt_cost(1.8900),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄天鹅无菌蛋';
    END IF;


    -- 原材料 11: 大米 (用量:300.0g, 单价:0.0060/g, 成本:1.20元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大米'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            300.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006000),
            1.5,
            0,
            encrypt_cost(1.2000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-031-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-031-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鸡蛋 (用量:1.0g, 单价:0.5000/g, 成本:0.50元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.500000),
            1.0,
            0,
            encrypt_cost(0.5000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡蛋';
    END IF;


    -- 原材料 2: 糟辣椒 (用量:30.0g, 单价:0.0300/g, 成本:0.90元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糟辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030000),
            1.0,
            0,
            encrypt_cost(0.9000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糟辣椒';
    END IF;


    -- 原材料 3: 脆哨 (用量:10.0g, 单价:0.0540/g, 成本:0.54元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.054000),
            1.0,
            0,
            encrypt_cost(0.5400),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 4: 大米 (用量:300.0g, 单价:0.0060/g, 成本:1.20元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大米'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            300.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006000),
            1.5,
            0,
            encrypt_cost(1.2000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-032-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-032-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 茄子 (用量:200.0g, 单价:0.0036/g, 出成率:90%, 成本:0.80元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茄子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            200.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.003600),
            0.9,
            0,
            encrypt_cost(0.8000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茄子';
    END IF;


    -- 原材料 2: 盐 (用量:2.0g, 单价:0.0023/g, 成本:0.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.002300),
            1.0,
            0,
            encrypt_cost(0.0046),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 盐';
    END IF;


    -- 原材料 3: 鸡精 (用量:4.0g, 单价:0.0288/g, 成本:0.12元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            4.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.028800),
            1.0,
            0,
            encrypt_cost(0.1152),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 4: 味精 (用量:2.0g, 单价:0.0176/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.017600),
            1.0,
            0,
            encrypt_cost(0.0352),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 5: 白糖 (用量:1.0g, 单价:0.0080/g, 成本:0.01元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.0080),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 6: 贵州五香辣椒面 (用量:4.0g, 单价:0.0400/g, 成本:0.16元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            4.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(0.1600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 7: 糊辣椒 (用量:4.5g, 单价:0.0500/g, 成本:0.23元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            4.5,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.050000),
            1.0,
            0,
            encrypt_cost(0.2250),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 8: 大蒜 (用量:8.0g, 单价:0.0080/g, 成本:0.06元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            8.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.0640),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 9: 生抽 (用量:10.0g, 单价:0.0074/g, 成本:0.07元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007400),
            1.0,
            0,
            encrypt_cost(0.0740),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 10: 蚝油 (用量:6.0g, 单价:0.0067/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            6.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006700),
            1.0,
            0,
            encrypt_cost(0.0402),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


    -- 原材料 11: 藤椒油 (用量:2.0g, 单价:0.0460/g, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藤椒油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.046000),
            1.0,
            0,
            encrypt_cost(0.0920),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 藤椒油';
    END IF;


    -- 原材料 12: 黄心皮蛋 (用量:3.0g, 单价:1.6000/g, 成本:4.80元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄心皮蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(1.600000),
            1.0,
            0,
            encrypt_cost(4.8000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄心皮蛋';
    END IF;


    -- 原材料 13: 螺丝椒 (用量:40.0g, 单价:0.0080/g, 出成率:90%, 成本:0.36元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '螺丝椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            40.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            0.9,
            0,
            encrypt_cost(0.3556),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 螺丝椒';
    END IF;


    -- 原材料 14: 番茄 (用量:100.0g, 单价:0.0070/g, 出成率:95%, 成本:0.74元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            0.95,
            0,
            encrypt_cost(0.7368),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 15: 香菜 (用量:15.0g, 单价:0.0130/g, 出成率:90%, 成本:0.22元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            15,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.013000),
            0.9,
            0,
            encrypt_cost(0.2167),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香菜';
    END IF;


    -- 原材料 16: 小米辣 (用量:2.0g, 单价:0.0090/g, 出成率:95%, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            16,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.009000),
            0.95,
            0,
            encrypt_cost(0.0189),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小米辣';
    END IF;


    -- 原材料 17: 折耳根 (用量:25.0g, 单价:0.0100/g, 出成率:95%, 成本:0.26元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            17,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            0.95,
            0,
            encrypt_cost(0.2632),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 18: 脆哨 (用量:20.0g, 单价:0.0540/g, 成本:1.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            18,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.054000),
            1.0,
            0,
            encrypt_cost(1.0800),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-033-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-033-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鸡爪 (用量:150.0g, 单价:0.0480/g, 出成率:75%, 成本:9.60元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡爪'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.048000),
            0.75,
            0,
            encrypt_cost(9.6000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡爪';
    END IF;


    -- 原材料 2: 大蒜 (用量:45.0g, 单价:0.0080/g, 成本:0.36元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            45.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.3600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 3: 黄柠檬 (用量:40.0g, 单价:0.0130/g, 成本:0.52元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            40.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.013000),
            1.0,
            0,
            encrypt_cost(0.5200),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄柠檬';
    END IF;


    -- 原材料 4: 东古酱油 (用量:95.0g, 单价:0.0150/g, 成本:1.43元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '东古酱油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            95.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.015000),
            1.0,
            0,
            encrypt_cost(1.4250),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 东古酱油';
    END IF;


    -- 原材料 5: 陈醋 (用量:13.0g, 单价:0.0071/g, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '陈醋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            13.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007100),
            1.0,
            0,
            encrypt_cost(0.0923),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 陈醋';
    END IF;


    -- 原材料 6: 蚝油 (用量:12.0g, 单价:0.0067/g, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            12.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006700),
            1.0,
            0,
            encrypt_cost(0.0804),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


    -- 原材料 7: 白糖 (用量:5.0g, 单价:0.0080/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.0400),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 8: 红油 (用量:95.0g, 单价:0.0540/g, 出成率:95%, 成本:5.40元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            95.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.054000),
            0.95,
            0,
            encrypt_cost(5.4000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红油';
    END IF;


    -- 原材料 9: 泡野山椒 (用量:125.0g, 单价:0.0160/g, 成本:2.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡野山椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            125.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(2.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡野山椒';
    END IF;


    -- 原材料 10: 木姜子油 (用量:10.0g, 单价:0.0532/g, 成本:0.53元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.053200),
            1.0,
            0,
            encrypt_cost(0.5320),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 木姜子油';
    END IF;


    -- 原材料 11: 藤椒油 (用量:5.0g, 单价:0.0460/g, 成本:0.23元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藤椒油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.046000),
            1.0,
            0,
            encrypt_cost(0.2300),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 藤椒油';
    END IF;


    -- 原材料 12: 鲜花椒 (用量:20.0g, 单价:0.0200/g, 成本:0.40元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            1.0,
            0,
            encrypt_cost(0.4000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜花椒';
    END IF;


    -- 原材料 13: 家乐柠檬粉 (用量:14.29g, 单价:0.0425/g, 成本:0.61元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '家乐柠檬粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            14.29,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.042500),
            1.0,
            0,
            encrypt_cost(0.6073),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 家乐柠檬粉';
    END IF;


    -- 原材料 14: 水 (用量:35.71g, 单价:0.0000/g, 成本:0.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            35.71,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.000000),
            1.0,
            0,
            encrypt_cost(0.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


END $$;


-- 配方明细: 傣村手撕罗非鱼
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-034-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-034-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 新一代辣椒面 (用量:8.0g, 单价:0.0320/g, 成本:0.26元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新一代辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            8.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.032000),
            1.0,
            0,
            encrypt_cost(0.2560),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 新一代辣椒面';
    END IF;


    -- 原材料 2: 黄柠檬 (用量:15.0g, 单价:0.0130/g, 成本:0.19元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.013000),
            1.0,
            0,
            encrypt_cost(0.1950),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄柠檬';
    END IF;


    -- 原材料 3: 芭蕉叶 (用量:15.0g, 单价:0.0200/g, 出成率:90%, 成本:0.33元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.9,
            0,
            encrypt_cost(0.3333),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芭蕉叶';
    END IF;


    -- 原材料 4: 酸辣酱 (用量:100.0g, 单价:0.0156/g, 成本:1.56元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜蓉辣椒酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.015600),
            1.0,
            0,
            encrypt_cost(1.5600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜蓉辣椒酱';
    END IF;


    -- 原材料 5: 大香菜 (用量:13.33g, 单价:0.0260/g, 成本:0.35元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            13.33,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.026000),
            1.0,
            0,
            encrypt_cost(0.3466),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大香菜';
    END IF;


    -- 原材料 6: 香菜 (用量:13.33g, 单价:0.0130/g, 出成率:90%, 成本:0.19元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            13.33,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.013000),
            0.9,
            0,
            encrypt_cost(0.1925),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香菜';
    END IF;


    -- 原材料 7: 茴香苗 (用量:13.33g, 单价:0.0180/g, 出成率:90%, 成本:0.27元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茴香苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            13.33,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.018000),
            0.9,
            0,
            encrypt_cost(0.2666),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茴香苗';
    END IF;


    -- 原材料 8: 罗非鱼 (用量:1.0g, 单价:17.0000/g, 成本:17.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '罗非鱼'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(17.000000),
            1.0,
            0,
            encrypt_cost(17.0000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-035-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-035-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 青笋 (用量:30.0g, 单价:0.0040/g, 出成率:90%, 成本:0.13元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '青笋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.004000),
            0.9,
            0,
            encrypt_cost(0.1333),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 青笋';
    END IF;


    -- 原材料 2: 绿豆芽 (用量:30.0g, 单价:0.0030/g, 出成率:95%, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '绿豆芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.003000),
            0.95,
            0,
            encrypt_cost(0.0947),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 绿豆芽';
    END IF;


    -- 原材料 3: 海带丝 (用量:30.0g, 单价:0.0160/g, 成本:0.48元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '海带丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.4800),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 海带丝';
    END IF;


    -- 原材料 4: 泡萝卜 (用量:30.0g, 单价:0.0080/g, 出成率:95%, 成本:0.25元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡萝卜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            0.95,
            0,
            encrypt_cost(0.2526),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡萝卜';
    END IF;


    -- 原材料 5: 黄瓜 (用量:30.0g, 单价:0.0080/g, 出成率:90%, 成本:0.27元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄瓜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            0.9,
            0,
            encrypt_cost(0.2667),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄瓜';
    END IF;


    -- 原材料 6: 折耳根 (用量:30.0g, 单价:0.0100/g, 出成率:95%, 成本:0.32元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            0.95,
            0,
            encrypt_cost(0.3158),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 7: 土豆 (用量:30.0g, 单价:0.0026/g, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.002600),
            1.0,
            0,
            encrypt_cost(0.0780),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 土豆';
    END IF;


    -- 原材料 8: 脆哨 (用量:25.0g, 单价:0.0540/g, 成本:1.35元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.054000),
            1.0,
            0,
            encrypt_cost(1.3500),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 9: 凉面 (用量:30.0g, 单价:0.0060/g, 成本:0.18元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '凉面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006000),
            1.0,
            0,
            encrypt_cost(0.1800),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 凉面';
    END IF;


    -- 原材料 10: 春卷皮 (用量:12.0g, 单价:0.2000/g, 成本:2.40元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '春卷皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            12.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.200000),
            1.0,
            0,
            encrypt_cost(2.4000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 春卷皮';
    END IF;


    -- 原材料 11: 芥末 (用量:0.5g, 单价:0.1279/g, 成本:0.06元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芥末'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0.5,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.127900),
            1.0,
            0,
            encrypt_cost(0.0640),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芥末';
    END IF;


    -- 原材料 12: 糊辣椒 (用量:4.0g, 单价:0.0500/g, 成本:0.20元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            4.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.050000),
            1.0,
            0,
            encrypt_cost(0.2000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 13: 贵州五香辣椒面 (用量:4.0g, 单价:0.0400/g, 成本:0.16元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            4.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(0.1600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 14: 老凯里非遗酸汤 (用量:160.0g, 单价:0.0375/g, 成本:6.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '酸汤底料'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            160.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.037500),
            1.0,
            0,
            encrypt_cost(6.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 酸汤底料';
    END IF;


    -- 原材料 15: 小葱 (用量:2.0g, 单价:0.0076/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            15,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007600),
            1.0,
            0,
            encrypt_cost(0.0152),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小葱';
    END IF;


END $$;


-- 配方明细: 苗侗空气丸子
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-036-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-036-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 折耳根 (用量:10.78g, 单价:0.0100/g, 出成率:95%, 成本:0.11元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            10.78,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            0.95,
            0,
            encrypt_cost(0.1135),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 2: 小葱 (用量:3.23g, 单价:0.0076/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            3.23,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007600),
            1.0,
            0,
            encrypt_cost(0.0245),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小葱';
    END IF;


    -- 原材料 3: 香菜 (用量:3.23g, 单价:0.0130/g, 出成率:90%, 成本:0.05元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            3.23,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.013000),
            0.9,
            0,
            encrypt_cost(0.0467),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香菜';
    END IF;


    -- 原材料 4: 泡萝卜 (用量:10.78g, 单价:0.0080/g, 出成率:95%, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡萝卜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            10.78,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            0.95,
            0,
            encrypt_cost(0.0908),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡萝卜';
    END IF;


    -- 原材料 5: 大香菜 (用量:3.23g, 单价:0.0260/g, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            3.23,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.026000),
            1.0,
            0,
            encrypt_cost(0.0840),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大香菜';
    END IF;


    -- 原材料 6: 糊辣椒 (用量:2.16g, 单价:0.0500/g, 成本:0.11元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            2.16,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.050000),
            1.0,
            0,
            encrypt_cost(0.1080),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糊辣椒';
    END IF;


    -- 原材料 7: 贵州五香辣椒面 (用量:1.13g, 单价:0.0400/g, 成本:0.05元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            1.13,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(0.0452),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 8: 花椒粉 (用量:0.05g, 单价:0.1200/g, 成本:0.01元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花椒粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            0.05,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.120000),
            1.0,
            0,
            encrypt_cost(0.0060),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花椒粉';
    END IF;


    -- 原材料 9: 生抽 (用量:4.31g, 单价:0.0074/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            4.31,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007400),
            1.0,
            0,
            encrypt_cost(0.0319),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 10: 鸡精 (用量:0.86g, 单价:0.0288/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            0.86,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.028800),
            1.0,
            0,
            encrypt_cost(0.0248),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 11: 味精 (用量:0.22g, 单价:0.0176/g, 成本:0.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            0.22,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.017600),
            1.0,
            0,
            encrypt_cost(0.0039),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 12: 脆哨 (用量:5.0g, 单价:0.0540/g, 成本:0.27元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.054000),
            1.0,
            0,
            encrypt_cost(0.2700),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 13: 帕玛森干酪 (用量:5.0g, 单价:0.1380/g, 成本:0.69元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '帕玛森干酪'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.138000),
            1.0,
            0,
            encrypt_cost(0.6900),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 帕玛森干酪';
    END IF;


    -- 原材料 14: 豆腐圆子 (用量:200.0g, 单价:0.0300/g, 出成率:90%, 成本:6.67元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豆腐圆子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            200.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030000),
            0.9,
            0,
            encrypt_cost(6.6667),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 豆腐圆子';
    END IF;


END $$;


-- 配方明细: 雪顶冰淇淋玉米粑
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-037-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-037-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 甜玉糊 (用量:160.0g, 单价:0.0046/g, 出成率:70%, 成本:1.05元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '甜玉米'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            160.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.004600),
            0.7,
            0,
            encrypt_cost(1.0514),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 甜玉米';
    END IF;


    -- 原材料 2: 帕玛森干酪 (用量:5.0g, 单价:0.1380/g, 成本:0.69元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '帕玛森干酪'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.138000),
            1.0,
            0,
            encrypt_cost(0.6900),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 帕玛森干酪';
    END IF;


    -- 原材料 3: 香草冰淇淋 (用量:80.0g, 单价:0.0329/g, 成本:2.63元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香草冰淇淋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            80.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.032900),
            1.0,
            0,
            encrypt_cost(2.6320),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 香草冰淇淋';
    END IF;


    -- 原材料 4: 碧根果碎 (用量:15.0g, 单价:0.0600/g, 成本:0.90元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '碧根果碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.060000),
            1.0,
            0,
            encrypt_cost(0.9000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-038-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-038-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 野菜卷（成品） (用量:6.0g, 单价:0.8500/g, 成本:5.10元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '野菜卷'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            6.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.850000),
            1.0,
            0,
            encrypt_cost(5.1000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 野菜卷';
    END IF;


END $$;


-- 配方明细: 山玫瑰炸乳扇
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-039-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-039-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 玫瑰乳扇 (用量:25.0g, 单价:0.1100/g, 成本:2.75元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '乳扇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.110000),
            1.0,
            0,
            encrypt_cost(2.7500),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 乳扇';
    END IF;


    -- 原材料 2: 玫瑰酱 (用量:40.0g, 单价:0.0129/g, 成本:0.52元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '玫瑰酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            40.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.012900),
            1.0,
            0,
            encrypt_cost(0.5160),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 玫瑰酱';
    END IF;


    -- 原材料 3: 干玫瑰花 (用量:0.5g, 单价:0.1500/g, 成本:0.07元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干玫瑰花'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            0.5,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.150000),
            1.0,
            0,
            encrypt_cost(0.0750),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干玫瑰花';
    END IF;


END $$;


-- 配方明细: 怪噜洋芋
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-040-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-040-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 土豆 (用量:300.0g, 单价:0.0026/g, 成本:0.78元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            300.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.002600),
            1.0,
            0,
            encrypt_cost(0.7800),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 土豆';
    END IF;


    -- 原材料 2: 贵州五香辣椒面 (用量:5.0g, 单价:0.0400/g, 成本:0.20元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(0.2000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 贵州五香辣椒面';
    END IF;


    -- 原材料 3: 折耳根 (用量:15.0g, 单价:0.0100/g, 出成率:95%, 成本:0.16元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            0.95,
            0,
            encrypt_cost(0.1579),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 折耳根';
    END IF;


    -- 原材料 4: 泡萝卜 (用量:10.0g, 单价:0.0080/g, 出成率:95%, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡萝卜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            0.95,
            0,
            encrypt_cost(0.0842),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 泡萝卜';
    END IF;


    -- 原材料 5: 蒜蓉辣椒酱 (用量:6.05g, 单价:0.0156/g, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜蓉辣椒酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            6.05,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.015600),
            1.0,
            0,
            encrypt_cost(0.0944),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜蓉辣椒酱';
    END IF;


    -- 原材料 6: 番茄 (用量:30.27g, 单价:0.0070/g, 出成率:95%, 成本:0.22元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            30.27,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            0.95,
            0,
            encrypt_cost(0.2230),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 7: 大蒜 (用量:4.54g, 单价:0.0080/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            4.54,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.0363),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 8: 姜 (用量:1.82g, 单价:0.0100/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            1.82,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            1.0,
            0,
            encrypt_cost(0.0182),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 9: 黄灯笼辣椒酱 (用量:3.03g, 单价:0.0143/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄灯笼辣椒酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            3.03,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014300),
            1.0,
            0,
            encrypt_cost(0.0433),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄灯笼辣椒酱';
    END IF;


    -- 原材料 10: 色拉油 (用量:9.46g, 单价:0.0102/g, 成本:0.10元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '色拉油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            9.46,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010200),
            1.0,
            0,
            encrypt_cost(0.0965),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 色拉油';
    END IF;


    -- 原材料 11: 猪肉沫 (用量:37.84g, 单价:0.0210/g, 成本:0.79元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪肉沫'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            37.84,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.021000),
            1.0,
            0,
            encrypt_cost(0.7946),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 猪肉沫';
    END IF;


    -- 原材料 12: 油炸折耳根 (用量:5.0g, 单价:0.0600/g, 成本:0.30元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '油炸折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.060000),
            1.0,
            0,
            encrypt_cost(0.3000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 油炸折耳根';
    END IF;


END $$;


-- 配方明细: 紫苏桃子
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-041-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-041-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 水蜜桃 (用量:150.0g, 单价:0.0500/g, 出成率:90%, 成本:8.33元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水蜜桃'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.050000),
            0.9,
            0,
            encrypt_cost(8.3333),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水蜜桃';
    END IF;


    -- 原材料 2: 荔枝 (用量:3.0g, 单价:0.3000/g, 成本:0.90元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '荔枝'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.300000),
            1.0,
            0,
            encrypt_cost(0.9000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 荔枝';
    END IF;


    -- 原材料 3: 紫苏叶 (用量:33.33g, 单价:0.0160/g, 成本:0.53元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            33.33,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.5333),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏叶';
    END IF;


    -- 原材料 4: 水 (用量:166.67g, 单价:0.0000/g, 成本:0.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            166.67,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.000000),
            1.0,
            0,
            encrypt_cost(0.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


    -- 原材料 5: 白糖 (用量:33.33g, 单价:0.0080/g, 成本:0.27元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            33.33,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.2666),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 白糖';
    END IF;


    -- 原材料 6: 苹果醋 (用量:33.33g, 单价:0.0200/g, 成本:0.67元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '苹果醋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            33.33,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            1.0,
            0,
            encrypt_cost(0.6666),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 苹果醋';
    END IF;


    -- 原材料 7: 仔姜 (用量:15.0g, 单价:0.0140/g, 成本:0.21元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '仔姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.2100),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 仔姜';
    END IF;


    -- 原材料 8: 紫苏叶 (用量:8.33g, 单价:0.0160/g, 成本:0.13元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            8.33,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.016000),
            1.0,
            0,
            encrypt_cost(0.1333),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫苏叶';
    END IF;


END $$;


-- 配方明细: 铁棍山药面
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-042-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-042-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 铁棍山药面 (用量:125.0g, 单价:0.0190/g, 出成率:90%, 成本:2.64元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '铁棍山药面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            125.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.019000),
            0.9,
            0,
            encrypt_cost(2.6389),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-043-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-043-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 带皮牛肉 (用量:150.0g, 单价:0.0747/g, 成本:11.21元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '带皮牛肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.074700),
            1.0,
            0,
            encrypt_cost(11.2050),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 带皮牛肉';
    END IF;


    -- 原材料 2: 粽叶 (用量:1.0g, 单价:0.1000/g, 成本:0.10元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '粽叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.100000),
            1.0,
            0,
            encrypt_cost(0.1000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-044-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-044-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 花胶 (用量:120.0g, 单价:0.0867/g, 出成率:90%, 成本:11.56元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花胶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.086700),
            0.9,
            0,
            encrypt_cost(11.5600),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花胶';
    END IF;


    -- 原材料 2: 红枫叶 (用量:1.0g, 单价:0.3889/g, 成本:0.39元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红枫叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.388900),
            1.0,
            0,
            encrypt_cost(0.3889),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-045-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-045-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 豌豆尖 (用量:120.0g, 单价:0.0200/g, 出成率:70%, 成本:3.43元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豌豆尖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.7,
            0,
            encrypt_cost(3.4286),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-046-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-046-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 薄荷 (用量:80.0g, 单价:0.0180/g, 出成率:85%, 成本:1.69元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薄荷'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            80.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.018000),
            0.85,
            0,
            encrypt_cost(1.6941),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-047-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-047-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 脆三丁 (用量:100.0g, 单价:0.0700/g, 成本:7.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆三丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.070000),
            1.0,
            0,
            encrypt_cost(7.0000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-048-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-048-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 花生芽 (用量:150.0g, 单价:0.0196/g, 出成率:95%, 成本:3.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花生芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.019600),
            0.95,
            0,
            encrypt_cost(3.0947),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-049-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-049-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 美肥 (用量:120.0g, 单价:0.0900/g, 出成率:85%, 成本:12.71元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '美肥'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            120.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.090000),
            0.85,
            0,
            encrypt_cost(12.7059),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 美肥';
    END IF;


    -- 原材料 2: 粽叶 (用量:1.0g, 单价:0.1000/g, 成本:0.10元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '粽叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.100000),
            1.0,
            0,
            encrypt_cost(0.1000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-050-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-050-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 龙须菜 (用量:150.0g, 单价:0.0220/g, 出成率:65%, 成本:5.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '龙须菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.022000),
            0.65,
            0,
            encrypt_cost(5.0769),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-051-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-051-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 茼蒿 (用量:150.0g, 单价:0.0120/g, 出成率:60%, 成本:3.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茼蒿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.012000),
            0.6,
            0,
            encrypt_cost(3.0000),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-052-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-052-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 人参苗 (用量:150.0g, 单价:0.0200/g, 出成率:85%, 成本:3.53元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '人参苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            150.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.85,
            0,
            encrypt_cost(3.5294),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-053-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-053-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 紫白菜 (用量:100.0g, 单价:0.0240/g, 出成率:66%, 成本:3.64元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫白菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            0.66,
            0,
            encrypt_cost(3.6364),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 紫白菜';
    END IF;


    -- 原材料 2: 龙须菜 (用量:100.0g, 单价:0.0220/g, 出成率:65%, 成本:3.38元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '龙须菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.022000),
            0.65,
            0,
            encrypt_cost(3.3846),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 龙须菜';
    END IF;


    -- 原材料 3: 茼蒿 (用量:100.0g, 单价:0.0120/g, 出成率:60%, 成本:2.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茼蒿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.012000),
            0.6,
            0,
            encrypt_cost(2.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茼蒿';
    END IF;


    -- 原材料 4: 人参苗 (用量:50.0g, 单价:0.0200/g, 出成率:85%, 成本:1.18元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '人参苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.85,
            0,
            encrypt_cost(1.1765),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 人参苗';
    END IF;


    -- 原材料 5: 薄荷 (用量:30.0g, 单价:0.0180/g, 出成率:85%, 成本:0.64元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薄荷'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.018000),
            0.85,
            0,
            encrypt_cost(0.6353),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 薄荷';
    END IF;


    -- 原材料 6: 血皮菜 (用量:50.0g, 单价:0.0100/g, 出成率:90%, 成本:0.56元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '血皮菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            0.9,
            0,
            encrypt_cost(0.5556),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-054-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-054-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 三黄鸡 (用量:386.0g, 单价:0.0240/g, 出成率:95%, 成本:9.75元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            386.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            0.95,
            0,
            encrypt_cost(9.7516),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡肉';
    END IF;


    -- 原材料 2: 菜籽油 (用量:171.0g, 单价:0.0144/g, 成本:2.46元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菜籽油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            171.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014400),
            1.0,
            0,
            encrypt_cost(2.4624),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 菜籽油';
    END IF;


    -- 原材料 3: 姜 (用量:8.6g, 单价:0.0100/g, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            8.6,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            1.0,
            0,
            encrypt_cost(0.0860),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 4: 大蒜 (用量:100.0g, 单价:0.0080/g, 成本:0.80元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            100.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.8000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 5: 干花椒 (用量:10.0g, 单价:0.1100/g, 出成率:90%, 成本:1.22元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.110000),
            0.9,
            0,
            encrypt_cost(1.2222),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 干花椒';
    END IF;


    -- 原材料 6: 糍粑辣椒 (用量:143.0g, 单价:0.0300/g, 成本:4.29元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糍粑辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            143.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030000),
            1.0,
            0,
            encrypt_cost(4.2900),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 糍粑辣椒';
    END IF;


    -- 原材料 7: 郫县豆瓣 (用量:3.6g, 单价:0.0080/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '郫县豆瓣'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            3.6,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.0288),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 郫县豆瓣';
    END IF;


    -- 原材料 8: 啤酒 (用量:43.0g, 单价:0.0095/g, 成本:0.41元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雪花纯生'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            43.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.009500),
            1.0,
            0,
            encrypt_cost(0.4085),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 雪花纯生';
    END IF;


    -- 原材料 9: 生抽 (用量:2.1g, 单价:0.0074/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            2.1,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007400),
            1.0,
            0,
            encrypt_cost(0.0155),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 10: 味精 (用量:1.4g, 单价:0.0176/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            1.4,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.017600),
            1.0,
            0,
            encrypt_cost(0.0246),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 11: 鸡精 (用量:2.86g, 单价:0.0288/g, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            2.86,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.028800),
            1.0,
            0,
            encrypt_cost(0.0824),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 12: 白糖 (用量:0.7g, 单价:0.0080/g, 成本:0.01元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            0.7,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.0056),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-055-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-055-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 鲈鱼 (用量:500.0g, 单价:0.0320/g, 成本:16.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲈鱼'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            500.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.032000),
            1.0,
            0,
            encrypt_cost(16.0000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲈鱼';
    END IF;


    -- 原材料 2: 红枫叶 (用量:1.0g, 单价:0.3889/g, 成本:0.39元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红枫叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.388900),
            1.0,
            0,
            encrypt_cost(0.3889),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 红枫叶';
    END IF;


    -- 原材料 3: 小青柠 (用量:15.0g, 单价:0.0260/g, 成本:0.39元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小青柠'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.026000),
            1.0,
            0,
            encrypt_cost(0.3900),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-056-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-056-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 五花肉 (用量:300.0g, 单价:0.0320/g, 出成率:80%, 成本:12.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五花肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            300.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.032000),
            0.8,
            0,
            encrypt_cost(12.0000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 五花肉';
    END IF;


    -- 原材料 2: 味精 (用量:1.5g, 单价:0.0176/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            1.5,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.017600),
            1.0,
            0,
            encrypt_cost(0.0264),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 3: 鸡精 (用量:3.0g, 单价:0.0288/g, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.028800),
            1.0,
            0,
            encrypt_cost(0.0864),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 4: 耗油 (用量:5.0g, 单价:0.0067/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006700),
            1.0,
            0,
            encrypt_cost(0.0335),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蚝油';
    END IF;


    -- 原材料 5: 生抽 (用量:2.0g, 单价:0.0074/g, 成本:0.01元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007400),
            1.0,
            0,
            encrypt_cost(0.0148),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生抽';
    END IF;


    -- 原材料 6: 草果粉 (用量:1.0g, 单价:0.0840/g, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '草果粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.084000),
            1.0,
            0,
            encrypt_cost(0.0840),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 草果粉';
    END IF;


    -- 原材料 7: 花椒粉 (用量:0.5g, 单价:0.1200/g, 成本:0.06元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花椒粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            0.5,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.120000),
            1.0,
            0,
            encrypt_cost(0.0600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 花椒粉';
    END IF;


    -- 原材料 8: 新一代辣椒面 (用量:3.0g, 单价:0.0320/g, 成本:0.10元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新一代辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.032000),
            1.0,
            0,
            encrypt_cost(0.0960),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 新一代辣椒面';
    END IF;


    -- 原材料 9: 生粉 (用量:8.0g, 单价:0.0110/g, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            8.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.011000),
            1.0,
            0,
            encrypt_cost(0.0880),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 生粉';
    END IF;


    -- 原材料 10: 薄荷 (用量:70.0g, 单价:0.0180/g, 出成率:85%, 成本:1.48元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薄荷'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            70.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.018000),
            0.85,
            0,
            encrypt_cost(1.4824),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 薄荷';
    END IF;


    -- 原材料 11: 脆三丁 (用量:45.0g, 单价:0.0700/g, 成本:3.15元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆三丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            45.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.070000),
            1.0,
            0,
            encrypt_cost(3.1500),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆三丁';
    END IF;


    -- 原材料 12: 新一代辣椒 (用量:10.0g, 单价:0.0360/g, 出成率:90%, 成本:0.40元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新一代辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.036000),
            0.9,
            0,
            encrypt_cost(0.4000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 新一代辣椒';
    END IF;


    -- 原材料 13: 毕节皱皮椒 (用量:30.0g, 单价:0.0492/g, 出成率:90%, 成本:1.64元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '毕节皱皮椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            13,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.049200),
            0.9,
            0,
            encrypt_cost(1.6400),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 毕节皱皮椒';
    END IF;


    -- 原材料 14: 芝麻 (用量:1.0g, 单价:0.0300/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芝麻'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            14,
            1.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.030000),
            1.0,
            0,
            encrypt_cost(0.0300),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 芝麻';
    END IF;


    -- 原材料 15: 姜 (用量:15.0g, 单价:0.0100/g, 成本:0.15元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            15,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            1.0,
            0,
            encrypt_cost(0.1500),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


    -- 原材料 16: 大蒜 (用量:25.0g, 单价:0.0080/g, 成本:0.20元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            16,
            25.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.008000),
            1.0,
            0,
            encrypt_cost(0.2000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 大蒜';
    END IF;


    -- 原材料 17: 贵州五香辣椒面 (用量:2.0g, 单价:0.0400/g, 成本:0.08元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            17,
            2.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.040000),
            1.0,
            0,
            encrypt_cost(0.0800),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-057-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-057-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 黄辣丁 (用量:500.0g, 单价:17.0000/g, 成本:8500.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '罗非鱼'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            500.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(17.000000),
            1.0,
            0,
            encrypt_cost(8500.0000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 罗非鱼';
    END IF;


END $$;


-- 配方明细: 紫白菜
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-058-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-058-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 紫白菜 (用量:180.0g, 单价:0.0240/g, 出成率:66%, 成本:6.55元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫白菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            180.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            0.66,
            0,
            encrypt_cost(6.5455),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-059-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-059-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 黄苦菊 (用量:130.0g, 单价:0.0240/g, 出成率:70%, 成本:4.46元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄苦菊'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            130.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            0.7,
            0,
            encrypt_cost(4.4571),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-060-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-060-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 豆米底料 (用量:200.0g, 单价:0.0240/g, 成本:4.80元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豆米底料'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            200.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.024000),
            1.0,
            0,
            encrypt_cost(4.8000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 豆米底料';
    END IF;


    -- 原材料 2: 米饭 (用量:250.0g, 单价:0.0027/g, 成本:0.68元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '米饭'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            250.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.002700),
            1.0,
            0,
            encrypt_cost(0.6750),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 米饭';
    END IF;


    -- 原材料 3: 鸡蛋 (用量:50.0g, 单价:0.5000/g, 成本:25.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.500000),
            1.0,
            0,
            encrypt_cost(25.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡蛋';
    END IF;


    -- 原材料 4: 茼蒿 (用量:50.0g, 单价:0.0120/g, 出成率:60%, 成本:1.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '茼蒿'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.012000),
            0.6,
            0,
            encrypt_cost(1.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 茼蒿';
    END IF;


    -- 原材料 5: 球盖菇 (用量:50.0g, 单价:0.0200/g, 出成率:95%, 成本:1.05元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '球盖菇'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            0.95,
            0,
            encrypt_cost(1.0526),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 球盖菇';
    END IF;


    -- 原材料 6: 脆哨 (用量:10.0g, 单价:0.0540/g, 成本:0.54元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.054000),
            1.0,
            0,
            encrypt_cost(0.5400),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 脆哨';
    END IF;


    -- 原材料 7: 蒜苗 (用量:15.0g, 单价:0.0140/g, 成本:0.21元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            15.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.2100),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜苗';
    END IF;


    -- 原材料 8: 番茄 (用量:40.0g, 单价:0.0070/g, 出成率:95%, 成本:0.29元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            40.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            0.95,
            0,
            encrypt_cost(0.2947),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 9: 烟熏腊肉 (用量:30.0g, 单价:0.0330/g, 成本:0.99元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '烟熏腊肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.033000),
            1.0,
            0,
            encrypt_cost(0.9900),
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
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-061-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-061-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 定西土豆粉 (用量:105.0g, 单价:0.0132/g, 成本:0.48元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '定西土豆粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            105.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.013200),
            2.9,
            0,
            encrypt_cost(0.4779),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 定西土豆粉';
    END IF;


END $$;


-- 配方明细: 黑松露和牛开口笑
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-062-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-062-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 和牛肉糜 (用量:110.0g, 单价:0.0610/g, 成本:6.71元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '和牛肉糜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            110.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.061000),
            1.0,
            0,
            encrypt_cost(6.7100),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 和牛肉糜';
    END IF;


    -- 原材料 2: 黑松露酱 (用量:5.0g, 单价:0.2500/g, 成本:1.25元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑松露酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.250000),
            1.0,
            0,
            encrypt_cost(1.2500),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黑松露酱';
    END IF;


    -- 原材料 3: 饺子皮 (用量:60.0g, 单价:0.0060/g, 成本:0.36元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '饺子皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            60.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.006000),
            1.0,
            0,
            encrypt_cost(0.3600),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 饺子皮';
    END IF;


END $$;


-- 配方明细: 老凯里非遗酸汤
DO $$
DECLARE
    v_recipe_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT recipe_id INTO v_recipe_id FROM recipe WHERE recipe_code = 'RCP-063-v1';

    IF v_recipe_id IS NULL THEN
        RAISE NOTICE '配方不存在: RCP-063-v1';
        RETURN;
    END IF;

    DELETE FROM recipe_item WHERE recipe_id = v_recipe_id;


    -- 原材料 1: 酸汤底料 (用量:320.0g, 单价:0.0375/g, 成本:12.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '酸汤底料'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            1,
            320.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.037500),
            1.0,
            0,
            encrypt_cost(12.0000),
            TRUE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 酸汤底料';
    END IF;


    -- 原材料 2: 水 (用量:2000.0g, 单价:0.0000/g, 成本:0.00元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            2,
            2000.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.000000),
            1.0,
            0,
            encrypt_cost(0.0000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 水';
    END IF;


    -- 原材料 3: 鸡精 (用量:20.0g, 单价:0.0288/g, 成本:0.58元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            3,
            20.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.028800),
            1.0,
            0,
            encrypt_cost(0.5760),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鸡精';
    END IF;


    -- 原材料 4: 味精 (用量:5.0g, 单价:0.0176/g, 成本:0.09元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            4,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.017600),
            1.0,
            0,
            encrypt_cost(0.0880),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 味精';
    END IF;


    -- 原材料 5: 猪油 (用量:50.0g, 单价:0.0120/g, 成本:0.60元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪油'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            5,
            50.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.012000),
            1.0,
            0,
            encrypt_cost(0.6000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 猪油';
    END IF;


    -- 原材料 6: 鲜花椒 (用量:5.0g, 单价:0.0200/g, 成本:0.10元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            6,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.020000),
            1.0,
            0,
            encrypt_cost(0.1000),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 鲜花椒';
    END IF;


    -- 原材料 7: 木姜子 (用量:5.0g, 单价:0.0360/g, 成本:0.18元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            7,
            5.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.036000),
            1.0,
            0,
            encrypt_cost(0.1800),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 木姜子';
    END IF;


    -- 原材料 8: 番茄 (用量:30.0g, 单价:0.0070/g, 出成率:95%, 成本:0.22元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            8,
            30.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007000),
            0.95,
            0,
            encrypt_cost(0.2211),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 番茄';
    END IF;


    -- 原材料 9: 黄豆芽 (用量:10.0g, 单价:0.0030/g, 出成率:95%, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄豆芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            9,
            10.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.003000),
            0.95,
            0,
            encrypt_cost(0.0316),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 黄豆芽';
    END IF;


    -- 原材料 10: 蒜苗 (用量:3.0g, 单价:0.0140/g, 成本:0.04元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            10,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.014000),
            1.0,
            0,
            encrypt_cost(0.0420),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 蒜苗';
    END IF;


    -- 原材料 11: 小葱 (用量:3.0g, 单价:0.0076/g, 成本:0.02元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            11,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.007600),
            1.0,
            0,
            encrypt_cost(0.0228),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 小葱';
    END IF;


    -- 原材料 12: 姜 (用量:3.0g, 单价:0.0100/g, 成本:0.03元)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    IF v_ingredient_id IS NOT NULL THEN
        INSERT INTO recipe_item (
            recipe_id, ingredient_id, ingredient_type, usage_sequence,
            quantity, unit_id, unit_price_encrypted,
            usage_yield_rate, waste_rate, subtotal_cost_encrypted,
            is_main_ingredient
        ) VALUES (
            v_recipe_id,
            v_ingredient_id,
            'raw_material',
            12,
            3.0,
            (SELECT unit_id FROM unit_of_measure WHERE unit_code = 'g'),
            encrypt_cost(0.010000),
            1.0,
            0,
            encrypt_cost(0.0300),
            FALSE
        );
    ELSE
        RAISE NOTICE '原材料未找到: 姜';
    END IF;


END $$;


-- ============================================================================
-- 4. 数据验证
-- ============================================================================
-- SELECT
--     p.product_code,
--     p.product_name,
--     r.recipe_code,
--     COUNT(ri.recipe_item_id) AS ingredient_count,
--     ROUND(SUM(decrypt_cost(ri.subtotal_cost_encrypted))::NUMERIC, 2) AS calculated_cost,
--     ROUND(decrypt_cost(p.current_cost_encrypted)::NUMERIC, 2) AS product_cost
-- FROM product p
-- LEFT JOIN recipe r ON p.product_id = r.product_id AND r.is_current = TRUE
-- LEFT JOIN recipe_item ri ON r.recipe_id = ri.recipe_id
-- WHERE p.product_type = 'finished'
-- GROUP BY p.product_id, p.product_code, p.product_name, r.recipe_code, p.current_cost_encrypted
-- ORDER BY p.product_code;

-- ============================================================================
-- 脚本完成
-- ============================================================================
