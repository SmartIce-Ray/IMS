# 野百灵餐饮集团 - 数据库快速上手指南

## 📋 文档概览

本目录包含野百灵餐饮集团多品牌连锁管理系统的完整数据库设计文档和脚本。

### 文件清单

| 文件名 | 说明 | 行数 |
|--------|------|------|
| `CLAUDE.md` | 完整数据库设计文档（业务需求+架构设计+核心实体定义） | ~1000行 |
| `schema.sql` | PostgreSQL建表脚本（28张表+索引+注释） | ~900行 |
| `functions.sql` | 核心业务函数与触发器（BOM分解+双成本率+库存管理+审计） | ~600行 |
| `README.md` | 本快速上手指南 | 当前文件 |

---

## 🎯 系统特性

### 核心业务能力

1. **多品牌连锁架构**
   - 支持2品牌6店 → 30-50店快速扩张
   - 灵活的组织层级结构（品牌>区域>城市>门店）
   - 跨品牌、跨门店多维度对比分析

2. **双成本率财务分析体系** ⭐核心特色
   ```
   标准成本率 = 理论成本 / 销售额(折前) × 100%
   实际成本率 = 理论成本 / 菜品收入(折后) × 100%  ← 关键指标
   成本率差异 = 实际成本率 - 标准成本率
   利润侵蚀 = 标准毛利率 - 实际毛利率
   ```

3. **多层级BOM管理**
   - 支持10层嵌套的半成品分解
   - 递归分解到原材料成本
   - 同产品不同品牌可有不同配方

4. **复杂库存管理**
   - 中央仓库 + 门店库存 + 门店间调拨
   - 批次管理 + 保质期追踪
   - 加权平均成本自动计算

5. **数据安全与权限**
   - 配方和成本数据pgcrypto加密
   - 基于RBAC的权限控制
   - 全量审计日志追踪

---

## 🚀 快速开始

### 前置条件

```bash
# 1. PostgreSQL 14+ 已安装
psql --version  # 应显示 14.x 或更高版本

# 2. 检查必要扩展
psql -c "SELECT * FROM pg_available_extensions WHERE name IN ('pgcrypto', 'uuid-ossp', 'pg_trgm');"
```

### 安装步骤

#### Step 1: 创建数据库

```bash
# 创建数据库
psql -U postgres -c "CREATE DATABASE ye_bai_ling_db ENCODING 'UTF8' LC_COLLATE='zh_CN.UTF-8' LC_CTYPE='zh_CN.UTF-8';"

# 或使用图形化工具(pgAdmin/DBeaver)创建
```

#### Step 2: 设置加密密钥

```bash
# 在 postgresql.conf 添加加密密钥配置
echo "app.encryption_key = 'your_secret_key_here_min_16_chars'" >> /path/to/postgresql.conf

# 重启PostgreSQL
sudo systemctl restart postgresql
```

⚠️ **重要**: 请使用强密码作为加密密钥，并妥善保管！

#### Step 3: 执行建表脚本

```bash
# 1. 创建基础表结构
psql -U postgres -d ye_bai_ling_db -f schema.sql

# 2. 创建函数和触发器
psql -U postgres -d ye_bai_ling_db -f functions.sql
```

#### Step 4: 验证安装

```sql
-- 连接数据库
psql -U postgres -d ye_bai_ling_db

-- 检查表数量（应为28张）
SELECT COUNT(*) FROM information_schema.tables
WHERE table_schema = 'public' AND table_type = 'BASE TABLE';

-- 检查关键函数是否存在
\df explode_bom
\df calculate_financial_metrics
\df decrypt_cost

-- 检查触发器
SELECT trigger_name, event_object_table
FROM information_schema.triggers
WHERE trigger_schema = 'public';
```

---

## 📊 数据库架构概览

### 核心实体分层（28张表）

