# 数据库部署指南

## 环境要求

- **数据库**: PostgreSQL 14+ (推荐 PostgreSQL 15)
- **扩展**: pgcrypto, uuid-ossp, pg_trgm, btree_gin
- **编码**: UTF-8
- **验证日期**: 2025-11-23

---

## 部署状态

| 指标 | 数值 |
|-----|------|
| 总表数 | 40 |
| 总视图数 | 17 |
| 产品数 | 323 |
| 配方数 | 87 |
| 配方明细数 | 360 (全部有用量) |
| 原材料价格数 | 237 |
| SOP数 | 44 |
| 门店数 | 6 |

### 数据修复记录 (2025-11-23)

1. **原材料价格修复**: 从MD文档提取145个原材料价格，更新到product表的current_cost_encrypted字段
2. **配方用量修复**:
   - 从`原材料品类分类及用量成本标准_完全分解版.md`提取224条成品配方
   - 从`WL成本卡.xlsx`糖水铺sheet提取58条茶饮/甜品配方
   - 从`（二更）成本卡`半成品清单sheet提取54条半成品配方
   - 手动补充22条缺失配方（含成品引用半成品、水）
3. **创建视图**: `v_raw_material_price` 用于查看原材料价格

---

## 安装步骤

### 1. 安装 PostgreSQL (macOS)

```bash
# Homebrew 安装
brew install postgresql@15
brew services start postgresql@15

# 添加到 PATH
echo 'export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

### 2. 创建数据库和扩展

```bash
/opt/homebrew/opt/postgresql@15/bin/createdb yebailing_db

/opt/homebrew/opt/postgresql@15/bin/psql yebailing_db -c "
CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gin;
"
```

---

## SQL 执行顺序

**重要**: 由于依赖关系，必须严格按此顺序执行：

```bash
cd /Users/apple/Desktop/野百灵菜单利润分析/Database
PSQL="/opt/homebrew/opt/postgresql@15/bin/psql"

# 第一阶段: 核心结构
$PSQL yebailing_db -f schema_core_mvp.sql

# 第二阶段: 函数与逻辑
$PSQL yebailing_db -f functions_cost_encryption.sql
$PSQL yebailing_db -f functions_bom_explosion.sql
$PSQL yebailing_db -f triggers_automatic_calculation.sql
$PSQL yebailing_db -f procedures_data_validation.sql

# 第三阶段: 基础数据
$PSQL yebailing_db -f data_init_mvp.sql

# 第四阶段: 业务数据
$PSQL yebailing_db -f data_cost_card_import.sql
$PSQL yebailing_db -f data_sop_import.sql

# 第五阶段: 订单系统扩展 (需要在视图之前)
$PSQL yebailing_db -f schema_extension_order_system.sql

# 第六阶段: 视图
$PSQL yebailing_db -f views_financial_analysis.sql
$PSQL yebailing_db -f views_operations_kpi.sql
```

---

## 已知问题与解决方案

### 1. UNIQUE约束语法错误

**问题**: schema_core_mvp.sql 中包含 `COALESCE()` 的 UNIQUE 约束会失败

```sql
-- 错误示例
CONSTRAINT uk_unit_conversion UNIQUE (from_unit_id, to_unit_id, COALESCE(product_id, 0))
```

**解决**: 手动创建缺失的表时移除 COALESCE：

```sql
CREATE TABLE unit_conversion (
    conversion_id SERIAL PRIMARY KEY,
    from_unit_id INT NOT NULL,
    to_unit_id INT NOT NULL,
    conversion_factor DECIMAL(10,4) NOT NULL,
    product_id INT,
    CONSTRAINT fk_from_unit FOREIGN KEY (from_unit_id) REFERENCES unit_of_measure(unit_id),
    CONSTRAINT fk_to_unit FOREIGN KEY (to_unit_id) REFERENCES unit_of_measure(unit_id)
);
```

### 2. 订单系统表依赖顺序

**问题**: schema_extension_order_system.sql 中 `sales_order` 引用 `group_buy_deal`，但后者在文件中定义较后

**解决**: 按以下顺序手动创建表：
1. group_buy_platform
2. product_package
3. package_item
4. group_buy_deal
5. sales_order
6. sales_order_item

### 3. explode_bom 函数列名不匹配

**问题**: 原函数引用 `unit_price_encrypted` 但表中是 `unit_price`

**解决**: 更新函数使用正确的列名：

```sql
COALESCE(ri.unit_price, 0)::DECIMAL AS unit_cost
-- 替代原来的
-- decrypt_cost(ri.unit_price_encrypted) AS unit_cost
```

### 4. recipe_item 数据导入

**注意**: data_cost_card_import.sql 中的配方明细使用 DO $$ 匿名块，需要设置加密密钥：

```sql
SET app.encryption_key = 'ybl-restaurant-encryption-key-2025';
```

---

## 验证测试

### 检查表数量

```sql
SELECT count(*) FROM pg_tables WHERE schemaname = 'public';
-- 预期: 40张表
```

### 检查数据量

```sql
SELECT 'product' as table_name, count(*) FROM product
UNION ALL SELECT 'recipe', count(*) FROM recipe
UNION ALL SELECT 'recipe_item', count(*) FROM recipe_item
UNION ALL SELECT 'sop', count(*) FROM standard_operating_procedure;
-- 预期: 323产品, 87配方, 360配方明细, 44 SOP
```

### 测试 BOM 分解

```sql
SET app.encryption_key = 'ybl-restaurant-encryption-key-2025';

SELECT level, ingredient_name, total_quantity, unit_name
FROM explode_bom(
    (SELECT product_id FROM product WHERE product_name = '贵州非遗丝娃娃'),
    1.0
);
```

### 查看核心视图

```sql
-- 双成本率分析视图
SELECT * FROM v_sales_summary_dual_cost_rate LIMIT 5;

-- 门店运营KPI
SELECT * FROM v_store_daily_operations LIMIT 5;
```

---

## 常见问题

### pgcrypto 扩展失败

```bash
# 确保有超级用户权限
psql yebailing_db -c "CREATE EXTENSION pgcrypto;" -U postgres
```

### 中文乱码

```bash
# 检查数据库编码
psql yebailing_db -c "SHOW server_encoding;"
# 应该显示 UTF8
```

### 连接问题

```bash
# 使用完整路径
/opt/homebrew/opt/postgresql@15/bin/psql yebailing_db

# 或确保 PATH 设置正确
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
```

---

## 下一步: 云端同步

本地部署完成后，可以配置云端同步：

1. **PostgreSQL 逻辑复制** - 适合 Supabase/Neon
2. **pg_dump 定时备份** - 适合任意云 PostgreSQL
3. **外部数据包装器(FDW)** - 适合只读同步场景

详见云部署研究文档。
