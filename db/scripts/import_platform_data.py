#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
线上平台数据导入脚本
支持美团、点评平台的日粒度运营数据导入
"""

import pandas as pd
import psycopg2
from pathlib import Path
from datetime import datetime

# 数据库连接配置
DB_CONFIG = {
    'dbname': 'yebailing_db',
    'user': 'apple',
    'host': 'localhost',
    'port': '5432'
}

# 平台ID映射
PLATFORM_MAP = {
    '美团': 1,
    '点评': 2
}

# 门店ID映射 (平台门店ID -> 数据库store_id)
STORE_MAP = {
    '561145812': 7,  # 宁桂杏1958店
    '813274765': 8,  # 宁桂杏世贸店
}

# Excel列名到数据库字段的映射
COLUMN_MAPPING = {
    # 基础信息
    '日期': 'report_date',
    '省份': 'province',
    '城市': 'city',
    '归属商圈': 'business_area',

    # 门店流量 - 曝光
    '曝光次数': 'exposure_count',
    '曝光人数': 'exposure_users',
    '曝光人数-搜索': 'exposure_users_search',
    '曝光人数-美食频道': 'exposure_users_food_channel',
    '曝光人数-首页信息流': 'exposure_users_feed',

    # 门店流量 - 访问
    '访问次数': 'visit_count',
    '访问人数': 'visit_users',
    '访问人数-搜索': 'visit_users_search',
    '访问人数-美食频道': 'visit_users_food_channel',
    '访问人数-首页信息流': 'visit_users_feed',

    # 转化率
    '曝光-访问转化率': 'exposure_visit_rate',
    '曝光-访问转化率-搜索': 'exposure_visit_rate_search',
    '曝光-访问转化率-美食频道': 'exposure_visit_rate_food_channel',
    '曝光-访问转化率-首页信息流': 'exposure_visit_rate_feed',

    # 购买
    '购买人数': 'purchase_users',
    '购买人数-搜索': 'purchase_users_search',
    '购买人数-美食频道': 'purchase_users_food_channel',
    '购买人数-首页信息流': 'purchase_users_feed',

    # 访问-购买转化率
    '访问-购买转化率': 'visit_purchase_rate',
    '访问-购买转化率-搜索': 'visit_purchase_rate_search',
    '访问-购买转化率-美食频道': 'visit_purchase_rate_food_channel',
    '访问-购买转化率-首页信息流': 'visit_purchase_rate_feed',

    # 互动
    '互动人数': 'interaction_users',
    '新增收藏人数': 'new_favorite_users',
    '累计收藏人数': 'total_favorite_users',
    '打卡人数': 'checkin_users',
    '查看优惠人数': 'view_coupon_users',
    '查看菜品人数': 'view_dish_users',
    '查看评价人数': 'view_review_users',
    '查看地址/电话人数': 'view_contact_users',

    # 成交金额(优惠前)
    '成交金额(优惠前)': 'gmv_before_discount',
    '成交金额(优惠前)-套餐': 'gmv_before_discount_package',
    '成交金额(优惠前)-代金券': 'gmv_before_discount_voucher',
    '成交金额(优惠前)-买单': 'gmv_before_discount_bill',

    # 成交订单数
    '成交订单数': 'order_count',
    '成交订单数-套餐': 'order_count_package',
    '成交订单数-代金券': 'order_count_voucher',
    '成交订单数-买单': 'order_count_bill',

    # 成交券数
    '成交券数-套餐': 'coupon_count_package',
    '成交券数-代金券': 'coupon_count_voucher',

    # 成交人数
    '成交人数': 'transaction_users',
    '成交人数-套餐': 'transaction_users_package',
    '成交人数-代金券': 'transaction_users_voucher',
    '成交人数-买单': 'transaction_users_bill',

    # 成交金额(优惠后)
    '成交金额(优惠后)': 'gmv_after_discount',
    '成交金额(优惠后)-套餐': 'gmv_after_discount_package',
    '成交金额(优惠后)-代金券': 'gmv_after_discount_voucher',
    '成交金额(优惠后)-买单': 'gmv_after_discount_bill',

    # 用户实付
    '用户实付金额': 'user_paid_amount',
    '用户实付金额-套餐': 'user_paid_amount_package',
    '用户实付金额-代金券': 'user_paid_amount_voucher',
    '用户实付金额-买单': 'user_paid_amount_bill',

    # 平台补贴
    '平台补贴金额': 'platform_subsidy',
    '平台补贴金额-套餐': 'platform_subsidy_package',
    '平台补贴金额-代金券': 'platform_subsidy_voucher',
    '平台补贴金额-买单': 'platform_subsidy_bill',

    # 消费(核销)
    '消费金额': 'consume_amount',
    '核销金额-套餐': 'consume_amount_package',
    '核销金额-代金券': 'consume_amount_voucher',
    '消费笔数': 'consume_count',
    '核销券数-套餐': 'consume_coupon_package',
    '核销券数-代金券': 'consume_coupon_voucher',
    '消费人数': 'consume_users',
    '核销人数-套餐': 'consume_users_package',
    '核销人数-代金券': 'consume_users_voucher',

    # 退款
    '退款金额': 'refund_amount',
    '退款金额-套餐': 'refund_amount_package',
    '退款金额-代金券': 'refund_amount_voucher',
    '退款金额-买单': 'refund_amount_bill',
    '退款券数-套餐': 'refund_coupon_package',
    '退款券数-代金券': 'refund_coupon_voucher',
    '退款订单数': 'refund_order_count',
    '退款订单数-买单': 'refund_order_count_bill',

    # 新老客
    '新客购买人数': 'new_customer_users',
    '老客购买人数': 'old_customer_users',
    '新客成交金额(优惠后)': 'new_customer_gmv',
    '老客成交金额(优惠后)': 'old_customer_gmv',

    # 线下扫码
    '扫码人数': 'scan_users',
    '扫码打卡人数': 'scan_checkin_users',
    '扫码收藏人数': 'scan_favorite_users',
    '扫码评价人数': 'scan_review_users',

    # 门店评价
    '全部评价数': 'total_review_count',
    '全部好评数': 'total_positive_count',
    '好评率': 'positive_rate',
    '全部中差评数': 'total_negative_count',
    '新评价数': 'new_review_count',
    '新好评数': 'new_positive_count',
    '新中差评数': 'new_negative_count',
    '新中差评回复率': 'negative_reply_rate',

    # 平台特有字段
    '美团星级': 'platform_star_rating',
    '点评星级': 'platform_star_rating',  # 点评也用同一字段
    '美团人气榜榜单排名': 'ranking_popularity',
    '点评热门榜榜单排名': 'ranking_popularity',
    '点评销量榜榜单排名': 'ranking_sales',
}


def parse_percentage(value):
    """解析百分比字符串"""
    if pd.isna(value):
        return None
    if isinstance(value, str):
        value = value.strip().replace('%', '')
        try:
            return float(value) / 100
        except:
            return None
    return value


def parse_number(value):
    """解析数值"""
    if pd.isna(value):
        return 0
    if isinstance(value, str):
        value = value.strip().replace(',', '')
        try:
            return float(value)
        except:
            return 0
    return value


def read_platform_excel(file_path, platform_name):
    """读取平台Excel文件"""
    print(f"\n读取文件: {file_path}")

    # 读取数据，跳过第一行（分组标题行）
    df = pd.read_excel(file_path, sheet_name='表1', skiprows=1)

    # 过滤掉汇总行（门店ID不是数字的行）
    if '美团门店ID' in df.columns:
        # 转换为字符串再检查
        df['美团门店ID'] = df['美团门店ID'].astype(str)
        df = df[df['美团门店ID'].str.match(r'^\d+$', na=False)]

    print(f"  读取到 {len(df)} 条记录")
    return df


def import_platform_data(df, platform_id, conn):
    """导入平台数据到数据库"""
    cursor = conn.cursor()
    imported = 0
    skipped = 0

    for idx, row in df.iterrows():
        # 获取门店ID
        platform_store_id = str(int(row.get('美团门店ID', 0)))
        if platform_store_id not in STORE_MAP:
            skipped += 1
            continue

        store_id = STORE_MAP[platform_store_id]

        # 解析日期
        report_date = row.get('日期')
        if pd.isna(report_date):
            skipped += 1
            continue

        if isinstance(report_date, str):
            report_date = datetime.strptime(report_date, '%Y-%m-%d').date()

        # 构建插入数据
        data = {
            'report_date': report_date,
            'store_id': store_id,
            'platform_id': platform_id,
        }

        # 映射所有字段
        for excel_col, db_col in COLUMN_MAPPING.items():
            if excel_col in row.index:
                value = row[excel_col]
                # 跳过日期字段(已单独处理)
                if db_col == 'report_date':
                    continue
                # 处理百分比字段
                if 'rate' in db_col or db_col == 'positive_rate':
                    data[db_col] = parse_percentage(value)
                else:
                    data[db_col] = parse_number(value)

        # 构建SQL
        columns = list(data.keys())
        placeholders = ', '.join(['%s'] * len(columns))
        update_clause = ', '.join([f"{col} = EXCLUDED.{col}" for col in columns if col not in ('report_date', 'store_id', 'platform_id')])

        sql = f"""
            INSERT INTO platform_daily_metrics ({', '.join(columns)})
            VALUES ({placeholders})
            ON CONFLICT (report_date, store_id, platform_id) DO UPDATE SET
                {update_clause},
                updated_at = NOW()
        """

        try:
            cursor.execute(sql, list(data.values()))
            imported += 1
        except Exception as e:
            print(f"  导入错误 (日期={report_date}, 门店={store_id}): {e}")
            skipped += 1

    conn.commit()
    cursor.close()
    return imported, skipped


def main():
    """主函数"""
    print("=" * 60)
    print("线上平台数据导入")
    print("=" * 60)

    # 数据文件列表
    data_dir = Path("/Users/apple/Desktop/野百灵菜单利润分析/Database/2025年1-11月22日平台数据")
    files = [
        # 美团
        (data_dir / "美团1-3月.xlsx", "美团"),
        (data_dir / "美团4-6月.xlsx", "美团"),
        (data_dir / "美团6-9月.xlsx", "美团"),
        (data_dir / "美团9-11月.xlsx", "美团"),
        # 点评
        (data_dir / "点评1-3月.xlsx", "点评"),
        (data_dir / "点评4-6月.xlsx", "点评"),
        (data_dir / "点评6-9月.xlsx", "点评"),
        (data_dir / "点评9-11月.xlsx", "点评"),
    ]

    # 连接数据库
    conn = psycopg2.connect(**DB_CONFIG)

    total_imported = 0
    total_skipped = 0

    for file_path, platform_name in files:
        if not file_path.exists():
            print(f"\n文件不存在: {file_path}")
            continue

        platform_id = PLATFORM_MAP[platform_name]

        # 读取Excel
        df = read_platform_excel(str(file_path), platform_name)

        # 导入数据
        imported, skipped = import_platform_data(df, platform_id, conn)
        print(f"  导入: {imported} 条, 跳过: {skipped} 条")

        total_imported += imported
        total_skipped += skipped

    conn.close()

    print("\n" + "=" * 60)
    print(f"导入完成! 总计导入: {total_imported} 条, 跳过: {total_skipped} 条")
    print("=" * 60)


if __name__ == '__main__':
    main()
