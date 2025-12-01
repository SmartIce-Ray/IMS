#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
野百灵餐饮集团 - Excel数据导入脚本
版本: v1.0.0-mvp
功能: Excel → staging临时表 → 5轮验证 → 审核 → 生产表
"""

import pandas as pd
import psycopg2
from uuid import uuid4
from datetime import datetime
import json

class ExcelToStaging:
    """Excel数据导入到临时表"""

    def __init__(self, db_config):
        """初始化数据库连接"""
        self.conn = psycopg2.connect(**db_config)
        self.batch_id = str(uuid4())

    def import_sales_data(self, excel_file, sheet_name='销售明细'):
        """导入销售数据到staging_sales_detail"""
        print(f"📥 开始导入销售数据: {excel_file}")

        # 读取Excel
        df = pd.read_excel(excel_file, sheet_name=sheet_name)

        # 字段映射
        df_mapped = df.rename(columns={
            '门店编码': 'store_code',
            '销售日期': 'sales_date',
            '产品编码': 'product_code',
            '产品名称': 'product_name',
            '销售数量': 'sales_quantity',
            '销售额(折前)': 'presales_amount',
            '菜品收入(折后)': 'product_revenue',
            '菜品优惠': 'product_discount'
        })

        # 插入到临时表
        cursor = self.conn.cursor()
        for idx, row in df_mapped.iterrows():
            cursor.execute("""
                INSERT INTO staging_sales_detail
                (batch_id, store_code, sales_date, product_code, product_name,
                 sales_quantity, presales_amount, product_revenue, product_discount,
                 excel_filename, excel_row_number)
                VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            """, (
                self.batch_id, row['store_code'], row['sales_date'],
                row['product_code'], row['product_name'], row['sales_quantity'],
                row['presales_amount'], row['product_revenue'], row['product_discount'],
                excel_file, idx + 2  # Excel行号(从2开始)
            ))

        self.conn.commit()
        print(f"✅ 导入完成: {len(df_mapped)} 条记录")
        return self.batch_id

    def validate_5_rounds(self):
        """执行5轮验证"""
        cursor = self.conn.cursor()
        cursor.execute("SELECT validate_staging_sales(%s)", (self.batch_id,))
        result = cursor.fetchone()[0]
        print(f"✅ 验证完成: {result}")
        return result

# 使用示例
if __name__ == '__main__':
    db_config = {
        'host': 'localhost',
        'port': 5432,
        'database': 'ybl_restaurant',
        'user': 'postgres',
        'password': 'your_password'
    }

    etl = ExcelToStaging(db_config)
    batch_id = etl.import_sales_data('销售数据_2025年9月.xlsx')
    etl.validate_5_rounds()

    print(f"📋 批次ID: {batch_id}")
    print("💡 下一步: 在数据库中审核此批次,通过后调用 approve_and_migrate_sales('{batch_id}')")
