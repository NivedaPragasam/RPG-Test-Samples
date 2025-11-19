------------------------------------------------------------------
  -- ISSUE (I)
  ------------------------------------------------------------------
  ELSEIF p_transtype = 'I' THEN
    UPDATE INVENTORY.ITEMS
      SET QTY_ON_HAND = QTY_ON_HAND - p_qty
      WHERE ITEMID = p_itemid
        AND QTY_ON_HAND >= p_qty;

    IF ROW_COUNT() = 0 THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Insufficient stock';
    END IF;

    IF p_location IS NOT NULL AND p_location <> '' THEN
      UPDATE INVENTORY.STOCK_BY_LOCATION
        SET QTY_ON_HAND = QTY_ON_HAND - p_qty
        WHERE ITEMID=p_itemid AND LOCATION=p_location
          AND QTY_ON_HAND >= p_qty;
      IF ROW_COUNT() = 0 THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Insufficient location stock';
      END IF;
    END IF;
