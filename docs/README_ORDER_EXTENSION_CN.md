# 野百灵餐饮集团 - 订单系统扩展安装指南

**版本**: v2.0.0-order-extension
**更新日期**: 2025-11-21
**扩展类型**: 方案B - 完整订单模型

---

## 📋 扩展概述

本次扩展在MVP数据库基础上,新增了完整的订单管理系统,支持:

✅ **16项核心运营指标** (订单数、人数、开台数、翻台率、人均消费、客单价等)
✅ **多渠道销售跟踪** (门店直销、美团、抖音、饿了么等)
✅ **套餐与团购管理** (套餐定义、团购活动、平台佣金计算)
✅ **完整订单明细** (订单主表+明细表,支持双成本率自动计算)

---

## 🚀 快速安装

### 前置条件

1. ✅ 已安装PostgreSQL 14+
2. ✅ 已完成MVP数据库初始化(参考 `README_MVP_CN.md`)
3. ✅ 已执行以下脚本:
   - schema_core_mvp.sql
   - functions_cost_encryption.sql
   - functions_bom_explosion.sql
   - triggers_automatic_calculation.sql
   - procedures_data_validation.sql
   - data_init_mvp.sql

### 安装步骤

#### 第1步: 执行订单系统扩展SQL

```bash
# 1. 创建6张新表(订单主表、明细表、套餐、团购等)
psql ybl_restaurant -f schema_extension_order_system.sql

# 2. 创建运营KPI视图(16项指标+10个分析视图)
psql ybl_restaurant -f views_operations_kpi.sql

# 验证安装
psql ybl_restaurant -c "\dt sales_order*"
psql ybl_restaurant -c "\dt product_package*"
psql ybl_restaurant -c "\dt group_buy*"
psql ybl_restaurant -c "\dv v_store_daily_operations"
```

#### 第2步: 验证表结构

```sql
-- 查看新增的6张表
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_name IN (
      'sales_order',
      'sales_order_item',
      'product_package',
      'package_item',
      'group_buy_platform',
      'group_buy_deal'
  );

-- 应该返回6行记录
```

#### 第3步: 验证预置数据

```sql
-- 查看预置的团购平台
SELECT platform_name, platform_type, default_commission_rate
FROM group_buy_platform;

-- 应该显示:
-- 美团         | meituan   | 0.0800
-- 大众点评     | dianping  | 0.0800
-- 抖音团购     | douyin    | 0.0600
-- 饿了么       | eleme     | 0.1800
```

---

## 📊 新增表结构说明

### 1. sales_order - 订单主表

**用途**: 记录每笔订单的完整信息

**关键字段**:
- `order_code`: 订单编号(唯一业务主键)
- `order_type`: 订单类型(堂食/外卖/外带)
- `sales_channel`: 销售渠道(门店/美团/抖音等)
- `guest_count`: 就餐人数
- `dining_duration_minutes`: 就餐时长(自动计算)
- `subtotal_amount`: 小计金额(折前)
- `final_amount`: 实收金额(折后) ⭐核心
- `platform_commission_amount`: 平台佣金(自动计算)

**示例查询**:
```sql
-- 查询某天的所有订单
SELECT order_code, order_type, guest_count, final_amount
FROM sales_order
WHERE order_date = '2025-11-21'
  AND order_status = 'completed'
ORDER BY order_datetime DESC;
```

### 2. sales_order_item - 订单明细表

**用途**: 记录订单中每个产品的销售明细

**关键字段**:
- `order_id`: 关联订单主表
- `product_id`: 关联产品表
- `quantity`: 销售数量
- `unit_price`: 原价
- `actual_price`: 折后单价
- `theoretical_cost`: 理论成本(自动计算)
- `standard_cost_rate`: 标准成本率(GENERATED列)
- `actual_cost_rate`: 实际成本率(GENERATED列) ⭐核心

**示例查询**:
```sql
-- 查询某订单的明细及成本率
SELECT
    product_name,
    quantity,
    unit_price,
    actual_price,
    theoretical_cost,
    standard_cost_rate,
    actual_cost_rate
FROM sales_order_item
WHERE order_id = 1;
```

### 3. product_package - 套餐定义表

**用途**: 定义套餐组合(如双人套餐、家庭套餐)

