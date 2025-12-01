-- ============================================
-- 野百灵数据库 - Supabase部署脚本
-- 生成时间: 2025-11-28
-- 版本: v2.7.0
-- ============================================

-- 说明：本文件按依赖顺序合并所有SQL脚本
-- 执行方式：在Supabase SQL Editor中直接执行

-- ============================================
-- 第一部分：启用扩展
-- ============================================
-- Supabase默认已启用部分扩展，下面语句确保必要扩展可用

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS pg_trgm;
CREATE EXTENSION IF NOT EXISTS btree_gin;

-- 设置加密密钥（重要：生产环境应使用安全方式设置）
DO $$
BEGIN
    PERFORM set_config('app.encryption_key', 'yebailing_secure_key_2024', false);
END $$;

-- ============================================
-- 以下为占位说明
-- 完整部署需要按顺序执行以下文件：
-- ============================================

/*
执行顺序：

1. Schema文件（5个）：
   - db/schema/schema_core_mvp.sql           (62KB) - 核心24张表
   - db/schema/schema_extension_order_system.sql (19KB) - 订单扩展13张表
   - db/schema/schema_platform_data.sql      (12KB) - 平台数据4张表
   - db/schema/schema_product_sku.sql        (9KB)  - SKU规格表
   - db/schema/schema_store_purchase_price.sql (19KB) - 采购价格表

2. Functions文件（6个）：
   - db/functions/functions.sql              (21KB) - 基础函数
   - db/functions/functions_cost_encryption.sql (22KB) - 成本加密
   - db/functions/functions_bom_explosion.sql (4KB) - BOM分解
   - db/functions/procedures_data_validation.sql (3KB) - 数据验证
   - db/functions/triggers_automatic_calculation.sql (2KB) - 自动计算
   - db/functions/triggers_price_calculation.sql (19KB) - 价格计算

3. Views文件（3个）：
   - db/views/views_financial_analysis.sql   (4KB)  - 财务分析
   - db/views/views_operations_kpi.sql       (19KB) - 运营KPI
   - db/views/views_price_comparison.sql     (18KB) - 价格对比(7个视图)

4. Data文件（8个）：
   - db/data/data_init_mvp.sql              (5KB)  - 基础初始化
   - db/data/data_organization_stores.sql    (9KB)  - 组织与门店
   - db/data/data_raw_materials.sql          (34KB) - 原材料
   - db/data/data_products_recipes.sql       (390KB)- 产品与配方
   - db/data/data_init_sku.sql              (18KB) - SKU初始化
   - db/data/data_cost_card_import.sql       (627KB)- 成本卡
   - db/data/data_sop_import.sql            (195KB)- SOP数据
   - db/data/data_new_mushroom_products.sql  (27KB) - 新增菌菇产品

总计：约1.5MB SQL脚本
*/
