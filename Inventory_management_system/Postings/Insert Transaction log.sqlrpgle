------------------------------------------------------------------
  -- Insert transaction log
  ------------------------------------------------------------------
  INSERT INTO INVENTORY.TRANSACTIONS
  (ITEMID, TRANS_TYPE, QTY, LOCATION, REFNO, USERID)
  VALUES (p_itemid, p_transtype, p_qty, p_location, p_refno, p_userid);

  COMMIT;
END;