**关键字段**:
- `package_code`: 套餐编码(唯一)
- `package_name`: 套餐名称
- `selling_price`: 套餐售价
- `original_total_price`: 原价合计
- `max_daily_sales`: 每日限售数量

### 4. package_item - 套餐明细表

**用途**: 定义套餐包含哪些产品

**关键字段**:
- `package_id`: 关联套餐定义
- `product_id`: 关联产品
- `quantity`: 产品数量
- `is_optional`: 是否可选配

### 5. group_buy_platform - 团购平台表

**用途**: 管理第三方团购平台(已预置4个平台)

**预置平台**:
- 美团(佣金8%)
- 大众点评(佣金8%)
- 抖音团购(佣金6%)
- 饿了么(佣金18%)

### 6. group_buy_deal - 团购套餐表

**用途**: 记录在各平台上线的团购套餐活动

**关键字段**:
- `deal_code`: 团购编码
- `platform_id`: 关联平台
- `deal_price`: 团购价
- `commission_rate`: 佣金费率(覆盖平台默认值)
- `sold_count`: 已售数量
- `daily_stock`: 每日库存

---

## 📈 16项运营指标视图

### v_store_daily_operations - 核心运营指标视图 ⭐

**用途**: 计算门店每日16项核心KPI

**包含指标**:
1. order_count - 订单数量
2. total_guest_count - 就餐人数
3. table_count - 开台数
4. avg_dining_duration_minutes - 平均就餐时长
5. avg_guest_count_per_order - 平均用餐人数
6. per_capita_spending - 人均消费
7. avg_order_value - 客单价
8. table_turnover_rate - 翻台率
9. total_presales_amount - 销售额(折前)
10. total_final_amount - 实收金额(折后)
11. total_discount_amount - 折扣金额
12. discount_rate - 折扣率
13. total_manual_discount - 人工折扣
14. total_coupon_discount - 优惠券折扣
15. total_membership_discount - 会员折扣
16. total_rounding_amount - 抹零金额

**示例查询**:
```sql
-- 查询某门店11月份的每日运营指标
SELECT
    order_date,
    order_count,
    total_guest_count,
    per_capita_spending,
    avg_order_value,
    discount_rate,
    total_final_amount
FROM v_store_daily_operations
WHERE store_id = 1
  AND order_date >= '2025-11-01'
  AND order_date < '2025-12-01'
ORDER BY order_date DESC;
```

### 其他分析视图

| 视图名 | 用途 |
|-------|------|
| v_payment_channel_analysis | 支付渠道分析(现金/微信/支付宝等) |
| v_sales_channel_analysis | 销售渠道分析(堂食/外卖/平台) |
| v_platform_groupbuy_summary | 平台团购汇总(美团 vs 抖音对比) |
| v_product_sales_ranking | 产品销售排行榜(含双成本率) |
| v_hourly_sales_distribution | 小时销售分布(时段分析) |
| v_waiter_performance | 服务员绩效分析 |
| v_package_sales_analysis | 套餐销售分析 |
| v_groupbuy_deal_performance | 团购套餐效果分析 |
| v_monthly_summary | 月度汇总视图 |

---

## 📥 数据导入

### 方式1: 使用Python ETL脚本(推荐)

```bash
# 准备Python环境
pip3 install pandas openpyxl psycopg2-binary

# 导入订单明细数据
python3 etl_excel_to_order_system.py
```

**脚本功能**:
- ✅ 从POS系统Excel导入订单数据
- ✅ 自动匹配产品编码
- ✅ 自动计算理论成本(调用BOM分解函数)
- ✅ 自动生成双成本率
- ✅ 支持多渠道订单(堂食/外卖/团购)

### 方式2: 手动录入测试数据

```sql
-- 1. 创建一个测试订单
INSERT INTO sales_order (
    order_code, store_id, order_date, order_datetime,
    order_type, sales_channel, table_number, guest_count,
    subtotal_amount, discount_amount, final_amount,
    payment_method, order_status
) VALUES (
    'ORD-TEST-001', 1, CURRENT_DATE, NOW(),
    'dine_in', 'store', 'A08', 4,
    500.00, 50.00, 450.00,
    'wechat', 'completed'
);

-- 2. 添加订单明细(假设已有产品ID=101)
INSERT INTO sales_order_item (
    order_id, product_id, product_code, product_name,
    quantity, unit_price, discount_rate, actual_price,
    line_subtotal, line_discount, line_total,
    recipe_id, theoretical_cost
) VALUES (
    CURRVAL('sales_order_order_id_seq'), 101, 'FIN-001', '云山雪花吊龙',
    2.00, 68.00, 0.10, 61.20,
    136.00, 13.60, 122.40,
    1, 60.00
);

-- 3. 查询16项运营指标(会自动汇总)
SELECT * FROM v_store_daily_operations
WHERE order_date = CURRENT_DATE;
```