```
┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
│  组织架构层(5)  │   │  产品配方层(6)  │   │  供应链层(5)   │
├─────────────────┤   ├─────────────────┤   ├─────────────────┤
│ organization_   │   │ unit_of_measure │   │ supplier        │
│ unit            │   │ unit_conversion │   │ purchase_order  │
│ brand           │   │ product_category│   │ purchase_order_ │
│ store           │   │ product ⭐      │   │ item            │
│ warehouse       │   │ recipe ⭐       │   │ inventory       │
│ employee        │   │ recipe_item ⭐  │   │ inventory_      │
│                 │   │                 │   │ transaction     │
│ role            │   │                 │   │ price_history   │
│ permission      │   │                 │   │                 │
│ role_permission │   │                 │   │                 │
│ employee_role   │   │                 │   │                 │
└─────────────────┘   └─────────────────┘   └─────────────────┘

┌─────────────────┐   ┌─────────────────┐   ┌─────────────────┐
│ 销售运营层(5)   │   │ 财务分析层(4)⭐ │   │ 系统支持层(3)   │
├─────────────────┤   ├─────────────────┤   ├─────────────────┤
│ customer        │   │ sales_summary   │   │ audit_log       │
│ sales_order     │   │ ingredient_cost_│   │ data_change_    │
│ sales_order_item│   │ summary         │   │ history         │
│ payment_record  │   │ profit_report   │   │ system_config   │
│ promotion       │   │ kpi_metrics     │   │                 │
└─────────────────┘   └─────────────────┘   └─────────────────┘
```

### 关键关系

```
Brand → Store → Warehouse → Inventory
  ↓       ↓         ↓
Product → Recipe → RecipeItem (BOM)
  ↓
SalesOrder → SalesOrderItem → SalesSummary (双成本率分析)
```

---

## 💡 常用操作示例

### 1. 插入基础数据

```sql
-- 插入组织单元
INSERT INTO organization_unit (unit_code, unit_name, unit_type, level, path) VALUES
('ORG-001', '野百灵餐饮集团', 'brand', 1, '/1/'),
('ORG-002', '四川区域', 'region', 2, '/1/2/'),
('ORG-003', '德阳市', 'city', 3, '/1/2/3/');

-- 插入品牌
INSERT INTO brand (brand_code, brand_name, org_unit_id, brand_type) VALUES
('YBL', '野百灵贵州酸汤', 1, 'premium');

-- 插入门店
INSERT INTO store (store_code, store_name, brand_id, org_unit_id, city, address, opening_date, business_status)
VALUES ('YBL-DY-001', '野百灵德阳店', 1, 3, '德阳', '四川省德阳市旌阳区XXX路123号', '2023-01-15', 'operating');

-- 插入计量单位
INSERT INTO unit_of_measure (unit_code, unit_name, unit_type, is_base_unit, symbol) VALUES
('g', '克', 'weight', TRUE, 'g'),
('kg', '千克', 'weight', FALSE, 'kg'),
('jin', '斤', 'weight', FALSE, '斤'),
('ml', '毫升', 'volume', TRUE, 'ml');

-- 插入单位换算规则
INSERT INTO unit_conversion (from_unit_id, to_unit_id, conversion_factor) VALUES
((SELECT unit_id FROM unit_of_measure WHERE unit_code='kg'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='g'), 1000.0),
((SELECT unit_id FROM unit_of_measure WHERE unit_code='jin'), (SELECT unit_id FROM unit_of_measure WHERE unit_code='g'), 500.0);
```

### 2. 创建产品和配方

```sql
-- 设置加密密钥环境变量
SET app.encryption_key = 'your_secret_key_here';

-- 创建原材料
INSERT INTO product (product_code, product_name, product_type, is_ingredient, base_unit_id, current_cost_encrypted)
VALUES (
    'RAW-001',
    '吊龙',
    'raw_material',
    TRUE,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code='g'),
    encrypt_cost(0.096)  -- 48元/斤 = 0.096元/g
);

-- 创建半成品
INSERT INTO product (product_code, product_name, product_type, is_saleable, is_ingredient, selling_price, portion_size)
VALUES (
    'SEMI-001',
    '香茅酱',
    'semi_finished',
    TRUE,
    TRUE,
    15.00,
    200.0
);

-- 创建成品
INSERT INTO product (product_code, product_name, product_type, is_saleable, selling_price, portion_size, category_id, brand_id)
VALUES (
    'PRD-001',
    '云山雪花吊龙',
    'finished',
    TRUE,
    88.00,
    250.0,
    (SELECT category_id FROM product_category WHERE category_code='CAT-006'),
    1
);

-- 创建配方
INSERT INTO recipe (recipe_code, product_id, version, effective_date, yield_quantity, yield_unit_id, status)
VALUES (
    'RCP-001',
    (SELECT product_id FROM product WHERE product_code='PRD-001'),
    'v1.0',
    CURRENT_DATE,
    1.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code='piece'),
    'approved'
);

-- 添加配方明细
INSERT INTO recipe_item (
    recipe_id,
    ingredient_id,
    ingredient_type,
    quantity,
    unit_id,
    unit_price_encrypted,
    subtotal_cost_encrypted
) VALUES (
    (SELECT recipe_id FROM recipe WHERE recipe_code='RCP-001'),
    (SELECT product_id FROM product WHERE product_code='RAW-001'),
    'raw_material',
    250.0,
    (SELECT unit_id FROM unit_of_measure WHERE unit_code='g'),
    encrypt_cost(0.096),
    encrypt_cost(24.0)
);
```

