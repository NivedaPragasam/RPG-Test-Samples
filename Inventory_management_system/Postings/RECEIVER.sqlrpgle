------------------------------------------------------------------
  -- RECEIVE (R)
  ------------------------------------------------------------------
  IF p_transtype = 'R' THEN
    UPDATE INVENTORY.ITEMS
        SET QTY_ON_HAND = QTY_ON_HAND + p_qty
      WHERE ITEMID = p_itemid;

    -- Per-location stock
    IF p_location IS NOT NULL AND p_location <> '' THEN
      MERGE INTO INVENTORY.STOCK_BY_LOCATION AS T
      USING (VALUES(p_itemid, p_location, p_qty))
          AS S(ITEMID, LOCATION, QTY)
      ON (T.ITEMID=S.ITEMID AND T.LOCATION=S.LOCATION)
      WHEN MATCHED THEN UPDATE SET QTY_ON_HAND = T.QTY_ON_HAND + S.QTY
      WHEN NOT MATCHED THEN INSERT VALUES(S.ITEMID, S.LOCATION, S.QTY);
    END IF;