---

## ✅ 验证安装成功

### 测试1: 查看16项运营指标

```sql
SELECT * FROM v_store_daily_operations LIMIT 1;
```

**预期结果**: 返回包含16项指标的记录

### 测试2: 测试双成本率自动计算

```sql
-- 插入一条测试订单明细
INSERT INTO sales_order_item (
    order_id, product_id, product_code, product_name,
    quantity, unit_price, actual_price,
    line_subtotal, line_total,
    theoretical_cost
) VALUES (
    1, 101, 'FIN-001', '测试产品',
    1.00, 100.00, 90.00,
    100.00, 90.00,
    40.00
);

-- 查询自动计算的成本率
SELECT
    product_name,
    standard_cost_rate,  -- 应该 ≈ 40.00%
    actual_cost_rate     -- 应该 ≈ 44.44%
FROM sales_order_item
WHERE product_name = '测试产品';
```

**预期结果**:
- standard_cost_rate ≈ 40.00% (40/100)
- actual_cost_rate ≈ 44.44% (40/90)

### 测试3: 查询平台团购对比

```sql
SELECT
    platform_name,
    SUM(order_count) AS total_orders,
    SUM(total_revenue) AS total_revenue,
    SUM(total_commission_amount) AS total_commission
FROM v_platform_groupbuy_summary
GROUP BY platform_name;
```

**预期结果**: 显示各平台的团购统计(如果有数据)

---

## 📝 数据录入规则

**详细规则请参考**: `数据录入规则_订单系统扩展.md`

### 需要准备的新Excel文件

| 文件编号 | 文件名 | 用途 | 优先级 |
|---------|--------|------|--------|
| 文件5 | POS订单明细_YYYY年MM月.xlsx | 订单数据 | ⭐⭐⭐ |
| 文件6 | 综合营业统计_YYYY年MM月.xlsx | 每日汇总数据(可选) | ⭐⭐ |
| 文件7 | 套餐定义.xlsx | 套餐组合 | ⭐⭐ |
| 文件8 | 团购套餐活动.xlsx | 团购活动 | ⭐⭐ |

**优先级说明**:
- ⭐⭐⭐: 必须准备
- ⭐⭐: 推荐准备
- ⭐: 可选

---

## 🔍 常用查询示例

### 1. 查询某门店某月的每日运营指标

```sql
SELECT
    order_date,
    order_count AS 订单数,
    total_guest_count AS 就餐人数,
    table_count AS 开台数,
    per_capita_spending AS 人均消费,
    avg_order_value AS 客单价,
    discount_rate AS 折扣率,
    total_final_amount AS 实收金额
FROM v_store_daily_operations
WHERE store_id = 1
  AND order_date >= '2025-11-01'
  AND order_date < '2025-12-01'
ORDER BY order_date DESC;
```

### 2. 对比不同销售渠道的效果

```sql
SELECT
    sales_channel AS 销售渠道,
    SUM(order_count) AS 订单数,
    SUM(total_final_amount) AS 总收入,
    AVG(avg_order_value) AS 平均客单价,
    SUM(total_platform_commission) AS 平台佣金,
    SUM(net_revenue) AS 净收入
FROM v_sales_channel_analysis
WHERE order_date >= '2025-11-01'
GROUP BY sales_channel
ORDER BY 总收入 DESC;
```

### 3. 分析美团 vs 抖音团购效果

```sql
SELECT
    platform_name AS 平台,
    SUM(order_count) AS 订单数,
    SUM(total_revenue) AS 总营收,
    AVG(avg_commission_rate) * 100 AS 平均佣金率,
    SUM(total_commission_amount) AS 佣金金额,
    SUM(net_revenue) AS 净收入
FROM v_platform_groupbuy_summary
WHERE order_date >= '2025-11-01'
GROUP BY platform_name;
```

