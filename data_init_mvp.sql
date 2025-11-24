-- ============================================================================
-- 野百灵餐饮集团 - 初始数据
-- ============================================================================
-- 版本: v1.0.0-mvp
-- 包含: 计量单位 + 单位换算规则 + 品类预置
-- ============================================================================

-- 设置加密密钥(临时,实际使用时从配置文件读取)
SET app.encryption_key = 'ybl-restaurant-encryption-key-2025';

-- ----------------------------------------------------------------------------
-- 1. 计量单位预置
-- ----------------------------------------------------------------------------
-- 三类单位分类说明:
--   base    = 基础单位 (用于成本核算、库存管理)
--   package = 包装单位 (用于采购、收货)
--   usage   = 使用单位 (用于厨房配方、出品)
-- 换算链路: package → base → usage
-- ----------------------------------------------------------------------------
INSERT INTO unit_of_measure (unit_code, unit_name, unit_name_en, unit_type, unit_category, is_base_unit, symbol) VALUES
-- ============================================
-- 基础单位 Base Unit (成本核算核心)
-- ============================================
-- 重量基础单位
('g', '克', 'gram', 'weight', 'base', TRUE, 'g'),
('kg', '千克', 'kilogram', 'weight', 'base', FALSE, 'kg'),
('jin', '斤', 'jin', 'weight', 'base', FALSE, '斤'),
('liang', '两', 'liang', 'weight', 'base', FALSE, '两'),
('mg', '毫克', 'milligram', 'weight', 'base', FALSE, 'mg'),
('ton', '吨', 'ton', 'weight', 'base', FALSE, 't'),

-- 体积基础单位
('ml', '毫升', 'milliliter', 'volume', 'base', TRUE, 'ml'),
('l', '升', 'liter', 'volume', 'base', FALSE, 'L'),
('gal', '加仑', 'gallon', 'volume', 'base', FALSE, 'gal'),

-- 计数基础单位
('piece', '个', 'piece', 'count', 'base', TRUE, '个'),
('pack', '包', 'pack', 'count', 'base', FALSE, '包'),

-- ============================================
-- 包装单位 Package Unit (采购收货)
-- ============================================
('case', '件', 'case', 'count', 'package', FALSE, '件'),
('box', '箱/盒', 'box', 'count', 'package', FALSE, '箱'),
('bag', '袋', 'bag', 'count', 'package', FALSE, '袋'),
('bucket', '桶', 'bucket', 'count', 'package', FALSE, '桶'),
('bottle', '瓶', 'bottle', 'count', 'package', FALSE, '瓶'),
('can', '罐', 'can', 'count', 'package', FALSE, '罐'),
('roll', '卷', 'roll', 'count', 'package', FALSE, '卷'),

-- ============================================
-- 使用单位 Usage Unit (厨房配方/出品)
-- ============================================
('serving', '份', 'serving', 'count', 'usage', FALSE, '份'),
('spoon', '勺', 'spoon', 'count', 'usage', FALSE, '勺'),
('cup', '杯', 'cup', 'volume', 'usage', FALSE, '杯'),
('scoop', '球', 'scoop', 'count', 'usage', FALSE, '球')
ON CONFLICT (unit_code) DO NOTHING;

-- ----------------------------------------------------------------------------
-- 2. 单位换算规则(通用)
-- ----------------------------------------------------------------------------
INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor, product_id) VALUES
-- 重量换算
((SELECT unit_id FROM unit_of_measure WHERE unit_code='kg'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='g'), 1000.0, NULL),
((SELECT unit_id FROM unit_of_measure WHERE unit_code='jin'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='g'), 500.0, NULL),
((SELECT unit_id FROM unit_of_measure WHERE unit_code='liang'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='g'), 50.0, NULL),
((SELECT unit_id FROM unit_of_measure WHERE unit_code='g'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='mg'), 1000.0, NULL),
((SELECT unit_id FROM unit_of_measure WHERE unit_code='ton'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='kg'), 1000.0, NULL),

-- 体积换算
((SELECT unit_id FROM unit_of_measure WHERE unit_code='l'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='ml'), 1000.0, NULL),
((SELECT unit_id FROM unit_of_measure WHERE unit_code='gal'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='ml'), 3785.4, NULL)
ON CONFLICT DO NOTHING;

-- ----------------------------------------------------------------------------
-- 3. 产品品类预置
-- ----------------------------------------------------------------------------
INSERT INTO product_category (category_code, category_name, parent_category_id, level, path, sort_order) VALUES
('CAT-MEAT', '肉类', NULL, 1, '/1/', 1),
('CAT-VEG', '蔬菜类', NULL, 1, '/2/', 2),
('CAT-SEASONING', '调料类', NULL, 1, '/3/', 3),
('CAT-OIL', '油类', NULL, 1, '/4/', 4),
('CAT-SEMI', '半成品', NULL, 1, '/5/', 5),
('CAT-FINISHED', '成品菜', NULL, 1, '/6/', 6),
('CAT-BEVERAGE', '饮料', NULL, 1, '/7/', 7)
ON CONFLICT (category_code) DO NOTHING;

-- ============================================================================
-- 脚本完成
-- ============================================================================
