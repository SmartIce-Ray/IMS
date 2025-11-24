# 野百灵餐饮集团 - 数据库项目

## 项目概述

| 属性 | 值 |
|-----|---|
| 数据库 | PostgreSQL 15 (Homebrew) |
| 数据库名 | yebailing_db |
| 表数量 | 47张 (核心24 + 扩展13 + 销售3 + 平台4 + 其他3) |
| 产品数 | 359 |
| 配方数 | 87 |
| 门店数 | 8 (野百灵6 + 宁桂杏2) |
| 规范化 | 第三范式 (3NF) |
| 扩展依赖 | pgcrypto, uuid-ossp, pg_trgm, btree_gin |
| 加密密钥 | `SET app.encryption_key = 'ybl-restaurant-encryption-key-2025';` |

---

## 架构设计

@import "docs/DESIGN.md"

详细架构图、ER图、数据流图见 `docs/DESIGN.md`

---

## 核心业务规则

@import "docs/BUSINESS_RULES.md"

**关键公式速查**:
```
实际成本率 = 理论成本 / 菜品收入(折后) × 100%   ← 永远用折后收入
理论成本 = 销售数量 × 产品单品成本
BOM分解: 半成品需递归分解到原材料 (共11个半成品)
```

---

## 文件索引

### 表结构 (Schema)
| 文件 | 说明 | 表数量 |
|-----|------|-------|
| `schema_core_mvp.sql` | 核心MVP表结构 | 24张 |
| `schema_extension_order_system.sql` | 订单系统扩展 | 13张 |
| `schema_platform_data.sql` | 线上平台数据表 | 4张 |

### 函数与逻辑
| 文件 | 说明 |
|-----|------|
| `functions_cost_encryption.sql` | 成本加密/解密函数 (pgcrypto) |
| `functions_bom_explosion.sql` | BOM递归分解函数 |
| `triggers_automatic_calculation.sql` | 自动计算触发器 |
| `procedures_data_validation.sql` | 数据验证存储过程 |

### 数据导入
| 文件 | 说明 | 数据量 |
|-----|------|-------|
| `data_organization_stores.sql` | 组织架构+门店 | 4品牌, 6门店 |
| `data_cost_card_import.sql` | 成本卡导入 | 241原材料, 87产品 |
| `data_sop_import.sql` | SOP导入 | 44个SOP, 266原料 |
| `data_init_mvp.sql` | 初始化数据 | 单位、品类等 |

### 销售数据 (2025-11-24更新)
| 门店 | 统计周期 | 产品数 | 销售额(折前) | 菜品收入(折后) |
|------|----------|--------|--------------|----------------|
| 野百灵1958店(绵阳) | 2025-06至2025-10 | 96 | 2,609,287.64 | 2,353,060.48 |
| 野百灵德阳店 | 2025-08至2025-10 | 86 | 1,086,608.00 | 975,282.41 |
| 宁桂杏1958店 | 2025-01至2025-11 | 109 | 5,070,193.00 | 4,718,858.28 |
| 宁桂杏世贸店 | 2025-03至2025-11 | 106 | 5,070,266.00 | 4,584,672.83 |
| 宁桂杏上马店 | 2025-07至2025-11 | 88 | 3,549,038.00 | 3,090,493.94 |
| 宁桂杏江油店 | 2025-09至2025-11 | 83 | 800,593.00 | 756,117.32 |

**导入脚本**: `各门店截止10月销售数据统计/宁桂杏/import_ngx_sales.py`

### 线上平台数据 (2025-11-24导入)
| 门店 | 平台 | 记录数 | 日期范围 | 总成交额(优惠前) |
|------|------|--------|----------|------------------|
| 宁桂杏1958店 | 美团 | 326 | 2025-01-01~11-22 | 2,543,381.50 |
| 宁桂杏1958店 | 点评 | 326 | 2025-01-01~11-22 | 474,781.00 |
| 宁桂杏世贸店 | 美团 | 307 | 2025-01-20~11-22 | 1,283,372.10 |
| 宁桂杏世贸店 | 点评 | 307 | 2025-01-20~11-22 | 1,538,469.60 |
| 野百灵1958店 | 美团 | 175 | 2025-06-01~11-22 | 1,120,973.50 |
| 野百灵1958店 | 点评 | 175 | 2025-06-01~11-22 | 274,408.00 |

