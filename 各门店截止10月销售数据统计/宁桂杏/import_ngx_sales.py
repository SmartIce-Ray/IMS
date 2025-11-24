#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
宁桂杏4家门店POS销售数据导入脚本
导入菜品销售统计到 sales_summary 表
"""

import pandas as pd
import psycopg2
from pathlib import Path
import warnings
warnings.filterwarnings('ignore')

# 数据库连接
DB_CONFIG = {
    'dbname': 'yebailing_db',
    'user': 'apple',
    'host': 'localhost'
}

# 门店映射 (store_id 来自数据库)
STORE_MAPPING = {
    '宁桂杏1958店': 7,
    '宁桂杏世贸店': 8,
    '宁桂杏上马店': 3,
    '宁桂杏江油店': 4,
}

# 文件配置 (文件名, 门店名, 统计周期)
FILES = [
    ("宁桂杏1958店1.1-11.22日菜品销售统计.xlsx", "宁桂杏1958店", "2025-01至2025-11"),
    ("宁桂杏世贸店3.8-11.22日菜品销售统计.xlsx", "宁桂杏世贸店", "2025-03至2025-11"),
    ("宁桂杏上马店7-11.22菜品销售统计.xlsx", "宁桂杏上马店", "2025-07至2025-11"),
    ("宁桂杏江油店9.28-11.22菜品销售统计.xlsx", "宁桂杏江油店", "2025-09至2025-11"),
]

def read_sales_file(filepath):
    """读取菜品销售统计Excel"""
    df = pd.read_excel(filepath, sheet_name=0, skiprows=2)

    # 删除第一行（子标题行）
    df = df.iloc[1:]

    # 重命名列
    df.columns = ['菜品名称', '销售数量', '销售数量占比', '销售额', '销售额占比',
                  '菜品收入', '菜品收入占比', '菜品优惠', '菜品优惠占比',
                  '销售额构成_菜品', '销售额构成_做法', '销售额构成_加料', '销售额构成_餐盒',
                  '菜品收入构成_菜品', '菜品收入构成_做法', '菜品收入构成_加料', '菜品收入构成_餐盒']

    # 删除空行和合计行
    df = df.dropna(subset=['菜品名称'])
    df = df[~df['菜品名称'].astype(str).str.contains('合计|总计', na=False)]

    # 转换数值列
    for col in ['销售数量', '销售额', '菜品收入', '菜品优惠']:
        df[col] = pd.to_numeric(df[col], errors='coerce').fillna(0)

    return df

def normalize_product_name(name):
    """标准化产品名称"""
    if pd.isna(name):
        return None
    name = str(name).strip()
    # 全角转半角括号
    name = name.replace('（', '(').replace('）', ')')
    return name

def import_sales_data():
    """导入销售数据到数据库"""
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()

    total_inserted = 0
    total_skipped = 0

    for filename, store_name, period in FILES:
        filepath = Path(__file__).parent / filename
        if not filepath.exists():
            print(f"文件不存在: {filename}")
            continue

        store_id = STORE_MAPPING.get(store_name)
        if not store_id:
            print(f"未知门店: {store_name}")
            continue

        print(f"\n处理: {store_name} ({period})")
        df = read_sales_file(filepath)
        print(f"  读取菜品数: {len(df)}")

        inserted = 0
        skipped = 0

        for _, row in df.iterrows():
            product_name = normalize_product_name(row['菜品名称'])
            if not product_name:
                skipped += 1
                continue

            # 跳过销售额为0的项目（赠品/营销项）
            if row['销售额'] == 0 and row['菜品收入'] == 0:
                skipped += 1
                continue

            # 查找产品ID
            cur.execute("""
                SELECT product_id FROM product
                WHERE product_name = %s OR product_name = %s
                LIMIT 1
            """, (product_name, product_name.replace('(', '（').replace(')', '）')))
            result = cur.fetchone()

            product_id = result[0] if result else None

            # 计算指标
            sales_qty = float(row['销售数量'])
            presales = float(row['销售额'])  # 折前
            revenue = float(row['菜品收入'])  # 折后
            discount = float(row['菜品优惠'])

            discount_rate = (discount / presales * 100) if presales > 0 else 0

            # 插入数据
            try:
                cur.execute("""
                    INSERT INTO sales_summary (
                        summary_period, store_id, product_id,
                        total_quantity, total_presales, total_revenue, total_discount,
                        avg_discount_rate
                    ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)
                    ON CONFLICT (summary_period, store_id, product_id)
                    DO UPDATE SET
                        total_quantity = EXCLUDED.total_quantity,
                        total_presales = EXCLUDED.total_presales,
                        total_revenue = EXCLUDED.total_revenue,
                        total_discount = EXCLUDED.total_discount,
                        avg_discount_rate = EXCLUDED.avg_discount_rate,
                        updated_at = NOW()
                """, (
                    period, store_id, product_id,
                    sales_qty, presales, revenue, discount,
                    round(discount_rate, 2)
                ))
                inserted += 1
            except Exception as e:
                print(f"  错误 [{product_name}]: {e}")
                conn.rollback()
                skipped += 1
                continue

        conn.commit()
        print(f"  导入: {inserted}, 跳过: {skipped}")
        print(f"  销售额: ¥{df['销售额'].sum():,.2f}")
        print(f"  菜品收入: ¥{df['菜品收入'].sum():,.2f}")

        total_inserted += inserted
        total_skipped += skipped

    cur.close()
    conn.close()

    print("\n" + "=" * 50)
    print(f"导入完成! 总计: {total_inserted} 条, 跳过: {total_skipped} 条")
    print("=" * 50)

if __name__ == '__main__':
    import_sales_data()
