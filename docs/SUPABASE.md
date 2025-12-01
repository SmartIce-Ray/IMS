# Supabase 云端部署

> v2.8.0 新增

## 项目信息

| 属性 | 值 |
|-----|---|
| 项目名 | JeremyDong22's Project |
| 项目ID | wdpeoyugsxqnpwwtkqsl |
| Region | East US (North Virginia) |
| Dashboard | https://supabase.com/dashboard/project/wdpeoyugsxqnpwwtkqsl |
| 表数量 | 120张 |
| 函数数量 | 6个 |

## 云端数据状态

| 表 | 记录数 |
|---|-------|
| product | 300 |
| recipe | 67 |
| recipe_item | 9 |
| brand | 2 |
| store | 6 |
| supplier | 17 |
| employee | 6 |
| warehouse | 6 |

## Supabase 兼容性修复

部署过程中进行了以下 SQL 兼容性修复：

| 文件 | 修复内容 |
|-----|---------|
| IMS_schema_core_mvp.sql | COALESCE 约束改为唯一索引、GENERATED 列改为普通列、移除 ALTER SYSTEM |
| IMS_schema_extension_order_system.sql | 重新排列表创建顺序、GENERATED 列改为触发器计算 |
| IMS_functions.sql | 移除 `\c` psql 命令 |
| IMS_data_init_sku.sql | 约束名改为 `ON CONFLICT DO NOTHING` |
| IMS_data_raw_materials.sql | supplier 列名修正、supplier_type 类型修正 |
| IMS_data_organization_stores.sql | 移除 org_unit_id 引用 |

## 上传脚本

```bash
# 使用上传脚本部署到 Supabase
python3 db/scripts/supabase_upload_v2.py
```

## 连接信息

```bash
# 连接字符串格式
postgresql://postgres.[project-ref]:[password]@aws-0-[region].pooler.supabase.com:6543/postgres
```

## 注意事项

1. Supabase 使用 PgBouncer 连接池，需设置 `statement_cache_size=0`
2. 部分 PostgreSQL 高级特性在 Supabase 中受限
3. 建议使用 Supabase Dashboard SQL Editor 进行调试