### 4. 查看产品销售排行榜(按毛利率)

```sql
SELECT
    product_name AS 产品名称,
    total_quantity AS 销售数量,
    total_final_amount AS 销售额,
    total_theoretical_cost AS 理论成本,
    actual_cost_rate AS 实际成本率,
    gross_margin_rate AS 毛利率
FROM v_product_sales_ranking
WHERE order_date >= '2025-11-01'
  AND store_id = 1
ORDER BY gross_margin_rate DESC
LIMIT 20;
```

### 5. 分析不同时段的销售情况

```sql
SELECT
    hour_of_day AS 小时,
    SUM(order_count) AS 订单数,
    SUM(total_guest_count) AS 就餐人数,
    SUM(total_revenue) AS 销售额
FROM v_hourly_sales_distribution
WHERE order_date >= '2025-11-01'
  AND store_id = 1
GROUP BY hour_of_day
ORDER BY hour_of_day;
```

---

## 📞 技术支持

### 遇到问题时的排查步骤

1. **检查表是否存在**:
   ```sql
   \dt sales_order*
   \dt product_package*
   \dt group_buy*
   ```

2. **检查视图是否创建**:
   ```sql
   \dv v_store_daily_operations
   \dv v_platform_groupbuy_summary
   ```

3. **查看PostgreSQL日志**:
   ```bash
   tail -f /var/log/postgresql/postgresql-14-main.log
   ```

4. **检查触发器是否正常**:
   ```sql
   SELECT tgname FROM pg_trigger WHERE tgrelid = 'sales_order'::regclass;
   ```

### 常见错误及解决方案

| 错误信息 | 原因 | 解决方案 |
|---------|------|---------|
| relation "sales_order" does not exist | 未执行扩展SQL | 执行 schema_extension_order_system.sql |
| column "standard_cost_rate" does not exist | GENERATED列未创建 | 删除表重建或使用ALTER TABLE添加 |
| function "explode_bom" does not exist | 未安装BOM分解函数 | 执行 functions_bom_explosion.sql |
| permission denied for table sales_order | 权限不足 | GRANT SELECT ON sales_order TO 用户名; |

---

## 📦 完整安装顺序总结

```bash
# MVP基础(如已安装可跳过)
createdb ybl_restaurant
psql ybl_restaurant -c "CREATE EXTENSION pgcrypto;"
psql ybl_restaurant -f schema_core_mvp.sql
psql ybl_restaurant -f functions_cost_encryption.sql
psql ybl_restaurant -f functions_bom_explosion.sql
psql ybl_restaurant -f triggers_automatic_calculation.sql
psql ybl_restaurant -f procedures_data_validation.sql
psql ybl_restaurant -f data_init_mvp.sql

# ⭐订单系统扩展(新增)
psql ybl_restaurant -f schema_extension_order_system.sql      # 6张新表
psql ybl_restaurant -f views_operations_kpi.sql               # 10个分析视图

# 财务分析视图(如未安装)
psql ybl_restaurant -f views_financial_analysis.sql

# 验证安装
psql ybl_restaurant -c "SELECT COUNT(*) FROM information_schema.tables WHERE table_schema='public';"
psql ybl_restaurant -c "SELECT COUNT(*) FROM information_schema.views WHERE table_schema='public';"
```

**预期结果**:
- 表数量: 37张(24张MVP + 6张扩展 + 3张staging + 4张系统支持)
- 视图数量: 12个(2个财务 + 10个运营)

---

## 🎯 下一步

1. ✅ **准备数据**: 参考 `数据录入规则_订单系统扩展.md` 准备Excel文件
2. ✅ **导入数据**: 使用 `etl_excel_to_order_system.py` 导入订单数据
3. ✅ **查询分析**: 使用10个分析视图生成运营报表
4. ✅ **持续优化**: 根据实际业务需求调整视图和查询

---

**版本**: v2.0.0-order-extension
**最后更新**: 2025-11-21
**相关文档**:
- MVP快速入门: `README_MVP_CN.md`
- 基础数据录入: `数据录入规则与迁移指南.md`
- 订单系统数据录入: `数据录入规则_订单系统扩展.md`
- 完整架构文档: `CLAUDE.md`