**导入脚本**: `2025年1-11月22日平台数据/import_platform_data.py`

### 视图
| 文件 | 说明 |
|-----|------|
| `views_financial_analysis.sql` | 双成本率分析视图 |
| `views_operations_kpi.sql` | 运营KPI视图 |

---

## 部署指南

@import "docs/DEPLOYMENT.md"

**快速部署命令**:
```bash
# 1. 安装 PostgreSQL
brew install postgresql@15 && brew services start postgresql@15

# 2. 创建数据库
createdb yebailing_db

# 3. 按顺序执行SQL (见 docs/DEPLOYMENT.md)
```

---

## 数据验证状态

@import "docs/DATA_VALIDATION.md"

**当前状态**: 84.0/100 (良好)

**待处理**:
- 37项缺失用量 (需业务确认)
- 8个产品数据来源不明
- 详见 `sop_validation_final_report.json`

---

## 表结构概览

```
第一层: 基础设施 (3张)
├── brand          品牌表
├── store          门店表
└── employee       员工表

第二层: 权限管理 (4张)
├── role           角色表
├── permission     权限表
├── role_permission
└── employee_role

第三层: 产品配方 (6张)
├── unit_of_measure    计量单位
├── unit_conversion    单位换算
├── product_category   品类
├── product           产品表 (成品/半成品/原材料统一)
├── recipe            配方表 (多版本)
└── recipe_item       配方明细 (BOM)

第四层: 供应链 (5张)
├── supplier          供应商
├── purchase_order    采购单
├── purchase_order_item
├── inventory         库存主表
└── inventory_transaction

第五层: 销售运营 (6张)
├── sales_detail      销售明细 (双成本率GENERATED列)
├── sales_summary     销售汇总 ⭐已导入数据
├── sales_order       订单主表 (扩展)
├── sales_order_item  订单明细 (扩展)
├── product_alias     产品别名表 (处理繁简体/POS命名差异)
└── group_buy_*       团购相关 (扩展)

第六层: 线上平台 (4张) ⭐新增
├── online_platform           平台定义 (美团/点评)
├── store_platform_account    门店平台账号关联
├── platform_daily_metrics    平台日运营数据 (90+字段)
└── v_platform_monthly_summary 月度汇总视图

第七层: 财务审计 (4张)
├── cost_snapshot     成本快照
├── price_history     价格历史
├── audit_log         审计日志
└── data_import_log   导入日志

第七层: SOP管理 (3张)
├── standard_operating_procedure
├── sop_ingredient
└── sop_procedure
```

---

## 核心函数

### BOM递归分解
```sql
-- 分解产品到原材料
SELECT * FROM explode_bom(product_id, quantity, brand_id);

-- 计算产品总成本
SELECT calculate_product_total_cost(product_id);
```

### 成本加密
```sql
-- 加密
SELECT encrypt_cost(123.45);

-- 解密 (需权限)
SELECT decrypt_cost(encrypted_bytea);
```

---

## 版本历史

| 版本 | 日期 | 说明 |
|-----|------|-----|
| v2.2.0 | 2025-11-24 | 线上平台数据表 + 宁桂杏门店 + 美团点评数据导入 |
| v2.1.0 | 2025-11-23 | 销售数据导入 + 产品别名表 + 品牌关联 |
| v2.0.0 | 2025-11-22 | 完整37表 + 订单扩展 + SOP导入 |
| v1.0.0 | 2025-11-21 | MVP核心24表 |

---

## 公司与品牌架构