### 3. 查询BOM分解

```sql
-- 完全分解产品BOM到原材料
SELECT *
FROM explode_bom(
    (SELECT product_id FROM product WHERE product_code='PRD-001'),  -- 产品ID
    1.0,                                                             -- 数量
    1                                                                 -- 品牌ID
);

-- 计算产品总成本
SELECT
    p.product_name,
    calculate_product_total_cost(p.product_id, p.brand_id) AS total_cost
FROM product p
WHERE p.product_code = 'PRD-001';
```

### 4. 双成本率分析查询

```sql
-- 查询某门店某月的双成本率对比
SELECT
    p.product_name AS 产品名称,
    ss.sales_quantity AS 销售数量,
    ss.sales_amount_before_discount AS 折前销售额,
    ss.sales_revenue AS 折后收入,
    ss.discount_rate AS 优惠率,

    -- 双成本率对比
    ss.standard_cost_rate AS 标准成本率,
    ss.actual_cost_rate AS 实际成本率,
    ss.cost_rate_variance AS 成本率上升,

    -- 双毛利率对比
    ss.standard_gross_margin AS 标准毛利率,
    ss.actual_gross_margin AS 实际毛利率,
    ss.margin_erosion AS 利润侵蚀,

    -- 评估
    CASE
        WHEN ss.margin_erosion > 15 THEN '⚠️ 促销力度过大'
        WHEN ss.actual_gross_margin < 40 THEN '⚠️ 毛利率过低'
        ELSE '✓ 正常'
    END AS 预警

FROM sales_summary ss
JOIN product p ON ss.product_id = p.product_id
JOIN store s ON ss.store_id = s.store_id
WHERE s.store_code = 'YBL-DY-001'
  AND ss.year_month = '2025-09-01'
ORDER BY ss.margin_erosion DESC;
```

### 5. 促销效果模拟

```sql
-- 模拟促销方案（产品ID=1, 现价88元, 打8折）
SELECT *
FROM simulate_promotion(1, 88.00, 20);

-- 输出示例：
-- 折后价格: 70.40
-- 预测实际成本率: 42.61%
-- 预测实际毛利率: 57.39%
-- 利润侵蚀程度: 12.50%
-- 保本销量: 21
-- 决策建议: revise (需调整)
```

### 6. 跨品牌对比分析

```sql
-- 对比不同品牌同一产品的成本率
SELECT
    b.brand_name AS 品牌,
    p.product_name AS 产品,
    AVG(ss.standard_cost_rate) AS 平均标准成本率,
    AVG(ss.actual_cost_rate) AS 平均实际成本率,
    AVG(ss.actual_gross_margin) AS 平均毛利率,
    SUM(ss.sales_revenue) AS 总收入

FROM sales_summary ss
JOIN brand b ON ss.brand_id = b.brand_id
JOIN product p ON ss.product_id = p.product_id
WHERE ss.year_month BETWEEN '2025-09-01' AND '2025-10-31'
GROUP BY b.brand_id, b.brand_name, p.product_id, p.product_name
ORDER BY 品牌, 总收入 DESC;
```

---

## 🔐 权限管理

### 预置角色

| 角色代码 | 角色名称 | 权限范围 |
|---------|---------|---------|
| `ROLE_SUPER_ADMIN` | 超级管理员 | 所有权限 |
| `ROLE_FINANCE_MANAGER` | 财务经理 | 查看成本、导出数据 |
| `ROLE_OPS_MANAGER` | 运营经理 | 查看销售、管理库存 |
| `ROLE_STORE_MANAGER` | 店长 | 本店数据全部权限 |
| `ROLE_CASHIER` | 收银员 | 创建订单、收款 |

