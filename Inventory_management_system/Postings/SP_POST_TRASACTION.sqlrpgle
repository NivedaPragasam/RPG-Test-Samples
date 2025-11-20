-- **********************************************************************
-- * SP_POST_TRANSACTION - Atomic stock adjustment procedure           *
-- **********************************************************************

CREATE OR REPLACE PROCEDURE INVENTORY.SP_POST_TRANSACTION(
  IN p_itemid CHAR(10),
  IN p_transtype CHAR(1),
  IN p_qty DECIMAL(15,2),
  IN p_location CHAR(10),
  IN p_refno VARCHAR(50),
  IN p_userid VARCHAR(50)
)
LANGUAGE SQL
BEGIN
  DECLARE EXIT HANDLER FOR SQLEXCEPTION
  BEGIN
    ROLLBACK;
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Transaction failed (SP_POST_TRANSACTION)';
  END;

  START TRANSACTION;

  -- Verify item exists
  IF NOT EXISTS(SELECT 1 FROM INVENTORY.ITEMS WHERE ITEMID = p_itemid)
  THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='Item not found';
  END IF;

