**FREE
// ***************************************************************
// REPORT_GEN_REORDER - Builds REORDER_REPORT table
// ***************************************************************
ctl-opt dftactgrp(*no) actgrp(*new) option(*srcstmt:*nodebugio);

// Clear previous report
exec sql
  delete from INVENTORY.REORDER_REPORT;

// Insert new rows
exec sql
  insert into INVENTORY.REORDER_REPORT
    (ITEMID, ITEMDESC, QTY_ON_HAND, REORDER_LEVEL, LOCATION)
  select ITEMID, ITEMDESC, QTY_ON_HAND, REORDER_LEVEL, LOCATION
    from INVENTORY.ITEMS
    where QTY_ON_HAND <= REORDER_LEVEL;

*inlr = *on;
