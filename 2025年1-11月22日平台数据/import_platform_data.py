#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
平台数据导入脚本
分批导入美团/点评 4-11月数据
"""

import pandas as pd
import psycopg2
from psycopg2.extras import execute_values
from datetime import datetime
import warnings
warnings.filterwarnings('ignore')

# 数据库连接
DB_CONFIG = {
    'dbname': 'yebailing_db',
    'user': 'apple',
    'host': 'localhost'
}

# 门店名称映射 (Excel名称 -> store_id)
STORE_MAPPING = {
    '宁桂杏山野烤肉（1958店）': 7,
    '宁桂杏山野烤肉（世贸店）': 8,
    '宁桂杏山野烤肉（上马YOUNGPARK店）': 3,
    '宁桂杏山野烤肉（上马Young Park）': 3,
    '宁桂杏山野烤肉（江油首店）': 4,
    '野百灵·贵州酸汤火锅（1958店）': 2,
    '野百灵·贵州酸汤火锅（德阳同森店）': 1,
    '野百灵贵州酸汤火锅（1958店）': 2,
    '野百灵贵州酸汤火锅（德阳店）': 1,
}

# 平台ID
PLATFORM_ID = {
    'meituan': 1,
    'dianping': 2
}

# Excel列 -> 数据库字段映射
COLUMN_MAPPING = {
    '日期': 'report_date',
    '省份': 'province',
    '城市': 'city',
    '归属商圈': 'business_area',
    '曝光次数': 'exposure_count',
    '曝光人数': 'exposure_users',
    '曝光人数-搜索': 'exposure_users_search',
    '曝光人数-美食频道': 'exposure_users_food_channel',
    '曝光人数-首页信息流': 'exposure_users_feed',
    '访问次数': 'visit_count',
    '访问人数': 'visit_users',
    '访问人数-搜索': 'visit_users_search',
    '访问人数-美食频道': 'visit_users_food_channel',
    '访问人数-首页信息流': 'visit_users_feed',
    '曝光-访问转化率': 'exposure_visit_rate',
    '曝光-访问转化率-搜索': 'exposure_visit_rate_search',
    '曝光-访问转化率-美食频道': 'exposure_visit_rate_food_channel',
    '曝光-访问转化率-首页信息流': 'exposure_visit_rate_feed',
    '购买人数': 'purchase_users',
    '购买人数-搜索': 'purchase_users_search',
    '购买人数-美食频道': 'purchase_users_food_channel',
    '购买人数-首页信息流': 'purchase_users_feed',
    '访问-购买转化率': 'visit_purchase_rate',
    '访问-购买转化率-搜索': 'visit_purchase_rate_search',
    '访问-购买转化率-美食频道': 'visit_purchase_rate_food_channel',
    '访问-购买转化率-首页信息流': 'visit_purchase_rate_feed',
    '互动人数': 'interaction_users',
    '新增收藏人数': 'new_favorite_users',
    '累计收藏人数': 'total_favorite_users',
    '打卡人数': 'checkin_users',
    '查看优惠人数': 'view_coupon_users',
    '查看菜品人数': 'view_dish_users',
    '查看评价人数': 'view_review_users',
    '查看地址/电话人数': 'view_contact_users',
    '成交金额(优惠前)': 'gmv_before_discount',
    '成交金额(优惠前)-套餐': 'gmv_before_discount_package',
    '成交金额(优惠前)-代金券': 'gmv_before_discount_voucher',
    '成交金额(优惠前)-买单': 'gmv_before_discount_bill',
    '成交订单数': 'order_count',
    '成交订单数-套餐': 'order_count_package',
    '成交订单数-代金券': 'order_count_voucher',
    '成交订单数-买单': 'order_count_bill',
    '成交券数-套餐': 'coupon_count_package',
    '成交券数-代金券': 'coupon_count_voucher',
    '成交人数': 'transaction_users',
    '成交人数-套餐': 'transaction_users_package',
    '成交人数-代金券': 'transaction_users_voucher',
    '成交人数-买单': 'transaction_users_bill',
    '成交金额(优惠后)': 'gmv_after_discount',
    '成交金额(优惠后)-套餐': 'gmv_after_discount_package',
    '成交金额(优惠后)-代金券': 'gmv_after_discount_voucher',
    '成交金额(优惠后)-买单': 'gmv_after_discount_bill',
    '用户实付金额': 'user_paid_amount',
    '用户实付金额-套餐': 'user_paid_amount_package',
    '用户实付金额-代金券': 'user_paid_amount_voucher',
    '用户实付金额-买单': 'user_paid_amount_bill',
    '平台补贴金额': 'platform_subsidy',
    '平台补贴金额-套餐': 'platform_subsidy_package',
    '平台补贴金额-代金券': 'platform_subsidy_voucher',
    '平台补贴金额-买单': 'platform_subsidy_bill',
    '消费金额': 'consume_amount',
    '核销金额-套餐': 'consume_amount_package',
    '核销金额-代金券': 'consume_amount_voucher',
    '消费笔数': 'consume_count',
    '核销券数-套餐': 'consume_coupon_package',
    '核销券数-代金券': 'consume_coupon_voucher',
    '消费人数': 'consume_users',
    '核销人数-套餐': 'consume_users_package',
    '核销人数-代金券': 'consume_users_voucher',
    '退款金额': 'refund_amount',
    '退款金额-套餐': 'refund_amount_package',
    '退款金额-代金券': 'refund_amount_voucher',
    '退款金额-买单': 'refund_amount_bill',
    '退款券数-套餐': 'refund_coupon_package',
    '退款券数-代金券': 'refund_coupon_voucher',
    '退款订单数': 'refund_order_count',
    '退款订单数-买单': 'refund_order_count_bill',
    '新客购买人数': 'new_customer_users',
    '老客购买人数': 'old_customer_users',
    '新客成交金额(优惠后)': 'new_customer_gmv',
    '老客成交金额(优惠后)': 'old_customer_gmv',
    '扫码人数': 'scan_users',
    '扫码打卡人数': 'scan_checkin_users',
    '扫码收藏人数': 'scan_favorite_users',
    '扫码评价人数': 'scan_review_users',
    '全部评价数': 'total_review_count',
    '全部好评数': 'total_positive_count',
    '好评率': 'positive_rate',
    '全部中差评数': 'total_negative_count',
    '新评价数': 'new_review_count',
    '新好评数': 'new_positive_count',
    '新中差评数': 'new_negative_count',
    '新中差评回复率': 'negative_reply_rate',
    '美团星级': 'platform_star_rating',
    '美团人气榜榜单排名': 'ranking_popularity',
    '点评星级': 'platform_star_rating',
    '点评热门榜排名': 'ranking_popularity',
    '点评销量榜排名': 'ranking_sales',
}

def clean_value(val, field_type='int'):
    """清理数值"""
    if pd.isna(val) or val == '-' or val == '':
        return None
    if field_type == 'rate':
        # 转化率处理 (百分比 -> 小数)
        if isinstance(val, str) and '%' in val:
            return float(val.replace('%', '')) / 100
        try:
            return float(val) if val else None
        except:
            return None
    if field_type == 'decimal':
        try:
            return float(val) if val else None
        except:
            return None
    if field_type == 'ranking':
        # 榜单排名特殊处理
        if isinstance(val, str) and '第' in val:
            # 提取第一个排名数字
            import re
            match = re.search(r'第(\d+)名', val)
            if match:
                return int(match.group(1))
        try:
            return int(val) if val else None
        except:
            return None
    try:
        return int(val) if val else None
    except:
        return None

def import_file(filename, platform_code):
    """导入单个文件"""
    platform_id = PLATFORM_ID[platform_code]

    print(f"\n处理文件: {filename}")
    df = pd.read_excel(filename, sheet_name='表1', header=1)
    print(f"  读取行数: {len(df)}")

    # 连接数据库
    conn = psycopg2.connect(**DB_CONFIG)
    cur = conn.cursor()

    inserted = 0
    skipped = 0
    errors = []

    for idx, row in df.iterrows():
        store_name = row['门店名称']
        store_id = STORE_MAPPING.get(store_name)

        if not store_id:
            if store_name not in errors:
                errors.append(store_name)
            skipped += 1
            continue

        # 构建数据
        data = {
            'report_date': row['日期'],
            'store_id': store_id,
            'platform_id': platform_id,
        }

        # 映射字段
        for excel_col, db_col in COLUMN_MAPPING.items():
            if excel_col in row.index:
                val = row[excel_col]
                if 'rate' in db_col or '率' in excel_col:
                    data[db_col] = clean_value(val, 'rate')
                elif db_col in ['ranking_popularity', 'ranking_sales'] or '榜' in excel_col:
                    data[db_col] = clean_value(val, 'ranking')
                elif db_col in ['gmv_before_discount', 'gmv_after_discount', 'user_paid_amount',
                               'platform_subsidy', 'consume_amount', 'refund_amount',
                               'new_customer_gmv', 'old_customer_gmv', 'platform_star_rating'] or \
                     '金额' in excel_col or '星级' in excel_col:
                    data[db_col] = clean_value(val, 'decimal')
                elif db_col in ['province', 'city', 'business_area']:
                    data[db_col] = str(val) if pd.notna(val) else None
                elif db_col == 'report_date':
                    continue  # 已处理
                else:
                    data[db_col] = clean_value(val, 'int')

        # 插入数据
        columns = list(data.keys())
        values = [data[c] for c in columns]

        try:
            sql = f"""
                INSERT INTO platform_daily_metrics ({', '.join(columns)})
                VALUES ({', '.join(['%s'] * len(columns))})
                ON CONFLICT (report_date, store_id, platform_id) DO UPDATE SET
                {', '.join([f"{c} = EXCLUDED.{c}" for c in columns if c not in ['report_date', 'store_id', 'platform_id']])}
            """
            cur.execute(sql, values)
            inserted += 1
        except Exception as e:
            print(f"  错误 行{idx}: {e}")
            conn.rollback()
            continue

    conn.commit()
    cur.close()
    conn.close()

    print(f"  导入: {inserted}, 跳过: {skipped}")
    if errors:
        print(f"  未匹配门店: {errors}")

    return inserted, skipped

def main():
    print("=" * 50)
    print("平台数据导入")
    print("=" * 50)

    files = [
        ('美团4-6月.xlsx', 'meituan'),
        ('美团6-9月.xlsx', 'meituan'),
        ('美团9-11月.xlsx', 'meituan'),
        ('点评4-6月.xlsx', 'dianping'),
        ('点评6-9月.xlsx', 'dianping'),
        ('点评9-11月.xlsx', 'dianping'),
    ]

    total_inserted = 0
    total_skipped = 0

    for filename, platform in files:
        ins, skip = import_file(filename, platform)
        total_inserted += ins
        total_skipped += skip

    print("\n" + "=" * 50)
    print(f"导入完成! 总计: {total_inserted} 条, 跳过: {total_skipped} 条")
    print("=" * 50)

if __name__ == '__main__':
    main()
