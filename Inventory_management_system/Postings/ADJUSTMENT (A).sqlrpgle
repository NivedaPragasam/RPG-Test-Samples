------------------------------------------------------------------
  -- ADJUSTMENT (A)
  ------------------------------------------------------------------
  ELSEIF p_transtype = 'A' THEN
    UPDATE INVENTORY.ITEMS
      SET QTY_ON_HAND = QTY_ON_HAND + p_qty
      WHERE ITEMID = p_itemid;

    IF p_location IS NOT NULL AND p_location <> '' THEN
      MERGE INTO INVENTORY.STOCK_BY_LOCATION T
      USING (VALUES(p_itemid, p_location, p_qty)) S(ITEMID, LOCATION, QTY)
      ON (T.ITEMID=S.ITEMID AND T.LOCATION=S.LOCATION)
      WHEN MATCHED THEN UPDATE SET QTY_ON_HAND = T.QTY_ON_HAND + S.QTY
      WHEN NOT MATCHED THEN INSERT VALUES(S.ITEMID, S.LOCATION, S.QTY);
    END IF;

  ELSE
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Invalid transaction type';
  END IF;