| 公司 | 品牌 | brand_id | 说明 |
|------|------|----------|------|
| 有点东西餐饮管理有限公司 | 野百灵贵州酸汤 | 1 | 主营品牌，当前所有产品归属 |
| | 宁桂杏山野烤肉 | 2 | 已有平台数据 |
| | 邦兰埔东南亚Bistro | 3 | 规划中 |

**门店信息** (2025-11-24更新):

| store_id | 名称 | 品牌 | 城市 | 店长 | 开业日期 | 数据状态 |
|----------|------|------|------|------|----------|----------|
| 1 | 野百灵贵州酸汤火锅（德阳店） | 野百灵 | 德阳 | 杨攀 | 2025.8.23 | 销售数据 |
| 2 | 野百灵贵州酸汤火锅（1958店） | 野百灵 | 绵阳 | 梁笑天 | 2025.6.4 | 美团+点评 |
| 3 | 宁桂杏山野烤肉（上马Young Park） | 宁桂杏 | 绵阳 | 刘雪梅 | 2025.7.1 | - |
| 4 | 宁桂杏山野烤肉（江油首店） | 宁桂杏 | 江油 | 薛连 | 2025.10.1 | - |
| 7 | 宁桂杏山野烤肉（1958店） | 宁桂杏 | 绵阳 | 雷军 | 2025.1.1 | 美团+点评 |
| 8 | 宁桂杏山野烤肉（世贸店） | 宁桂杏 | 常熟 | 姜德刚 | 2025.3.8 | 美团+点评 |

---

## 产品名称规范化

### 繁简体转换
使用 `utils/normalize_name.py` 进行产品名称标准化:
- 繁体字 → 简体字 (如: 紙→纸, 麵→面, 雞→鸡)
- 全角括号 → 半角括号 (如: （）→ ())
- 去除首尾空格

### 产品别名表 (product_alias)
处理POS系统命名差异:
| 别名 | 标准名称 | 来源 |
|------|----------|------|
| 无粉紙巾 | 无粉纸巾 | traditional |
| 糟辣椒炒饭 | 糟辣椒蛋炒饭 | pos_mianyang |

---

## 数据导入注意事项

### Excel读取陷阱
1. **合计行**: Excel最后一行通常是合计，pandas读取时需排除
2. **销售额构成列**: 包含菜品/关联做法/关联加料/关联餐盒的明细分列
3. **skiprows=2**: 菜品销售统计Excel需要跳过前2行标题

### 不导入的数据类型
- 临时商品 (销售额通常很小)
- 销售额=0的赠品/营销文案项 (如: 非遗传承30年, 高山辣椒)
- 自助小料明细 (已包含在"非遗手工蘸料"中)

### 产品编码规则
| 前缀 | 类型 | 示例 |
|------|------|------|
| FP-JS-xxx | 酒水类 | FP-JS-001 纯生 |
| FP-RY-xxx | 软饮类 | FP-RY-001 可口可乐(听) |
| FP-HC-xxx | 耗材类 | FP-HC-001 无粉纸巾 |
| FP-ZL-xxx | 蘸料类 | FP-ZL-001 非遗手工蘸料 |
| FP-ZS-xxx | 主食类 | FP-ZS-001 糟辣椒蛋炒饭 |
| FP-QT-xxx | 其他类 | FP-QT-001 黑松露和牛开口笑 |

---

## 相关文档

- `docs/DESIGN.md` - 架构设计与ER图
- `docs/BUSINESS_RULES.md` - 业务规则详解
- `docs/DEPLOYMENT.md` - 部署指南
- `docs/DATA_VALIDATION.md` - 数据验证结果
- `docs/入库单识别与处理规则.md` - 手写入库单OCR识别与交叉验证规则
- `docs/线上平台数据分析规则.md` - 美团/点评平台数据分析方法与案例
- `utils/normalize_name.py` - 产品名称规范化工具
- `未匹配商品清单.md` - 未匹配产品分析报告
- `sop_validation_*.json` - SOP验证详细数据

