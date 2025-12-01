-- ============================================================================
-- 野百灵餐饮集团 - SOP数据导入
-- ============================================================================
-- 版本: v1.0.0
-- 数据来源: 野百灵标准SOP.xlsx
-- SOP数量: 44
-- 原料记录总数: 266
-- 生成时间: 2025-11-22 08:14:36
-- ============================================================================

-- 设置加密密钥
SET app.encryption_key = 'ybl-restaurant-encryption-key-2025';


-- ============================================================================
-- SOP相关表结构 (如果不存在则创建)
-- ============================================================================

-- SOP主表
CREATE TABLE IF NOT EXISTS standard_operating_procedure (
    sop_id SERIAL PRIMARY KEY,
    sop_code VARCHAR(50) UNIQUE NOT NULL,
    product_id INT,
    product_name VARCHAR(200) NOT NULL,
    category VARCHAR(100),
    version VARCHAR(20) DEFAULT 'v1.0',

    effective_date DATE DEFAULT CURRENT_DATE,
    expiry_date DATE,
    is_current BOOLEAN DEFAULT TRUE,

    preparation_time_minutes INT,
    difficulty_level VARCHAR(20),

    status VARCHAR(20) DEFAULT 'approved',
    created_by INT,
    approved_by INT,
    approved_at TIMESTAMP,

    notes TEXT,

    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP,

    CONSTRAINT fk_sop_product FOREIGN KEY (product_id)
        REFERENCES product(product_id)
);

CREATE INDEX IF NOT EXISTS idx_sop_product ON standard_operating_procedure(product_id);
CREATE INDEX IF NOT EXISTS idx_sop_category ON standard_operating_procedure(category);
CREATE INDEX IF NOT EXISTS idx_sop_current ON standard_operating_procedure(is_current) WHERE is_current = TRUE;

-- SOP原料明细表
CREATE TABLE IF NOT EXISTS sop_ingredient (
    sop_ingredient_id SERIAL PRIMARY KEY,
    sop_id INT NOT NULL,
    ingredient_id INT,
    ingredient_name VARCHAR(200) NOT NULL,

    sequence_no INT DEFAULT 0,
    quantity DECIMAL(10,3),
    unit_id INT,
    unit_code VARCHAR(20),

    yield_rate DECIMAL(5,4) DEFAULT 1.0,

    preparation_note TEXT,
    operation_point TEXT,

    is_main_ingredient BOOLEAN DEFAULT FALSE,

    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_sop_ing_sop FOREIGN KEY (sop_id)
        REFERENCES standard_operating_procedure(sop_id) ON DELETE CASCADE,
    CONSTRAINT fk_sop_ing_ingredient FOREIGN KEY (ingredient_id)
        REFERENCES product(product_id),
    CONSTRAINT fk_sop_ing_unit FOREIGN KEY (unit_id)
        REFERENCES unit_of_measure(unit_id)
);

CREATE INDEX IF NOT EXISTS idx_sop_ing_sop ON sop_ingredient(sop_id);
CREATE INDEX IF NOT EXISTS idx_sop_ing_ingredient ON sop_ingredient(ingredient_id);

