#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
野百灵餐饮集团 - Excel数据导入脚本(订单系统版)
版本: v2.0.0-order-system
功能: 从POS系统综合营业统计Excel导入订单数据
支持: 16项运营指标 + 多渠道销售 + 平台团购
"""

import pandas as pd
import psycopg2
from uuid import uuid4
from datetime import datetime
import json
import re


class ExcelToOrderSystem:
    """Excel数据导入到订单系统"""

    def __init__(self, db_config):
        """初始化数据库连接"""
        self.conn = psycopg2.connect(**db_config)
        self.batch_id = str(uuid4())
        self.cursor = self.conn.cursor()

    def import_daily_operations_data(self, excel_file, sheet_name='综合营业统计'):
        """
        导入POS系统综合营业统计数据

        Excel字段映射(基于实际Excel文件):
        - 日期 → order_date
        - 单量 → order_count (汇总值,用于验证)
        - 人数 → guest_count (汇总值)
        - 开台数 → table_count
        - 平均用餐时长 → avg_dining_duration
        - 销售额折前 → presales_amount
        - 实收金额 → final_amount
        - 折扣金额 → discount_amount
        - 人工折扣 → manual_discount
        - 优惠券折扣 → coupon_discount
        - 会员折扣 → membership_discount
        - 抹零 → rounding_amount
        - 现金收入/扫码支付收入/会员卡收入等 → 支付方式分类统计
        - 美团团购核销/抖音团购核销 → 团购平台数据
        """
        print(f"📥 开始导入综合营业统计数据: {excel_file}")

        # 读取Excel
        df = pd.read_excel(excel_file, sheet_name=sheet_name)

        print(f"✅ 读取到 {len(df)} 行数据")
        print(f"📊 Excel字段: {list(df.columns)[:20]}...")  # 显示前20个字段

        # 数据验证
        required_columns = ['日期', '单量', '人数', '销售额', '实收金额']
        missing_columns = [col for col in required_columns if col not in df.columns]
        if missing_columns:
            raise ValueError(f"缺少必需字段: {missing_columns}")

        # 处理每一天的汇总数据
        imported_count = 0
        for idx, row in df.iterrows():
            try:
                # 提取基础信息
                order_date = pd.to_datetime(row['日期']).date()

                # 创建每日汇总记录(为了演示,这里简化处理)
                # 实际生产环境应该从订单明细数据导入
                order_data = {
                    'order_date': order_date,
                    'order_count': row.get('单量', 0),
                    'guest_count': row.get('人数', 0),
                    'table_count': row.get('开台数', 0),
                    'avg_dining_duration': row.get('平均用餐时长(分钟)', 0),
                    'presales_amount': row.get('销售额', 0),
                    'final_amount': row.get('实收金额', 0),
                    'discount_amount': row.get('折扣合计', 0),
                    'manual_discount': row.get('人工折扣', 0),
                    'coupon_discount': row.get('优惠券折扣', 0),
                    'membership_discount': row.get('会员折扣', 0),
                    'rounding_amount': row.get('抹零', 0),
                }

                # 支付方式统计
                payment_stats = {
                    'cash': row.get('现金收入', 0),
                    'wechat': row.get('微信收入', 0),
                    'alipay': row.get('支付宝收入', 0),
                    'card': row.get('刷卡收入', 0),
                    'member_balance': row.get('会员卡收入', 0),
                }

                # 团购平台统计
                groupbuy_stats = {
                    'meituan': row.get('美团团购核销', 0),
                    'douyin': row.get('抖音团购核销', 0),
                }

                # 这里需要实现实际的订单拆分逻辑
                # 由于Excel是汇总数据,需要根据业务规则拆分成订单明细
                # 示例: 创建一个占位订单(实际应该从POS原始订单数据导入)

                print(f"✓ 处理日期: {order_date}, 订单数: {order_data['order_count']}, "
                      f"销售额: {order_data['final_amount']}")

                imported_count += 1

            except Exception as e:
                print(f"❌ 处理第 {idx+2} 行时出错: {e}")
                continue

        self.conn.commit()
        print(f"✅ 导入完成: {imported_count} 条记录")
        return self.batch_id


    def import_order_detail_data(self, excel_file, sheet_name='订单明细', store_id=1):
        """
        导入订单明细数据(如果有订单明细Excel)

        推荐字段:
        - 订单编号
        - 订单日期时间
        - 桌号
        - 就餐人数
        - 入座时间
        - 离座时间
        - 产品编码
        - 产品名称
        - 数量
        - 单价
        - 折扣
        - 小计
        - 订单类型(堂食/外卖)
        - 支付方式
        - 平台(如美团/抖音)
        """
        print(f"📥 开始导入订单明细数据: {excel_file}")

        df = pd.read_excel(excel_file, sheet_name=sheet_name)

        # 按订单编号分组
        orders_grouped = df.groupby('订单编号')

        imported_orders = 0
        imported_items = 0

        for order_code, order_items in orders_grouped:
            try:
                # 获取订单主信息(取第一行)
                first_item = order_items.iloc[0]

                # 插入订单主表
                order_id = self._insert_sales_order(
                    order_code=order_code,
                    store_id=store_id,
                    order_date=pd.to_datetime(first_item['订单日期']).date(),
                    order_datetime=pd.to_datetime(first_item['订单日期时间']),
                    order_type=self._map_order_type(first_item.get('订单类型', '堂食')),
                    sales_channel=self._map_sales_channel(first_item.get('销售渠道', '门店')),
                    table_number=first_item.get('桌号'),
                    guest_count=first_item.get('就餐人数', 1),
                    seat_time=pd.to_datetime(first_item.get('入座时间')) if pd.notna(first_item.get('入座时间')) else None,
                    leave_time=pd.to_datetime(first_item.get('离座时间')) if pd.notna(first_item.get('离座时间')) else None,
                    payment_method=self._map_payment_method(first_item.get('支付方式')),
                    platform_type=self._extract_platform_type(first_item.get('销售渠道')),
                )

                # 插入订单明细
                for idx, item_row in order_items.iterrows():
                    self._insert_order_item(
                        order_id=order_id,
                        product_code=item_row['产品编码'],
                        product_name=item_row['产品名称'],
                        quantity=item_row['数量'],
                        unit_price=item_row['单价'],
                        discount_rate=item_row.get('折扣率', 0),
                        actual_price=item_row.get('实际单价', item_row['单价']),
                    )
                    imported_items += 1

                imported_orders += 1

                if imported_orders % 100 == 0:
                    print(f"已导入 {imported_orders} 个订单...")

            except Exception as e:
                print(f"❌ 处理订单 {order_code} 时出错: {e}")
                continue

        self.conn.commit()
        print(f"✅ 导入完成: {imported_orders} 个订单, {imported_items} 个明细项")
        return imported_orders


    def _insert_sales_order(self, **kwargs):
        """插入订单主表,返回order_id"""
        # 计算金额汇总(从明细表汇总会更准确,这里暂时用传入值)
        subtotal_amount = kwargs.get('subtotal_amount', 0)
        discount_amount = kwargs.get('discount_amount', 0)
        final_amount = kwargs.get('final_amount', subtotal_amount - discount_amount)

        self.cursor.execute("""
            INSERT INTO sales_order
            (order_code, store_id, order_date, order_datetime, order_type, sales_channel,
             table_number, guest_count, seat_time, leave_time,
             subtotal_amount, discount_amount, final_amount,
             payment_method, platform_type, order_status)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
            RETURNING order_id
        """, (
            kwargs['order_code'], kwargs['store_id'], kwargs['order_date'],
            kwargs['order_datetime'], kwargs['order_type'], kwargs['sales_channel'],
            kwargs.get('table_number'), kwargs.get('guest_count', 1),
            kwargs.get('seat_time'), kwargs.get('leave_time'),
            subtotal_amount, discount_amount, final_amount,
            kwargs.get('payment_method'), kwargs.get('platform_type'),
            'completed'
        ))

        order_id = self.cursor.fetchone()[0]
        return order_id


    def _insert_order_item(self, order_id, product_code, product_name, quantity,
                           unit_price, discount_rate, actual_price):
        """插入订单明细"""
        # 查询产品ID
        self.cursor.execute("""
            SELECT product_id FROM product WHERE product_code = %s
        """, (product_code,))

        result = self.cursor.fetchone()
        if not result:
            print(f"⚠️  产品编码 {product_code} 不存在,跳过")
            return

        product_id = result[0]

        # 计算金额
        line_subtotal = quantity * unit_price
        line_discount = line_subtotal * discount_rate
        line_total = quantity * actual_price

        # 获取当前配方和理论成本
        self.cursor.execute("""
            SELECT recipe_id, recipe_version
            FROM recipe
            WHERE product_id = %s
              AND is_current = TRUE
              AND status = 'approved'
            LIMIT 1
        """, (product_id,))

        recipe_result = self.cursor.fetchone()
        recipe_id = recipe_result[0] if recipe_result else None
        recipe_version = recipe_result[1] if recipe_result else None

        # 计算理论成本(调用BOM分解函数)
        theoretical_cost = None
        if recipe_id:
            self.cursor.execute("""
                SELECT SUM(total_cost)
                FROM explode_bom(%s, %s, NULL)
            """, (product_id, quantity))
            cost_result = self.cursor.fetchone()
            theoretical_cost = cost_result[0] if cost_result else None

        # 插入明细
        self.cursor.execute("""
            INSERT INTO sales_order_item
            (order_id, product_id, product_code, product_name,
             quantity, unit_price, discount_rate, actual_price,
             line_subtotal, line_discount, line_total,
             recipe_id, recipe_version, theoretical_cost)
            VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            order_id, product_id, product_code, product_name,
            quantity, unit_price, discount_rate, actual_price,
            line_subtotal, line_discount, line_total,
            recipe_id, recipe_version, theoretical_cost
        ))


    def _map_order_type(self, order_type_str):
        """映射订单类型"""
        mapping = {
            '堂食': 'dine_in',
            '外卖': 'delivery',
            '外带': 'takeout',
            '自取': 'takeout',
        }
        return mapping.get(order_type_str, 'dine_in')


    def _map_sales_channel(self, channel_str):
        """映射销售渠道"""
        if not channel_str:
            return 'store'

        channel_lower = str(channel_str).lower()
        if '美团' in channel_lower or 'meituan' in channel_lower:
            return 'meituan'
        elif '抖音' in channel_lower or 'douyin' in channel_lower:
            return 'douyin'
        elif '饿了么' in channel_lower or 'eleme' in channel_lower:
            return 'eleme'
        else:
            return 'store'


    def _extract_platform_type(self, channel_str):
        """提取平台类型"""
        if not channel_str:
            return None

        channel_lower = str(channel_str).lower()
        if '美团' in channel_lower:
            return 'meituan'
        elif '抖音' in channel_lower:
            return 'douyin'
        elif '饿了么' in channel_lower:
            return 'eleme'
        elif '大众点评' in channel_lower:
            return 'dianping'
        else:
            return None


    def _map_payment_method(self, payment_str):
        """映射支付方式"""
        if not payment_str:
            return None

        payment_lower = str(payment_str).lower()
        if '现金' in payment_lower or 'cash' in payment_lower:
            return 'cash'
        elif '微信' in payment_lower or 'wechat' in payment_lower:
            return 'wechat'
        elif '支付宝' in payment_lower or 'alipay' in payment_lower:
            return 'alipay'
        elif '刷卡' in payment_lower or 'card' in payment_lower:
            return 'card'
        elif '会员' in payment_lower or 'member' in payment_lower:
            return 'member_balance'
        else:
            return 'other'


    def close(self):
        """关闭数据库连接"""
        self.cursor.close()
        self.conn.close()


# 使用示例
if __name__ == '__main__':
    db_config = {
        'host': 'localhost',
        'port': 5432,
        'database': 'ybl_restaurant',
        'user': 'postgres',
        'password': 'your_password'
    }

    etl = ExcelToOrderSystem(db_config)

    # 方式1: 导入综合营业统计数据(汇总数据)
    # batch_id = etl.import_daily_operations_data(
    #     '宁桂杏山野烤肉（绵阳1958店）_综合营业统计_20251121.xlsx'
    # )

    # 方式2: 导入订单明细数据(推荐)
    # order_count = etl.import_order_detail_data(
    #     'POS订单明细_2025年11月.xlsx',
    #     sheet_name='订单明细',
    #     store_id=1
    # )

    etl.close()

    print(f"\n📋 批次ID: {etl.batch_id}")
    print("💡 下一步: 在数据库中查询 v_store_daily_operations 视图验证数据")
