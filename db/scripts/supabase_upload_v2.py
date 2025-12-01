#!/usr/bin/env python3
"""
Supabase SQL Upload Script v2
使用urllib（无需额外安装）
"""

import json
import sys
import os
import urllib.request
import urllib.error
import time

# Supabase配置
PROJECT_REF = "wdpeoyugsxqnpwwtkqsl"
ACCESS_TOKEN = "sbp_5cb28319a97e93145a27596aea05a89a226d2014"
API_URL = f"https://api.supabase.com/v1/projects/{PROJECT_REF}/database/query"

def execute_sql(sql: str) -> dict:
    """执行SQL语句"""
    headers = {
        "Authorization": f"Bearer {ACCESS_TOKEN}",
        "Content-Type": "application/json"
    }

    data = json.dumps({"query": sql}).encode('utf-8')

    req = urllib.request.Request(API_URL, data=data, headers=headers, method='POST')

    try:
        with urllib.request.urlopen(req, timeout=300) as response:
            result = response.read().decode('utf-8')
            return {"success": True, "result": result}
    except urllib.error.HTTPError as e:
        error_body = e.read().decode('utf-8') if e.fp else str(e)
        return {"success": False, "error": f"HTTP {e.code}: {error_body}"}
    except Exception as e:
        return {"success": False, "error": str(e)}

def upload_file(filepath: str) -> bool:
    """上传单个SQL文件"""
    filename = os.path.basename(filepath)
    print(f"\n{'='*60}")
    print(f"上传: {filename}")
    print(f"{'='*60}")

    if not os.path.exists(filepath):
        print(f"  文件不存在: {filepath}")
        return False

    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"  读取文件失败: {e}")
        return False

    print(f"  文件大小: {len(content):,} 字符")
    print(f"  执行中...")

    result = execute_sql(content)

    if result["success"]:
        print(f"  成功!")
        return True
    else:
        print(f"  失败: {result['error'][:500]}")
        return False

def main():
    base_path = "/Users/apple/Desktop/品牌数据库/Database/db"

    # SQL文件执行顺序 (IMS_ 前缀)
    files_order = [
        # Schema
        "schema/IMS_schema_core_mvp.sql",
        "schema/IMS_schema_extension_order_system.sql",
        "schema/IMS_schema_platform_data.sql",
        "schema/IMS_schema_product_sku.sql",
        "schema/IMS_schema_store_purchase_price.sql",
        # Functions
        "functions/IMS_functions.sql",
        "functions/IMS_functions_cost_encryption.sql",
        "functions/IMS_functions_bom_explosion.sql",
        "functions/IMS_procedures_data_validation.sql",
        "functions/IMS_triggers_automatic_calculation.sql",
        "functions/IMS_triggers_price_calculation.sql",
        # Views
        "views/IMS_views_financial_analysis.sql",
        "views/IMS_views_operations_kpi.sql",
        "views/IMS_views_price_comparison.sql",
        # Data
        "data/IMS_data_init_mvp.sql",
        "data/IMS_data_organization_stores.sql",
        "data/IMS_data_raw_materials.sql",
        "data/IMS_data_products_recipes.sql",
        "data/IMS_data_init_sku.sql",
        "data/IMS_data_cost_card_import.sql",
        "data/IMS_data_sop_import.sql",
    ]

    # 如果指定了文件参数，只执行指定文件
    if len(sys.argv) > 1:
        for arg in sys.argv[1:]:
            upload_file(arg)
        return

    # 执行所有文件
    print("=" * 60)
    print("野百灵数据库 - Supabase上传 v2")
    print("=" * 60)

    # 启用扩展
    print("\n启用PostgreSQL扩展...")
    extensions = [
        "CREATE EXTENSION IF NOT EXISTS pgcrypto;",
        'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";',
        "CREATE EXTENSION IF NOT EXISTS pg_trgm;",
        "CREATE EXTENSION IF NOT EXISTS btree_gin;"
    ]
    for ext in extensions:
        result = execute_sql(ext)
        status = "✓" if result["success"] else "✗"
        print(f"  {status} {ext[:50]}")

    success_files = []
    failed_files = []

    for filepath in files_order:
        full_path = os.path.join(base_path, filepath)
        if upload_file(full_path):
            success_files.append(filepath)
        else:
            failed_files.append(filepath)
        # 小延迟避免API限流
        time.sleep(0.5)

    # 汇总
    print("\n" + "=" * 60)
    print("上传完成汇总")
    print("=" * 60)
    print(f"成功: {len(success_files)} 个文件")
    print(f"失败: {len(failed_files)} 个文件")

    if failed_files:
        print("\n失败文件:")
        for f in failed_files:
            print(f"  - {f}")

if __name__ == "__main__":
    main()