-- SOP操作步骤表
CREATE TABLE IF NOT EXISTS sop_procedure (
    procedure_id SERIAL PRIMARY KEY,
    sop_id INT NOT NULL,

    step_no INT NOT NULL,
    step_name VARCHAR(200),
    step_description TEXT NOT NULL,

    duration_seconds INT,
    temperature_celsius DECIMAL(5,1),

    quality_standard TEXT,
    safety_note TEXT,

    image_url VARCHAR(500),
    video_url VARCHAR(500),

    created_at TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_sop_proc_sop FOREIGN KEY (sop_id)
        REFERENCES standard_operating_procedure(sop_id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS idx_sop_proc_sop ON sop_procedure(sop_id);

COMMENT ON TABLE standard_operating_procedure IS 'SOP主表 - 标准操作流程';
COMMENT ON TABLE sop_ingredient IS 'SOP原料明细表 - 每个SOP需要的原材料';
COMMENT ON TABLE sop_procedure IS 'SOP操作步骤表 - 每个SOP的具体操作步骤';


-- ============================================================================
-- 1. SOP主表数据
-- ============================================================================


-- 1. 老凯里非遗酸汤 (品类:锅底, 原料:14种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-001',
    '老凯里非遗酸汤',
    '锅底',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-001'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '老凯里非遗酸汤'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-001'
  AND product_id IS NULL;


-- 2. 糊辣椒鲜黄牛匙仁 (品类:肉类, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-002',
    '糊辣椒鲜黄牛匙仁',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-002'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '糊辣椒鲜黄牛匙仁'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-002'
  AND product_id IS NULL;


-- 3. 木姜子鲜黄牛肉 (品类:肉类, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-003',
    '木姜子鲜黄牛肉',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-003'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '木姜子鲜黄牛肉'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-003'
  AND product_id IS NULL;


-- 4. 野蒜酥五花趾 (品类:肉类, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-004',
    '野蒜酥五花趾',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-004'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '野蒜酥五花趾'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-004'
  AND product_id IS NULL;


-- 5. 紫苏半边云(鲜牛胸口) (品类:肉类, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-005',
    '紫苏半边云(鲜牛胸口)',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-005'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '紫苏半边云(鲜牛胸口)'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-005'
  AND product_id IS NULL;


-- 6. 大地飞雪(M9纯血和牛) (品类:肉类, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-006',
    '大地飞雪(M9纯血和牛)',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-006'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '大地飞雪(M9纯血和牛)'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-006'
  AND product_id IS NULL;


-- 7. 黑松露和牛开口笑 (品类:肉类, 原料:7种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-007',
    '黑松露和牛开口笑',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-007'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '黑松露和牛开口笑'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-007'
  AND product_id IS NULL;


-- 8. 贵州传统软哨 (品类:肉类, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-008',
    '贵州传统软哨',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-008'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '贵州传统软哨'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-008'
  AND product_id IS NULL;


-- 9. 手工水晶滑肉 (品类:肉类, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-009',
    '手工水晶滑肉',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-009'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '手工水晶滑肉'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-009'
  AND product_id IS NULL;


-- 10. 过油响皮 (品类:肉类, 原料:1种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-010',
    '过油响皮',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-010'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '过油响皮'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-010'
  AND product_id IS NULL;


-- 11. 糯米午餐肉 (品类:肉类, 原料:1种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-011',
    '糯米午餐肉',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-011'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '糯米午餐肉'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-011'
  AND product_id IS NULL;


-- 12. 净水鲜虾 (品类:肉类, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-012',
    '净水鲜虾',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-012'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '净水鲜虾'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-012'
  AND product_id IS NULL;


-- 13. 乌鱼片 (品类:肉类, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-013',
    '乌鱼片',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-013'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '乌鱼片'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-013'
  AND product_id IS NULL;


-- 14. 海鲜拼盘 (品类:肉类, 原料:5种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-014',
    '海鲜拼盘',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-014'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '海鲜拼盘'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-014'
  AND product_id IS NULL;


-- 15. 黑金虾滑 (品类:肉类, 原料:4种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-015',
    '黑金虾滑',
    '肉类',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-015'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '黑金虾滑'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-015'
  AND product_id IS NULL;


-- 16. 鲜板栗 (品类:素菜, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-016',
    '鲜板栗',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-016'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '鲜板栗'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-016'
  AND product_id IS NULL;


-- 17. 鲜百合 (品类:素菜, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-017',
    '鲜百合',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-017'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '鲜百合'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-017'
  AND product_id IS NULL;


-- 18. 血皮菜 (品类:素菜, 原料:1种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-018',
    '血皮菜',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-018'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '血皮菜'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-018'
  AND product_id IS NULL;


-- 19. 鲜黄花 (品类:素菜, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-019',
    '鲜黄花',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-019'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '鲜黄花'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-019'
  AND product_id IS NULL;


-- 20. 山药 (品类:素菜, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-020',
    '山药',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-020'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '山药'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-020'
  AND product_id IS NULL;


-- 21. 三脆碗 (品类:素菜, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-021',
    '三脆碗',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-021'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '三脆碗'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-021'
  AND product_id IS NULL;


-- 22. 姜柄瓜 (品类:素菜, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-022',
    '姜柄瓜',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-022'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '姜柄瓜'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-022'
  AND product_id IS NULL;


-- 23. 双花碗 (品类:素菜, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-023',
    '双花碗',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-023'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '双花碗'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-023'
  AND product_id IS NULL;


-- 24. 七彩土豆 (品类:素菜, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-024',
    '七彩土豆',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-024'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '七彩土豆'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-024'
  AND product_id IS NULL;


-- 25. 藕 (品类:素菜, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-025',
    '藕',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-025'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '藕'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-025'
  AND product_id IS NULL;


-- 26. 石磨黑豆腐 (品类:素菜, 原料:2种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-026',
    '石磨黑豆腐',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-026'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '石磨黑豆腐'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-026'
  AND product_id IS NULL;


-- 27. 野篮子菌菇组合 (品类:素菜, 原料:7种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-027',
    '野篮子菌菇组合',
    '素菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-027'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '野篮子菌菇组合'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-027'
  AND product_id IS NULL;


-- 28. 火烧云铜锅油焖鸡 (品类:热菜主食, 原料:18种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-028',
    '火烧云铜锅油焖鸡',
    '热菜主食',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-028'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '火烧云铜锅油焖鸡'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-028'
  AND product_id IS NULL;


-- 29. 息烽虎皮猪蹄 (品类:热菜主食, 原料:10种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-029',
    '息烽虎皮猪蹄',
    '热菜主食',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-029'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '息烽虎皮猪蹄'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-029'
  AND product_id IS NULL;


-- 30. 干巴菌炒饭 (品类:热菜主食, 原料:18种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-030',
    '干巴菌炒饭',
    '热菜主食',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-030'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '干巴菌炒饭'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-030'
  AND product_id IS NULL;


-- 31. 糟辣椒炒饭 (品类:热菜主食, 原料:8种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-031',
    '糟辣椒炒饭',
    '热菜主食',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-031'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '糟辣椒炒饭'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-031'
  AND product_id IS NULL;


-- 32. 野佐料擂椒皮蛋 (品类:凉菜, 原料:18种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-032',
    '野佐料擂椒皮蛋',
    '凉菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-032'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '野佐料擂椒皮蛋'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-032'
  AND product_id IS NULL;


-- 33. 木姜子鸡爪 (品类:凉菜, 原料:14种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-033',
    '木姜子鸡爪',
    '凉菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-033'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '木姜子鸡爪'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-033'
  AND product_id IS NULL;


-- 34. 傣村手撕罗非鱼 (品类:凉菜, 原料:13种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-034',
    '傣村手撕罗非鱼',
    '凉菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-034'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '傣村手撕罗非鱼'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-034'
  AND product_id IS NULL;


-- 35. 贵州非遗丝娃娃 (品类:凉菜, 原料:15种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-035',
    '贵州非遗丝娃娃',
    '凉菜',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-035'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '贵州非遗丝娃娃'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-035'
  AND product_id IS NULL;


-- 36. 苗侗空气丸子 (品类:小吃甜品, 原料:15种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-036',
    '苗侗空气丸子',
    '小吃甜品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-036'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '苗侗空气丸子'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-036'
  AND product_id IS NULL;


-- 37. 雪顶冰淇淋玉米粑 (品类:小吃甜品, 原料:9种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-037',
    '雪顶冰淇淋玉米粑',
    '小吃甜品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-037'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '雪顶冰淇淋玉米粑'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-037'
  AND product_id IS NULL;


-- 38. 野菜卷 (品类:小吃甜品, 原料:1种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-038',
    '野菜卷',
    '小吃甜品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-038'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '野菜卷'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-038'
  AND product_id IS NULL;


-- 39. 山玫瑰炸乳扇 (品类:小吃甜品, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-039',
    '山玫瑰炸乳扇',
    '小吃甜品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-039'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '山玫瑰炸乳扇'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-039'
  AND product_id IS NULL;


-- 40. 怪噜洋芋 (品类:小吃甜品, 原料:18种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-040',
    '怪噜洋芋',
    '小吃甜品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-040'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '怪噜洋芋'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-040'
  AND product_id IS NULL;


-- 41. 紫苏桃子 (品类:小吃甜品, 原料:7种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-041',
    '紫苏桃子',
    '小吃甜品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-041'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '紫苏桃子'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-041'
  AND product_id IS NULL;


-- 42. 五指毛桃薏仁水 (品类:饮品, 原料:4种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-042',
    '五指毛桃薏仁水',
    '饮品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-042'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '五指毛桃薏仁水'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-042'
  AND product_id IS NULL;


-- 43. 柠檬山茶 (品类:饮品, 原料:3种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-043',
    '柠檬山茶',
    '饮品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-043'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '柠檬山茶'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-043'
  AND product_id IS NULL;


-- 44. 野刺梨山茶 (品类:饮品, 原料:5种)
INSERT INTO standard_operating_procedure (
    sop_code, product_name, category, version,
    effective_date, is_current, status, is_active
)
SELECT
    'SOP-044',
    '野刺梨山茶',
    '饮品',
    'v1.0',
    '2025-01-01',
    TRUE,
    'approved',
    TRUE
WHERE NOT EXISTS (
    SELECT 1 FROM standard_operating_procedure WHERE sop_code = 'SOP-044'
);

-- 关联产品ID (如果存在)
UPDATE standard_operating_procedure
SET product_id = (
    SELECT product_id FROM product
    WHERE product_name = '野刺梨山茶'
      AND product_type = 'finished'
    LIMIT 1
)
WHERE sop_code = 'SOP-044'
  AND product_id IS NULL;


-- ============================================================================
-- 2. SOP原料明细
-- ============================================================================


-- SOP原料: 老凯里非遗酸汤
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-001';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-001';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 清水 (20.0l)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '清水'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '清水',
        1,
        20.0,
        'l',
        1.0,
        '上锅前加化开猪油; 打锅前须把汤底搅拌均匀',
        TRUE
    );


    -- 原料 2: 红酸汤 (3200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红酸汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红酸汤',
        2,
        3200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 猪油 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '猪油',
        3,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 豪吉鸡精 (230.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豪吉鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '豪吉鸡精',
        4,
        230.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 味精 (80.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        5,
        80.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 西红柿 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '西红柿'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '西红柿',
        6,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 鲜花椒 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鲜花椒',
        7,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 木姜子 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '木姜子',
        8,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 木姜子油 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '木姜子油',
        9,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 鲜姜片 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜姜片'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鲜姜片',
        10,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 黄豆芽 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄豆芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黄豆芽',
        11,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 小葱段 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱段'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小葱段',
        12,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 蒜苗段 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗段'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒜苗段',
        13,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 蒜苗段 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗段'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒜苗段',
        14,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 糊辣椒鲜黄牛匙仁
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-002';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-002';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 匙仁 (120.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '匙仁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '匙仁',
        1,
        120.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 干香茅草 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干香茅草'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '干香茅草',
        2,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 糊辣椒 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糊辣椒',
        3,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 木姜子鲜黄牛肉
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-003';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-003';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 吊龙 (120.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '吊龙'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '吊龙',
        1,
        120.0,
        'g',
        1.0,
        '须取吊龙头尾两端',
        TRUE
    );


    -- 原料 2: 木姜子 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '木姜子',
        2,
        60.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 野蒜酥五花趾
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-004';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-004';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 五花趾 (120.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五花趾'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '五花趾',
        1,
        120.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 蒜酥 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜酥'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒜酥',
        2,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 干香茅 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干香茅'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '干香茅',
        3,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 紫苏半边云(鲜牛胸口)
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-005';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-005';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 胸口油 (120.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '胸口油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '胸口油',
        1,
        120.0,
        'g',
        1.0,
        '胸口油要薄',
        TRUE
    );


    -- 原料 2: 紫苏叶 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '紫苏叶',
        2,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 紫苏碎 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '紫苏碎',
        3,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 大地飞雪(M9纯血和牛)
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-006';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-006';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: M9和牛 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = 'M9和牛'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        'M9和牛',
        1,
        200.0,
        'g',
        1.0,
        '一份须在八片以上; 对角平铺',
        TRUE
    );


    -- 原料 2: 碎冰 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '碎冰'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '碎冰',
        2,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 千叶吊兰 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '千叶吊兰'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '千叶吊兰',
        3,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 黑松露和牛开口笑
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-007';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-007';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 和牛肉糜 (110.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '和牛肉糜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '和牛肉糜',
        1,
        110.0,
        'g',
        1.0,
        '每个开口笑肉馅重量在17克左右; 收口要压结实',
        TRUE
    );


    -- 原料 2: 黑松露酱 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑松露酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黑松露酱',
        2,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 盐 (0.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '盐',
        3,
        0.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 鸡精 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        4,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 胡椒粉 (0.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '胡椒粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '胡椒粉',
        5,
        0.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 小葱 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小葱',
        6,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 小号饺子皮 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小号饺子皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小号饺子皮',
        7,
        60.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 贵州传统软哨
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-008';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-008';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 软哨片 (100.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '软哨片'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '软哨片',
        1,
        100.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 芭蕉叶 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '芭蕉叶',
        2,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 手工水晶滑肉
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-009';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-009';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 雪花松阪肉 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雪花松阪肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '雪花松阪肉',
        1,
        NULL,
        'g',
        1.0,
        '水开以后下入滑肉须开小火; 做好后须放入冷水中保存; 出品重量200克',
        TRUE
    );


    -- 原料 2: 红叶菜 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红叶菜',
        2,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 过油响皮
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-010';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-010';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 响皮 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '响皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '响皮',
        1,
        50.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


END $$;


-- SOP原料: 糯米午餐肉
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-011';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-011';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 糯米午餐肉 (170.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糯米午餐肉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糯米午餐肉',
        1,
        170.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


END $$;


-- SOP原料: 净水鲜虾
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-012';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-012';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 鲜虾 (8.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜虾'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鲜虾',
        1,
        8.0,
        'piece',
        1.0,
        '虾一排4只',
        TRUE
    );


    -- 原料 2: 冰 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '冰',
        2,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 波斯草 (2.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '波斯草'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '波斯草',
        3,
        2.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 乌鱼片
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-013';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-013';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 乌鱼片 (130.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '乌鱼片'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '乌鱼片',
        1,
        130.0,
        'g',
        1.0,
        '有皮一面朝下摆放鱼片之间不能有缝隙; 制作成大理石的花纹感',
        TRUE
    );


    -- 原料 2: 菊花 (1.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菊花'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '菊花',
        2,
        1.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 海鲜拼盘
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-014';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-014';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 小管 (1.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小管'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小管',
        1,
        1.0,
        'piece',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 鲍鱼 (3.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲍鱼'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鲍鱼',
        2,
        3.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 生蚝 (2.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生蚝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生蚝',
        3,
        2.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 鲜虾 (4.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜虾'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鲜虾',
        4,
        4.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 紫苏叶 (3.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '紫苏叶',
        5,
        3.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 黑金虾滑
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-015';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-015';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 虾滑 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '虾滑'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '虾滑',
        1,
        150.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 墨鱼汁 (1.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '墨鱼汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '墨鱼汁',
        2,
        1.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 芭蕉叶 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '芭蕉叶',
        3,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 蒜酥 (1.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜酥'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒜酥',
        4,
        1.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 鲜板栗
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-016';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-016';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 板栗 (130.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '板栗'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '板栗',
        1,
        130.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 雨衣甘蓝 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雨衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '雨衣甘蓝',
        2,
        15.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 鲜百合
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-017';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-017';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 百合 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '百合'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '百合',
        1,
        50.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 冰 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '冰',
        2,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 菊花 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菊花'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '菊花',
        3,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 血皮菜
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-018';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-018';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 血皮菜 (130.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '血皮菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '血皮菜',
        1,
        130.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


END $$;


-- SOP原料: 鲜黄花
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-019';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-019';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 鲜黄花 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜黄花'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鲜黄花',
        1,
        60.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 红叶生菜 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红叶生菜',
        2,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 山药
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-020';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-020';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 大山药 (160.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大山药'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大山药',
        1,
        160.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 菊花瓣 (1.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菊花瓣'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '菊花瓣',
        2,
        1.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 冰 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '冰',
        3,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 三脆碗
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-021';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-021';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 干黄花 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干黄花'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '干黄花',
        1,
        25.0,
        'g',
        1.0,
        '干花菜摆放在餐盘中间',
        TRUE
    );


    -- 原料 2: 干花菜 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干花菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '干花菜',
        2,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 贡菜 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贡菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '贡菜',
        3,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 姜柄瓜
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-022';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-022';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 姜柄瓜 (140.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜柄瓜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '姜柄瓜',
        1,
        140.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 雨衣甘蓝 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '雨衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '雨衣甘蓝',
        2,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 双花碗
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-023';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-023';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 花生芽 (120.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花生芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '花生芽',
        1,
        120.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 黄瓜花 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄瓜花'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黄瓜花',
        2,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 七彩土豆
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-024';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-024';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 七彩土豆 (100.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '七彩土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '七彩土豆',
        1,
        100.0,
        'g',
        1.0,
        '冰沙蓬松 不能压实; 土豆卷由外圈向内圈摆放',
        TRUE
    );


    -- 原料 2: 冰 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '冰',
        2,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 藕
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-025';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-025';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 藕 (120.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藕'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '藕',
        1,
        120.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 红叶生菜 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红叶生菜',
        2,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 羽衣甘蓝 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '羽衣甘蓝',
        3,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 石磨黑豆腐
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-026';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-026';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 黑豆腐 (250.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑豆腐'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黑豆腐',
        1,
        250.0,
        'g',
        1.0,
        '餐具底部垫少许生菜边角',
        TRUE
    );


    -- 原料 2: 红叶生菜 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红叶生菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红叶生菜',
        2,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 野篮子菌菇组合
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-027';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-027';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 黑牛肝 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黑牛肝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黑牛肝',
        1,
        50.0,
        'g',
        1.0,
        '底部用干香茅和莲白整叶垫底，九分满的高度',
        TRUE
    );


    -- 原料 2: 球盖菇 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '球盖菇'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '球盖菇',
        2,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 鹿茸菌 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鹿茸菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鹿茸菌',
        3,
        60.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 金耳菌 (80.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '金耳菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '金耳菌',
        4,
        80.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 绣球菌 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '绣球菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '绣球菌',
        5,
        60.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 莲白 (300.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '莲白'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '莲白',
        6,
        300.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 羽衣甘蓝 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '羽衣甘蓝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '羽衣甘蓝',
        7,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 火烧云铜锅油焖鸡
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-028';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-028';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 香茅 (100.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香茅'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '香茅',
        1,
        100.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 小米辣 (80.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小米辣',
        2,
        80.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 大蒜 (70.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大蒜',
        3,
        70.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 盐 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '盐',
        4,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 鸡精 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        5,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 味精 (8.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        6,
        8.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 生抽 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生抽',
        7,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 蚝油 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蚝油',
        8,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 草果粉 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '草果粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '草果粉',
        9,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 五香粉 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五香粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '五香粉',
        10,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 红油 (100.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红油',
        11,
        100.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 西红柿丁 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '西红柿丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '西红柿丁',
        12,
        150.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 香茅酱 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香茅酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '香茅酱',
        13,
        150.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 蒸熟的去皮土豆 (550.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒸熟的去皮土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒸熟的去皮土豆',
        14,
        550.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 15: 去骨鸡腿 (400.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '去骨鸡腿'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '去骨鸡腿',
        15,
        400.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 16: 百香果汁 (35.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '百香果汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '百香果汁',
        16,
        35.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 17: 大香菜丝 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大香菜丝',
        17,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 18: 葱白丝 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '葱白丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '葱白丝',
        18,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 息烽虎皮猪蹄
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-029';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-029';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 熟猪蹄块 (400.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '熟猪蹄块'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '熟猪蹄块',
        1,
        400.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 郫县豆瓣 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '郫县豆瓣'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '郫县豆瓣',
        2,
        15.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 糍粑辣椒 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糍粑辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糍粑辣椒',
        3,
        150.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 姜 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '姜',
        4,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 大蒜 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大蒜',
        5,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 蒜苗 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜苗'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒜苗',
        6,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 花椒 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '花椒',
        7,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 菜籽油 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '菜籽油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '菜籽油',
        8,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 啤酒 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '啤酒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '啤酒',
        9,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 五香粉 (1.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五香粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '五香粉',
        10,
        1.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 干巴菌炒饭
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-030';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-030';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 鸡油 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡油',
        1,
        200.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 干巴菌 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '干巴菌',
        2,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 大蒜 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大蒜',
        3,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 红洋葱 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红洋葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红洋葱',
        4,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 干巴菌酱 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '干巴菌酱',
        5,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 牛肉粒 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '牛肉粒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '牛肉粒',
        6,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 口蘑 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '口蘑'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '口蘑',
        7,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 干巴菌 (8.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '干巴菌'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '干巴菌',
        8,
        8.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 火腿丁 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '火腿丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '火腿丁',
        9,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 生抽 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生抽',
        10,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 鸡精 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        11,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 味精 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        12,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 白糖 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '白糖',
        13,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 老抽 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '老抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '老抽',
        14,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 15: 青椒丁 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '青椒丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '青椒丁',
        15,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 16: 无菌蛋 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '无菌蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '无菌蛋',
        16,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 17: 小葱 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小葱',
        17,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 18: 米饭 (300.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '米饭'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '米饭',
        18,
        300.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 糟辣椒炒饭
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-031';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-031';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 鸡蛋 (1.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡蛋',
        1,
        1.0,
        'piece',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 糟辣椒酱 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糟辣椒酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糟辣椒酱',
        2,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 脆哨 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '脆哨',
        3,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 小葱 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小葱',
        4,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 鸡精 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        5,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 味精 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        6,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 生抽 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生抽',
        7,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 米饭 (300.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '米饭'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '米饭',
        8,
        300.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 野佐料擂椒皮蛋
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-032';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-032';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 蒸熟茄子 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒸熟茄子'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒸熟茄子',
        1,
        200.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 盐 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '盐',
        2,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 鸡精 (4.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        3,
        4.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 味精 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        4,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 白糖 (1.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '白糖',
        5,
        1.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 贵州五香辣椒面 (4.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '贵州五香辣椒面',
        6,
        4.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 糊辣椒 (4.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糊辣椒',
        7,
        4.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 蒜 (8.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒜',
        8,
        8.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 生抽 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生抽',
        9,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 蚝油 (6.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蚝油',
        10,
        6.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 藤椒油 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藤椒油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '藤椒油',
        11,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 皮蛋 (3.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '皮蛋'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '皮蛋',
        12,
        3.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 烧螺丝椒 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '烧螺丝椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '烧螺丝椒',
        13,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 烧番茄 (100.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '烧番茄'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '烧番茄',
        14,
        100.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 15: 香菜 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '香菜',
        15,
        15.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 16: 脆哨 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '脆哨',
        16,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 17: 小米辣圈 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣圈'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小米辣圈',
        17,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 18: 折耳根 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '折耳根',
        18,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 木姜子鸡爪
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-033';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-033';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 鸡爪（熟） (350.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡爪（熟）'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡爪（熟）',
        1,
        350.0,
        'g',
        1.0,
        '鸡爪切汆水后开加 姜葱花椒粒煮15分钟',
        TRUE
    );


    -- 原料 2: 大蒜 (45.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大蒜',
        2,
        45.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 黄柠檬 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黄柠檬',
        3,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 东古酱油 (95.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '东古酱油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '东古酱油',
        4,
        95.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 陈醋 (13.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '陈醋'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '陈醋',
        5,
        13.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 蚝油 (12.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蚝油',
        6,
        12.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 白糖 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '白糖',
        7,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 红油 (95.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '红油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '红油',
        8,
        95.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 野山椒带水 (125.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '野山椒带水'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '野山椒带水',
        9,
        125.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 木姜子油 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '木姜子油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '木姜子油',
        10,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 水 (240.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '水'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '水',
        11,
        240.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 藤椒油 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '藤椒油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '藤椒油',
        12,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 鲜青花椒 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鲜青花椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鲜青花椒',
        13,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 青柠檬汁 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '青柠檬汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '青柠檬汁',
        14,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 傣村手撕罗非鱼
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-034';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-034';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 大蒜 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大蒜',
        1,
        150.0,
        'g',
        1.0,
        '混合香草 大香菜 小香菜 茴香苗 1；1；1组成',
        TRUE
    );


    -- 原料 2: 小米辣 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小米辣'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小米辣',
        2,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 香菜根 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜根'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '香菜根',
        3,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 柠檬汁 (250.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '柠檬汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '柠檬汁',
        4,
        250.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 鱼露 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鱼露'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鱼露',
        5,
        150.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 白糖 (158.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '白糖',
        6,
        158.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 味精 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        7,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 蚝油 (8.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蚝油'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蚝油',
        8,
        8.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 新一代辣椒面 (8.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新一代辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '新一代辣椒面',
        9,
        8.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 酸辣酱 (70.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '酸辣酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '酸辣酱',
        10,
        70.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 混合香草 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '混合香草'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '混合香草',
        11,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 芭蕉叶 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芭蕉叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '芭蕉叶',
        12,
        15.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 黄柠檬片 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄柠檬片'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黄柠檬片',
        13,
        15.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 贵州非遗丝娃娃
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-035';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-035';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 青笋丝 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '青笋丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '青笋丝',
        1,
        30.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 绿豆芽 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '绿豆芽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '绿豆芽',
        2,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 海带丝 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '海带丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '海带丝',
        3,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 酸萝卜丝 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '酸萝卜丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '酸萝卜丝',
        4,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 黄瓜丝 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄瓜丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黄瓜丝',
        5,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 折耳根 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '折耳根',
        6,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 土豆丝 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '土豆丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '土豆丝',
        7,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 脆哨 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '脆哨',
        8,
        25.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 凉面 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '凉面'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '凉面',
        9,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 春卷皮 (12.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '春卷皮'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '春卷皮',
        10,
        12.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 芥末 (0.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '芥末'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '芥末',
        11,
        0.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 糊辣椒 (4.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糊辣椒',
        12,
        4.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 贵州五香辣椒面 (4.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '贵州五香辣椒面',
        13,
        4.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 贵州酸汤 (160.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州酸汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '贵州酸汤',
        14,
        160.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 15: 小葱花 (2.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小葱花'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小葱花',
        15,
        2.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 苗侗空气丸子
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-036';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-036';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 折耳根 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '折耳根',
        1,
        200.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 葱花 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '葱花'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '葱花',
        2,
        60.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 香菜 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '香菜',
        3,
        60.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 泡罗卜 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡罗卜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '泡罗卜',
        4,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 大香菜 (60.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大香菜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大香菜',
        5,
        60.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 糊辣椒 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糊辣椒'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糊辣椒',
        6,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 贵州五香辣椒面 (21.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '贵州五香辣椒面',
        7,
        21.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 花椒面 (1.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '花椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '花椒面',
        8,
        1.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 生抽 (80.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生抽',
        9,
        80.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 纯净水 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '纯净水'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '纯净水',
        10,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 鸡精 (16.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        11,
        16.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 味精 (4.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        12,
        4.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 脆哨 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆哨'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '脆哨',
        13,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 豆腐丸子（一个） (33.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '豆腐丸子（一个）'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '豆腐丸子（一个）',
        14,
        33.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 15: 帕马森干酪 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '帕马森干酪'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '帕马森干酪',
        15,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 雪顶冰淇淋玉米粑
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-037';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-037';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 新鲜甜玉米 (400.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '新鲜甜玉米'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '新鲜甜玉米',
        1,
        400.0,
        'g',
        1.0,
        '制作时给160克玉米糊',
        TRUE
    );


    -- 原料 2: 盐 (0.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '盐',
        2,
        0.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 生粉 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生粉',
        3,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 小麦自发粉 (80.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '小麦自发粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '小麦自发粉',
        4,
        80.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 鸡蛋黄 (2.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡蛋黄'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡蛋黄',
        5,
        2.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 白糖 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '白糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '白糖',
        6,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 帕马森干酪 (5.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '帕马森干酪'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '帕马森干酪',
        7,
        5.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 香草冰淇淋 (80.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '香草冰淇淋'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '香草冰淇淋',
        8,
        80.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 碧根果碎 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '碧根果碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '碧根果碎',
        9,
        15.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 野菜卷
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-038';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-038';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 野菜卷 (6.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '野菜卷'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '野菜卷',
        1,
        6.0,
        'piece',
        1.0,
        NULL,
        TRUE
    );


END $$;


-- SOP原料: 山玫瑰炸乳扇
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-039';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-039';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 玫瑰乳扇 (25.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '玫瑰乳扇'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '玫瑰乳扇',
        1,
        25.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 玫瑰酱 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '玫瑰酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '玫瑰酱',
        2,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 山玫瑰花瓣 (0.5g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '山玫瑰花瓣'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '山玫瑰花瓣',
        3,
        0.5,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 怪噜洋芋
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-040';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-040';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 蒜蓉辣酱 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒜蓉辣酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒜蓉辣酱',
        1,
        40.0,
        'g',
        1.0,
        NULL,
        TRUE
    );


    -- 原料 2: 西红柿 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '西红柿'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '西红柿',
        2,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 大蒜 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '大蒜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '大蒜',
        3,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 姜 (12.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '姜'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '姜',
        4,
        12.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 黄灯笼辣椒酱 (20.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '黄灯笼辣椒酱'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '黄灯笼辣椒酱',
        5,
        20.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 猪肉碎 (250.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '猪肉碎'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '猪肉碎',
        6,
        250.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 盐 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '盐'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '盐',
        7,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 8: 鸡精 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        8,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 9: 胡椒粉 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '胡椒粉'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '胡椒粉',
        9,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 10: 蒸土豆 (300.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '蒸土豆'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '蒸土豆',
        10,
        300.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 11: 贵州五香辣椒面 (6.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '贵州五香辣椒面'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '贵州五香辣椒面',
        11,
        6.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 12: 折耳根段 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '折耳根段'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '折耳根段',
        12,
        15.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 13: 泡萝卜丁 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '泡萝卜丁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '泡萝卜丁',
        13,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 14: 怪噜洋芋酱汁 (70.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '怪噜洋芋酱汁'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '怪噜洋芋酱汁',
        14,
        70.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 15: 生抽 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '生抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '生抽',
        15,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 16: 鸡精 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '鸡精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '鸡精',
        16,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 17: 味精 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '味精'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '味精',
        17,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 18: 老抽 (待补充g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '老抽'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '老抽',
        18,
        NULL,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 紫苏桃子
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-041';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-041';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 紫苏汤水 (940.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏汤水'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '紫苏汤水',
        1,
        940.0,
        'g',
        1.0,
        '出品时脆桃150克荔枝3颗',
        TRUE
    );


    -- 原料 2: 糖 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '糖',
        2,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 苹果醋 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '苹果醋'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '苹果醋',
        3,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 仔姜丝 (90.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '仔姜丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '仔姜丝',
        4,
        90.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 紫苏丝 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '紫苏丝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '紫苏丝',
        5,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 6: 脆桃 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '脆桃'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '脆桃',
        6,
        150.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 7: 荔枝 (3.0piece)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '荔枝'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '荔枝',
        7,
        3.0,
        'piece',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 五指毛桃薏仁水
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-042';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-042';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 五指毛桃茶包 (1.0pack)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '五指毛桃茶包'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '五指毛桃茶包',
        1,
        1.0,
        'pack',
        1.0,
        '1.五指毛桃（8g一包）
泡法：五指毛桃三角茶包2包，加入1000ml开水，35克果糖，闷泡5分钟，搅拌均匀备用（可根据门店实际按比例翻倍）；                                         2.在出品杯加入薏米40g，再准备雪克杯加入200g五指毛桃茶汤，10g果糖，加冰至450ml刻度线雪克摇匀倒入出品杯，顶部放上毛桃根装饰即可（毛桃根须清洗干净）',
        TRUE
    );


    -- 原料 2: 薏米 (40.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '薏米'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '薏米',
        2,
        40.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 果糖 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '果糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '果糖',
        3,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 毛桃根 (10.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '毛桃根'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '毛桃根',
        4,
        10.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 柠檬山茶
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-043';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-043';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 凤凰单枞鸭屎香茶叶 (15.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '凤凰单枞鸭屎香茶叶'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '凤凰单枞鸭屎香茶叶',
        1,
        15.0,
        'g',
        1.0,
        '第一步：取1000ml量桶1个+15g凤凰单枞鸭屎香茶备用（第一步：茶汤泡制比例为：每30g鸭屎香茶叶需要1800ml开水，盖盖泡制8min，过滤茶渣，自然放凉。）
第二步：再取另外一个1000ml量桶+400ml开水。倒入装有15g鸭屎香茶的量桶，（水冲茶），搅拌3-5圈（让茶叶充分浸泡在水中），常温计时4分钟，时间到后，搅拌3-5圈（提升茶味），继续计时4分钟，
第三步：另外取一个量桶+250g冰块备用。（可以在泡茶过程中准备好）
第四部：第二步时间到后，时间到再次搅拌3~5圈（茶叶浮起方便过滤），过滤至备好的绿茶冰块量桶里至无连续水滴状移开，搅拌至冰镇状态。加盖冷藏备用; 按照鸭屎香茶汤200ml，果糖50g的比例，提前混合茶汤，按照备货量提前准备。保存时间3h。; 雪克杯中加入香水柠檬（片）30g，用捣棒碾压出汁，然后依次加入200g茶汤，35-40g果葡糖浆，用搅拌棒搅匀，倾倒至出品杯中。
在出品杯中填满冰块至满杯，然后加入15g香水柠檬片至杯壁中部做装饰。
取黄柠檬一片，沿中轴线剪开2/3，把两边一前一后错开造型，放置在杯中冰块顶部即可。',
        TRUE
    );


    -- 原料 2: 广东香水柠檬 (55.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '广东香水柠檬'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '广东香水柠檬',
        2,
        55.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 果糖 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '果糖'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '果糖',
        3,
        50.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- SOP原料: 野刺梨山茶
DO $$
DECLARE
    v_sop_id INT;
    v_ingredient_id INT;
BEGIN
    SELECT sop_id INTO v_sop_id FROM standard_operating_procedure WHERE sop_code = 'SOP-044';

    IF v_sop_id IS NULL THEN
        RAISE NOTICE 'SOP不存在: SOP-044';
        RETURN;
    END IF;

    -- 清空原有原料明细
    DELETE FROM sop_ingredient WHERE sop_id = v_sop_id;


    -- 原料 1: 果葡糖浆 (50.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '果葡糖浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '果葡糖浆',
        1,
        50.0,
        'g',
        1.0,
        '山茶花茶汤：
1.700g开水+50g冰块+30g山茶花乌龙茶叶，泡制4分钟后，搅拌3-5圈激发茶香，再泡4分钟；
2.泡好后再加入500g冰块。

刺梨山茶出品：
1.雪克杯中加入50g果葡糖浆、100g刺梨原浆、150g山茶花茶汤搅拌均匀；
2.加入冰块200g，倒入饮品杯中                                      
3.在顶部加上30-35g刺梨果干',
        TRUE
    );


    -- 原料 2: 刺梨原浆 (100.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '刺梨原浆'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '刺梨原浆',
        2,
        100.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 3: 山茶花茶汤 (150.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '山茶花茶汤'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '山茶花茶汤',
        3,
        150.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 4: 冰块 (200.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '冰块'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '冰块',
        4,
        200.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


    -- 原料 5: 刺梨果干 (30.0g)
    SELECT product_id INTO v_ingredient_id
    FROM product
    WHERE product_name = '刺梨果干'
      AND product_type = 'raw_material'
    LIMIT 1;

    INSERT INTO sop_ingredient (
        sop_id, ingredient_id, ingredient_name, sequence_no,
        quantity, unit_code, yield_rate, operation_point, is_main_ingredient
    ) VALUES (
        v_sop_id,
        v_ingredient_id,
        '刺梨果干',
        5,
        30.0,
        'g',
        1.0,
        NULL,
        FALSE
    );


END $$;


-- ============================================================================
-- 3. 数据验证
-- ============================================================================
-- 验证SOP数量
-- SELECT COUNT(*) AS sop_count FROM standard_operating_procedure WHERE is_current = TRUE;

-- 验证原料关联率
-- SELECT
--     COUNT(*) AS total_ingredients,
--     COUNT(ingredient_id) AS linked_ingredients,
--     ROUND(COUNT(ingredient_id)::NUMERIC / COUNT(*) * 100, 2) AS link_rate
-- FROM sop_ingredient;

-- 查看缺失用量的原料
-- SELECT si.ingredient_name, sop.product_name, sop.category
-- FROM sop_ingredient si
-- JOIN standard_operating_procedure sop ON si.sop_id = sop.sop_id
-- WHERE si.quantity IS NULL OR si.quantity = 0
-- ORDER BY sop.category, sop.product_name;

-- ============================================================================
-- 脚本完成
-- ============================================================================
