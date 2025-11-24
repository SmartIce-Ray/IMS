# 野百灵餐饮集团 - 数据库项目

## 项目概述

| 属性 | 值 |
|-----|---|
| 数据库 | PostgreSQL 15 (Homebrew) |
| 数据库名 | yebailing_db |
| 表数量 | 47张 (核心24 + 扩展13 + 销售3 + 平台4 + 其他3) |
| 产品数 | 551 (野百灵359 + 宁桂杏192) |
| 配方数 | 87 |
| 门店数 | 6 (野百灵2 + 宁桂杏4) |
| 规范化 | 第三范式 (3NF) |
| 扩展依赖 | pgcrypto, uuid-ossp, pg_trgm, btree_gin |

---

## 技术栈

- **数据库**: PostgreSQL 15
- **开发语言**: SQL, Python 3
- **Python库**: pandas, openpyxl, psycopg2
- **加密**: pgcrypto (成本数据加密)
- **部署**: Homebrew, macOS

---

## 核心业务规则

**关键计算公式**:
```
菜品收入(折后) = 销售额(折前) - 菜品优惠
理论成本 = 销售数量 × 产品单品成本
实际成本率 = 理论成本 / 菜品收入(折后) × 100%  ← 永远用折后收入
```

**BOM分解**: 半成品需递归分解到原材料 (共11个半成品)

**详细规则**: 见 `docs/BUSINESS_RULES.md`

---

## 文档索引

| 文档 | 说明 |
|-----|------|
| `docs/DESIGN.md` | 数据库架构设计、ER图、表结构详解 |
| `docs/BUSINESS_RULES.md` | 业务规则详解、计算逻辑、公式说明 |
| `docs/DEPLOYMENT.md` | 部署指南、安装步骤、初始化流程 |
| `docs/DATA_VALIDATION.md` | 数据验证报告、质量评分 |
| `docs/数据验证报告_2025-11-25.md` | Excel vs 数据库完整性验证报告 |
| `docs/入库单识别与处理规则.md` | 手写入库单OCR识别与交叉验证规则 |
| `docs/线上平台数据分析规则.md` | 美团/点评平台数据分析方法与案例 |
| `docs/数据库结构与内容报告_2025-11-25.md` | 完整数据库结构与内容报告 |

---

## 文件结构索引

### SQL脚本

**表结构**:
- `schema_core_mvp.sql` - 核心MVP表结构 (24张)
- `schema_extension_order_system.sql` - 订单系统扩展 (13张)
- `schema_platform_data.sql` - 线上平台数据表 (4张)

**函数与逻辑**:
- `functions_cost_encryption.sql` - 成本加密/解密函数
- `functions_bom_explosion.sql` - BOM递归分解函数
- `triggers_automatic_calculation.sql` - 自动计算触发器
- `procedures_data_validation.sql` - 数据验证存储过程

**视图**:
- `views_financial_analysis.sql` - 双成本率分析视图
- `views_operations_kpi.sql` - 运营KPI视图

**数据导入**:
- `data_organization_stores.sql` - 组织架构+门店
- `data_cost_card_import.sql` - 成本卡导入
- `data_sop_import.sql` - SOP导入
- `data_init_mvp.sql` - 初始化数据

### Python脚本

- `generate_cost_card_sql.py` - 从Excel生成成本卡SQL
- `generate_product_recipe_sql.py` - 从Excel生成配方SQL
- `generate_sop_sql.py` - 从Excel生成SOP SQL
- `etl_excel_to_order_system.py` - Excel数据导入订单系统
- `import_platform_data.py` - 线上平台数据导入
- `utils/normalize_name.py` - 产品名称规范化工具

### 配置文件

- `.gitignore` - Git排除规则（已排除Excel、图片等大文件）
- `计量标准.md` - 计量单位标准体系
- `数据录入规则与迁移指南.md` - 数据录入规则
- `数据录入规则_订单系统扩展.md` - 订单系统数据录入规则

---

## 数据状态

### 已导入数据

| 数据类型 | 数量 | 说明 |
|---------|------|------|
| 品牌 | 3个 | 野百灵、宁桂杏、邦兰埔 |
| 门店 | 6家 | 野百灵2家 + 宁桂杏4家 |
| 产品 | 551个 | 野百灵359 + 宁桂杏192 |
| 配方 | 87个 | 完整BOM配方 |
| SOP | 44个 | 标准操作流程 |
| 销售记录 | 567条 | 6门店销售汇总数据 |
| 平台数据 | 2,566条 | 美团+点评日运营数据 |

**数据完整性**: 99.999% (Excel vs 数据库验证通过)

**详细数据报告**: 见 `docs/数据库结构与内容报告_2025-11-25.md`

---

## 版本历史

| 版本 | 日期 | 说明 |
|-----|------|-----|
| v2.3.0 | 2025-11-25 | GitHub精简版推送，移除大文件，添加.gitignore |
| v2.2.0 | 2025-11-24 | 线上平台数据表 + 宁桂杏门店 + 美团点评数据导入 |
| v2.1.0 | 2025-11-23 | 销售数据导入 + 产品别名表 + 品牌关联 |
| v2.0.0 | 2025-11-22 | 完整47表 + 订单扩展 + SOP导入 |
| v1.0.0 | 2025-11-21 | MVP核心24表 |

---

## 快速启动

### 部署数据库
```bash
# 1. 安装 PostgreSQL
brew install postgresql@15 && brew services start postgresql@15

# 2. 创建数据库
createdb yebailing_db

# 3. 按顺序执行SQL
psql yebailing_db -f schema_core_mvp.sql
psql yebailing_db -f data_init_mvp.sql
# ... (详细步骤见 docs/DEPLOYMENT.md)
```

### 查询数据
```bash
# 连接数据库
psql yebailing_db

# 查看表列表
\dt

# 查看产品数量
SELECT brand_id, COUNT(*) FROM product GROUP BY brand_id;
```

**详细部署指南**: 见 `docs/DEPLOYMENT.md`

---

## GitHub仓库

- **仓库地址**: https://github.com/YukikoYoung/SmartIce-Database
- **仓库内容**: 仅包含SQL脚本、Python脚本、文档（已排除Excel数据文件、图片等）
- **文件数量**: 50个核心文件
- **项目大小**: 约2.6MB

---

## 相关链接

- [PostgreSQL 15 官方文档](https://www.postgresql.org/docs/15/)
- [pgcrypto 加密扩展](https://www.postgresql.org/docs/15/pgcrypto.html)
- [pandas 数据处理](https://pandas.pydata.org/)
