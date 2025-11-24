-- ============================================================================
-- 野百灵餐饮集团 - 自动计算触发器
-- ============================================================================
-- 版本: v1.0.0-mvp
-- 核心: 自动更新库存余额、配方成本汇总
-- 注意: sales_detail的成本率已使用GENERATED列,无需触发器
-- ============================================================================

-- ----------------------------------------------------------------------------
-- 1. 自动计算recipe_item净用量
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION trg_calculate_net_quantity()
RETURNS TRIGGER AS $$
BEGIN
    NEW.net_quantity := NEW.quantity * (1 - COALESCE(NEW.waste_rate, 0));
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_recipe_item_net_quantity
BEFORE INSERT OR UPDATE ON recipe_item
FOR EACH ROW EXECUTE FUNCTION trg_calculate_net_quantity();

-- ----------------------------------------------------------------------------
-- 2. 库存自动更新触发器
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FUNCTION trg_update_inventory_balance()
RETURNS TRIGGER AS $$
BEGIN
    -- 更新库存余额
    UPDATE inventory
    SET current_quantity = current_quantity + NEW.quantity,
        last_movement_date = NEW.transaction_date,
        updated_at = NOW()
    WHERE warehouse_id = NEW.warehouse_id
      AND product_id = NEW.product_id
      AND (batch_number = NEW.batch_number OR (batch_number IS NULL AND NEW.batch_number IS NULL));

    -- 如果库存记录不存在,创建新记录
    IF NOT FOUND THEN
        INSERT INTO inventory (warehouse_id, product_id, current_quantity, unit_id, batch_number, last_movement_date)
        SELECT NEW.warehouse_id, NEW.product_id, NEW.quantity, NEW.unit_id, NEW.batch_number, NEW.transaction_date;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_inventory_transaction_update
AFTER INSERT ON inventory_transaction
FOR EACH ROW EXECUTE FUNCTION trg_update_inventory_balance();

-- ============================================================================
-- 脚本完成
-- ============================================================================
