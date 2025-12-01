# 采购价格管理系统

> v2.6.0 新增

## 系统概述

分离标准核定价与实际采购价，支持纵向（采购价 vs 标准价）和横向（跨门店）价格对比分析。

## 核心表

| 表名 | 说明 |
|-----|------|
| `product_sku` | SKU 规格表 - 支持同一原材料多规格（如：盐-小袋500g、盐-大袋25kg） |
| `store_purchase_price` | 门店采购价格表 - 记录各门店实际采购价格 |
| `price_variance_threshold` | 品类预警阈值配置表 |

## 分析视图 (7个)

| 视图 | 用途 |
|-----|------|
| `v_price_comparison_vertical` | 纵向对比（采购价 vs 标准价） |
| `v_price_comparison_horizontal` | 横向对比（跨门店） |
| `v_cross_store_price_matrix` | 价格矩阵透视表 |
| `v_price_anomaly_list` | 价格异常列表 |
| `v_sku_price_history` | SKU 价格历史趋势 |
| `v_store_price_summary` | 门店价格健康评分 |
| `v_category_price_overview` | 品类价格概览 |

## 品类预警阈值

| 品类 | 上浮警告 | 上浮严重 | 下浮警告 | 下浮严重 |
|-----|---------|---------|---------|---------|
| 肉类 | 15% | 25% | -10% | -15% |
| 海鲜 | 20% | 30% | -15% | -25% |
| 蔬菜 | 25% | 35% | -20% | -30% |
| 干杂/调料 | 10% | 15% | -5% | -10% |
| 油类 | 10% | 15% | -5% | -10% |

## 部署顺序

```bash
psql yebailing_db -f db/schema/schema_product_sku.sql
psql yebailing_db -f db/schema/schema_store_purchase_price.sql
psql yebailing_db -f db/functions/triggers_price_calculation.sql
psql yebailing_db -f db/views/views_price_comparison.sql
psql yebailing_db -f db/data/data_init_sku.sql
```
