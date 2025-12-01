#!/usr/bin/env python3
"""
Supabase SQL Upload Script
通过Management API上传SQL文件到Supabase
"""

import requests
import sys
import os
import re
import time

# Supabase配置
PROJECT_REF = "wdpeoyugsxqnpwwtkqsl"
ACCESS_TOKEN = "sbp_5cb28319a97e93145a27596aea05a89a226d2014"
API_URL = f"https://api.supabase.com/v1/projects/{PROJECT_REF}/database/query"

HEADERS = {
    "Authorization": f"Bearer {ACCESS_TOKEN}",
    "Content-Type": "application/json"
}

def execute_sql(sql: str, description: str = "") -> dict:
    """执行单条SQL"""
    try:
        response = requests.post(
            API_URL,
            headers=HEADERS,
            json={"query": sql},
            timeout=120
        )
        if response.status_code == 200:
            return {"success": True, "result": response.json()}
        else:
            return {"success": False, "error": response.text}
    except Exception as e:
        return {"success": False, "error": str(e)}

def split_sql_statements(sql_content: str) -> list:
    """
    分割SQL语句
    处理函数定义、触发器等包含 $$ 的复杂语句
    """
    statements = []
    current = ""
    in_dollar_quote = False

    lines = sql_content.split('\n')

    for line in lines:
        # 跳过纯注释行
        stripped = line.strip()
        if stripped.startswith('--') and not in_dollar_quote:
            continue

        # 检测 $$ 块
        dollar_count = line.count('$$')
        if dollar_count % 2 == 1:
            in_dollar_quote = not in_dollar_quote

        current += line + '\n'

        # 在 $$ 块外且以分号结尾时，完成一条语句
        if not in_dollar_quote and stripped.endswith(';'):
            stmt = current.strip()
            if stmt and not stmt.startswith('--'):
                statements.append(stmt)
            current = ""

    # 处理最后可能没有分号的内容
    if current.strip():
        statements.append(current.strip())

    return statements

def upload_file(filepath: str) -> bool:
    """上传单个SQL文件"""
    filename = os.path.basename(filepath)
    print(f"\n{'='*50}")
    print(f"上传: {filename}")
    print(f"{'='*50}")

    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"  读取文件失败: {e}")
        return False

    statements = split_sql_statements(content)
    total = len(statements)
    success_count = 0
    error_count = 0

    print(f"  共 {total} 条语句")

    for i, stmt in enumerate(statements, 1):
        # 跳过空语句
        if not stmt.strip() or stmt.strip() == ';':
            continue

        # 显示进度
        if i % 10 == 0 or i == total:
            print(f"  进度: {i}/{total}", end='\r')

        result = execute_sql(stmt)

        if result["success"]:
            success_count += 1
        else:
            error_count += 1
            # 显示错误（只显示前3个）
            if error_count <= 3:
                error_preview = result["error"][:200] if len(result["error"]) > 200 else result["error"]
                print(f"\n  语句 {i} 错误: {error_preview}")

        # 小延迟避免API限流
        time.sleep(0.1)

    print(f"\n  完成: 成功 {success_count}, 失败 {error_count}")
    return error_count == 0

def main():
    # SQL文件执行顺序
    base_path = "/Users/apple/Desktop/野百灵菜单利润分析/Database/db"

    files_order = [
        # Schema
        ("schema/schema_core_mvp.sql", "核心表结构"),
        ("schema/schema_extension_order_system.sql", "订单扩展表"),
        ("schema/schema_platform_data.sql", "平台数据表"),
        ("schema/schema_product_sku.sql", "SKU规格表"),
        ("schema/schema_store_purchase_price.sql", "采购价格表"),
        # Functions
        ("functions/functions.sql", "基础函数"),
        ("functions/functions_cost_encryption.sql", "成本加密"),
        ("functions/functions_bom_explosion.sql", "BOM分解"),
        ("functions/procedures_data_validation.sql", "数据验证"),
        ("functions/triggers_automatic_calculation.sql", "自动计算"),
        ("functions/triggers_price_calculation.sql", "价格计算"),
        # Views
        ("views/views_financial_analysis.sql", "财务分析视图"),
        ("views/views_operations_kpi.sql", "运营KPI视图"),
        ("views/views_price_comparison.sql", "价格对比视图"),
        # Data
        ("data/data_init_mvp.sql", "基础初始化"),
        ("data/data_organization_stores.sql", "组织与门店"),
        ("data/data_raw_materials.sql", "原材料"),
        ("data/data_products_recipes.sql", "产品与配方"),
        ("data/data_init_sku.sql", "SKU初始化"),
        ("data/data_cost_card_import.sql", "成本卡"),
        ("data/data_sop_import.sql", "SOP数据"),
        ("data/data_new_mushroom_products.sql", "新增菌菇产品"),
    ]

    # 如果指定了文件参数，只执行指定文件
    if len(sys.argv) > 1:
        filepath = sys.argv[1]
        upload_file(filepath)
        return

    # 执行所有文件
    print("=" * 60)
    print("野百灵数据库 - Supabase上传")
    print("=" * 60)

    # 先启用扩展
    print("\n启用PostgreSQL扩展...")
    extensions = [
        "CREATE EXTENSION IF NOT EXISTS pgcrypto;",
        'CREATE EXTENSION IF NOT EXISTS "uuid-ossp";',
        "CREATE EXTENSION IF NOT EXISTS pg_trgm;",
        "CREATE EXTENSION IF NOT EXISTS btree_gin;"
    ]
    for ext in extensions:
        result = execute_sql(ext)
        if not result["success"]:
            print(f"  扩展启用失败: {result['error'][:100]}")

    # 上传所有文件
    success_files = []
    failed_files = []

    for filepath, desc in files_order:
        full_path = os.path.join(base_path, filepath)
        if os.path.exists(full_path):
            if upload_file(full_path):
                success_files.append(filepath)
            else:
                failed_files.append(filepath)
        else:
            print(f"\n跳过（不存在）: {filepath}")

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
