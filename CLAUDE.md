# 野百灵餐饮集团 - 数据库项目

## 项目概述

| 属性 | 值 |
|-----|---|
| 数据库 | PostgreSQL 15 |
| 云端数据库 | Supabase (wdpeoyugsxqnpwwtkqsl) |
| 表数量 | 120张 |
| 产品数 | 300+ |
| 门店数 | 6 (野百灵2 + 宁桂杏4) |
| 规范化 | 第三范式 (3NF) |

---

## 技术栈

| 组件 | 技术选型 |
|------|----------|
| 数据库 | PostgreSQL 15 |
| 云端托管 | Supabase |
| 开发语言 | SQL, Python 3 |
| Python库 | pandas, openpyxl, psycopg2 |
| 加密 | pgcrypto |
| 扩展 | uuid-ossp, pg_trgm, btree_gin |

---

## 核心业务规则

**关键计算公式**:
```
菜品收入(折后) = 销售额(折前) - 菜品优惠
理论成本 = 销售数量 × 产品单品成本
实际成本率 = 理论成本 / 菜品收入(折后) × 100%
```

**BOM分解**: 半成品需递归分解到原材料 (共11个半成品)

详细规则见 `docs/BUSINESS_RULES.md`

---

## 项目结构

```
Database/
├── db/                    # 数据库文件（分层结构）
│   ├── schema/           # 表结构定义
│   ├── functions/        # 函数/触发器
│   ├── views/            # 视图
│   ├── data/             # 数据导入SQL
│   ├── scripts/          # Python脚本
│   └── validation/       # 验证报告
├── source_data/           # 原始数据（不推送GitHub）
├── docs/                  # 项目文档
└── CLAUDE.md
```

---

## 文档索引

### 核心文档

| 文档 | 说明 |
|-----|------|
| docs/DESIGN.md | 数据库架构设计、ER图、表结构详解 |
| docs/BUSINESS_RULES.md | 业务规则详解、计算逻辑 |
| docs/DEPLOYMENT.md | 本地部署指南 |
| docs/SUPABASE.md | Supabase 云端部署 |

### 专项文档

| 文档 | 说明 |
|-----|------|
| docs/PRICE_SYSTEM.md | 采购价格管理系统 (v2.6.0) |
| docs/入库单识别与处理规则.md | OCR识别规则 |
| docs/线上平台数据分析规则.md | 美团/点评数据分析 |

### 项目管理

| 文档 | 说明 |
|-----|------|
| docs/CHANGELOG.md | 版本历史 |
| docs/README.md | 文档导航 |
| docs/项目介绍.md | 项目全貌（对外展示） |

### 分析报告

| 文档 | 说明 |
|-----|------|
| docs/reports/ | 数据验证报告、对比分析报告 |

---

## 快速启动

```bash
# 本地部署
psql yebailing_db -f db/schema/IMS_schema_core_mvp.sql
psql yebailing_db -f db/data/IMS_data_init_mvp.sql

# Supabase 部署
python3 db/scripts/supabase_upload_v2.py
```

详细步骤见 `docs/DEPLOYMENT.md` 或 `docs/SUPABASE.md`

---

## 相关链接

- GitHub: https://github.com/YukikoYoung/SmartIce-Database
- Supabase: https://supabase.com/dashboard/project/wdpeoyugsxqnpwwtkqsl
