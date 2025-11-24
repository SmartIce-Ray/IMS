-- ============================================================================
-- 野百灵餐饮集团 - 组织架构与门店数据录入
-- ============================================================================
-- 版本: v1.0.0
-- 数据来源: 门店信息.md
-- 生成时间: 2025-11-22
-- ============================================================================

-- ============================================================================
-- 1. 组织架构
-- ============================================================================

-- 1.1 集团总部
INSERT INTO organization_unit (unit_code, unit_name, unit_type, parent_unit_id, level, path, sort_order, is_active)
VALUES ('ORG-HQ', '野百灵餐饮集团', 'brand', NULL, 1, '/1/', 1, TRUE)
ON CONFLICT (unit_code) DO NOTHING;

-- 1.2 区域
INSERT INTO organization_unit (unit_code, unit_name, unit_type, parent_unit_id, level, path, sort_order, is_active)
VALUES
('ORG-SC', '四川区域', 'region',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-HQ'), 2, '/1/2/', 1, TRUE),
('ORG-JS', '江苏区域', 'region',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-HQ'), 2, '/1/3/', 2, TRUE)
ON CONFLICT (unit_code) DO NOTHING;

-- 1.3 城市
INSERT INTO organization_unit (unit_code, unit_name, unit_type, parent_unit_id, level, path, sort_order, is_active)
VALUES
('ORG-SC-MY', '绵阳市', 'city',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC'), 3, '/1/2/4/', 1, TRUE),
('ORG-SC-DY', '德阳市', 'city',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC'), 3, '/1/2/5/', 2, TRUE),
('ORG-SC-JY', '江油市', 'city',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC'), 3, '/1/2/6/', 3, TRUE),
('ORG-JS-CS', '常熟市', 'city',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-JS'), 3, '/1/3/7/', 1, TRUE)
ON CONFLICT (unit_code) DO NOTHING;

-- ============================================================================
-- 2. 品牌
-- ============================================================================
INSERT INTO brand (brand_code, brand_name, brand_name_en, brand_type, org_unit_id, positioning, target_customer, is_active)
VALUES
('BRAND-NJX', '宁桂杏山野烤肉', 'Ningguixing BBQ', 'standard',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-HQ'),
    '贵州特色山野烤肉', '年轻群体、家庭聚餐', TRUE),
('BRAND-YBL', '野百灵贵州酸汤火锅', 'Yebailing Hotpot', 'premium',
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-HQ'),
    '贵州非遗酸汤火锅', '中高端消费群体', TRUE)
ON CONFLICT (brand_code) DO NOTHING;

-- ============================================================================
-- 3. 员工（店长）
-- ============================================================================
INSERT INTO employee (employee_code, employee_name, phone, department, position, employment_status, is_active)
VALUES
('EMP-001', '雷军', '13688058935', '门店运营', '店长', 'active', TRUE),
('EMP-002', '刘雪梅', '18281555627', '门店运营', '店长', 'active', TRUE),
('EMP-003', '薛连', '15884611422', '门店运营', '店长', 'active', TRUE),
('EMP-004', '梁笑天', '19196455131', '门店运营', '店长', 'active', TRUE),
('EMP-005', '杨攀', '18784791707', '门店运营', '店长', 'active', TRUE),
('EMP-006', '姜德刚', '15162632184', '门店运营', '店长', 'active', TRUE)
ON CONFLICT (employee_code) DO NOTHING;

-- ============================================================================
-- 4. 门店
-- ============================================================================

-- 4.1 宁桂杏山野烤肉（1958店）- 绵阳
INSERT INTO store (
    store_code, store_name, brand_id, org_unit_id,
    store_type, business_model,
    address, city, province, district, phone,
    opening_date, business_status, manager_id, is_active
) VALUES (
    'STORE-NJX-MY-001',
    '宁桂杏山野烤肉（1958店）',
    (SELECT brand_id FROM brand WHERE brand_code = 'BRAND-NJX'),
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC-MY'),
    'standard', 'direct',
    '涪城区跃进路1958一期6栋1层4、5、6（萍姐火锅旁）',
    '绵阳', '四川', '涪城区', '13688058935',
    '2025-01-01', 'operating',
    (SELECT employee_id FROM employee WHERE employee_code = 'EMP-001'),
    TRUE
) ON CONFLICT (store_code) DO NOTHING;

-- 4.2 宁桂杏山野烤肉（上马Young Park）- 绵阳
INSERT INTO store (
    store_code, store_name, brand_id, org_unit_id,
    store_type, business_model,
    address, city, province, district, phone,
    opening_date, business_status, manager_id, is_active
) VALUES (
    'STORE-NJX-MY-002',
    '宁桂杏山野烤肉（上马Young Park）',
    (SELECT brand_id FROM brand WHERE brand_code = 'BRAND-NJX'),
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC-MY'),
    'standard', 'direct',
    '涪城区科技新区财元路12号附1号',
    '绵阳', '四川', '涪城区', '18281555627',
    '2025-07-01', 'operating',
    (SELECT employee_id FROM employee WHERE employee_code = 'EMP-002'),
    TRUE
) ON CONFLICT (store_code) DO NOTHING;

-- 4.3 宁桂杏山野烤肉（江油首店）
INSERT INTO store (
    store_code, store_name, brand_id, org_unit_id,
    store_type, business_model,
    address, city, province, district, phone,
    opening_date, business_status, manager_id, is_active
) VALUES (
    'STORE-NJX-JY-001',
    '宁桂杏山野烤肉（江油首店）',
    (SELECT brand_id FROM brand WHERE brand_code = 'BRAND-NJX'),
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC-JY'),
    'standard', 'direct',
    '中坝街道圣名国际购物广场1F-553',
    '江油', '四川', '中坝街道', '15884611422',
    '2025-10-01', 'operating',
    (SELECT employee_id FROM employee WHERE employee_code = 'EMP-003'),
    TRUE
) ON CONFLICT (store_code) DO NOTHING;

-- 4.4 野百灵贵州酸汤火锅（1958店）- 绵阳
INSERT INTO store (
    store_code, store_name, brand_id, org_unit_id,
    store_type, business_model,
    address, city, province, district, phone,
    opening_date, business_status, manager_id, is_active
) VALUES (
    'STORE-YBL-MY-001',
    '野百灵贵州酸汤火锅（1958店）',
    (SELECT brand_id FROM brand WHERE brand_code = 'BRAND-YBL'),
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC-MY'),
    'flagship', 'direct',
    '涪城区九洲跃进路1958一期6栋1层1号',
    '绵阳', '四川', '涪城区', '19196455131',
    '2025-06-04', 'operating',
    (SELECT employee_id FROM employee WHERE employee_code = 'EMP-004'),
    TRUE
) ON CONFLICT (store_code) DO NOTHING;

-- 4.5 野百灵贵州酸汤火锅（德阳店）
INSERT INTO store (
    store_code, store_name, brand_id, org_unit_id,
    store_type, business_model,
    address, city, province, district, phone,
    opening_date, business_status, manager_id, is_active
) VALUES (
    'STORE-YBL-DY-001',
    '野百灵贵州酸汤火锅（德阳店）',
    (SELECT brand_id FROM brand WHERE brand_code = 'BRAND-YBL'),
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-SC-DY'),
    'standard', 'direct',
    '待补充',
    '德阳', '四川', NULL, '18784791707',
    '2025-08-23', 'operating',
    (SELECT employee_id FROM employee WHERE employee_code = 'EMP-005'),
    TRUE
) ON CONFLICT (store_code) DO NOTHING;

-- 4.6 宁桂杏山野烤肉（世贸店）- 常熟
INSERT INTO store (
    store_code, store_name, brand_id, org_unit_id,
    store_type, business_model,
    address, city, province, district, phone,
    opening_date, business_status, manager_id, is_active
) VALUES (
    'STORE-NJX-CS-001',
    '宁桂杏山野烤肉（世贸店）',
    (SELECT brand_id FROM brand WHERE brand_code = 'BRAND-NJX'),
    (SELECT unit_id FROM organization_unit WHERE unit_code = 'ORG-JS-CS'),
    'standard', 'direct',
    '常熟市泰山北路6号',
    '常熟', '江苏', NULL, '15162632184',
    '2025-03-08', 'operating',
    (SELECT employee_id FROM employee WHERE employee_code = 'EMP-006'),
    TRUE
) ON CONFLICT (store_code) DO NOTHING;

-- ============================================================================
-- 5. 仓库（每个门店配一个门店仓库）
-- ============================================================================
INSERT INTO warehouse (warehouse_code, warehouse_name, warehouse_type, store_id, org_unit_id, brand_id, is_active)
SELECT
    'WH-' || s.store_code,
    s.store_name || '仓库',
    'store',
    s.store_id,
    s.org_unit_id,
    s.brand_id,
    TRUE
FROM store s
WHERE NOT EXISTS (
    SELECT 1 FROM warehouse w WHERE w.store_id = s.store_id
);

-- ============================================================================
-- 数据验证
-- ============================================================================
-- SELECT
--     b.brand_name,
--     s.store_code,
--     s.store_name,
--     s.city,
--     s.opening_date,
--     e.employee_name AS manager
-- FROM store s
-- JOIN brand b ON s.brand_id = b.brand_id
-- LEFT JOIN employee e ON s.manager_id = e.employee_id
-- ORDER BY b.brand_name, s.opening_date;

-- ============================================================================
-- 脚本完成
-- ============================================================================