### 权限控制示例

```sql
-- 检查员工是否有查看成本的权限
SELECT check_permission(
    123,                    -- 员工ID
    'PERM_COST_VIEW',       -- 权限代码
    1                       -- 门店ID
);

-- 获取员工可访问的门店列表
SELECT * FROM get_accessible_stores(123);

-- 为员工分配角色
INSERT INTO employee_role (employee_id, role_id, scope_type, scope_id)
VALUES (
    123,
    (SELECT role_id FROM role WHERE role_code='ROLE_STORE_MANAGER'),
    'store',
    1  -- 门店ID
);
```

---

## 📈 性能优化建议

### 1. 定期维护

```sql
-- 更新表统计信息
ANALYZE;

-- 重建索引
REINDEX DATABASE ye_bai_ling_db;

-- 清理无用数据
VACUUM ANALYZE;
```

### 2. 分区策略（针对大数据量表）

```sql
-- 将sales_order按月分区
CREATE TABLE sales_order_2025_09 PARTITION OF sales_order
FOR VALUES FROM ('2025-09-01') TO ('2025-10-01');

CREATE TABLE sales_order_2025_10 PARTITION OF sales_order
FOR VALUES FROM ('2025-10-01') TO ('2025-11-01');
```

### 3. 物化视图（加速报表查询）

```sql
-- 创建月度销售汇总物化视图
CREATE MATERIALIZED VIEW mv_monthly_sales AS
SELECT
    s.store_name,
    p.product_name,
    DATE_TRUNC('month', so.order_date) AS month,
    SUM(soi.quantity) AS total_quantity,
    SUM(soi.final_amount) AS total_revenue
FROM sales_order so
JOIN sales_order_item soi ON so.order_id = soi.order_id
JOIN store s ON so.store_id = s.store_id
JOIN product p ON soi.product_id = p.product_id
GROUP BY s.store_name, p.product_name, DATE_TRUNC('month', so.order_date);

CREATE UNIQUE INDEX idx_mv_monthly_sales ON mv_monthly_sales (store_name, product_name, month);

-- 刷新物化视图（每天执行）
REFRESH MATERIALIZED VIEW CONCURRENTLY mv_monthly_sales;
```

---

## 🔍 故障排查

### 常见问题

#### Q1: 加密/解密失败

```sql
-- 检查加密密钥配置
SHOW app.encryption_key;

-- 如果返回错误，设置环境变量
SET app.encryption_key = 'your_secret_key_here';

-- 或在postgresql.conf中永久配置
```

#### Q2: 库存余额为负数

```sql
-- 检查库存流水
SELECT *
FROM inventory_transaction
WHERE warehouse_id = 1 AND product_id = 101
ORDER BY transaction_date DESC
LIMIT 20;

-- 手动调整库存
UPDATE inventory
SET quantity_on_hand = 正确的库存数量
WHERE warehouse_id = 1 AND product_id = 101;
```

#### Q3: BOM分解无结果

```sql
-- 检查配方是否审批通过
SELECT * FROM recipe
WHERE product_id = 101 AND is_current = TRUE;

-- 检查配方明细
SELECT * FROM recipe_item
WHERE recipe_id = (SELECT recipe_id FROM recipe WHERE product_id = 101 AND is_current = TRUE);
```

---

## 📚 延伸阅读

- **CLAUDE.md** - 完整数据库设计文档（业务需求分析+架构决策+实体定义）
- **schema.sql** - 完整建表脚本（包含详细注释）
- **functions.sql** - 核心业务函数源代码

---

## 🤝 技术支持

如有问题，请参考：
1. 查看 `CLAUDE.md` 的详细设计文档
2. 检查 `schema.sql` 和 `functions.sql` 中的注释
3. 使用 `\d+ table_name` 查看表结构
4. 使用 `\df+ function_name` 查看函数定义

---

## 📝 更新日志

### Version 1.0.0 (2025-11-21)
- ✅ 初始版本发布
- ✅ 28张核心表创建完成
- ✅ BOM递归分解函数实现
- ✅ 双成本率财务分析体系实现
- ✅ 库存自动更新触发器
- ✅ 审计日志全覆盖
- ✅ 成本数据加密存储

---

**祝使用愉快！** 🎉
