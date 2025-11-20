**FREE
// ***************************************************************
// POSTTRANS - Wrapper to call SQL stored procedure
// ***************************************************************
ctl-opt dftactgrp(*no) actgrp(*new) option(*srcstmt:*nodebugio);

dcl-proc POSTTRANS;
  dcl-pi *n int(10);
    p_itemid   char(10) const;
    p_transt   char(1)  const;
    p_qty      packed(15:2) const;
    p_location char(10) const;
    p_refno    varchar(50) const;
    p_userid   varchar(50) const;
  end-pi;

  exec sql
    call INVENTORY.SP_POST_TRANSACTION
      (:p_itemid, :p_transt, :p_qty, :p_location, :p_refno, :p_userid);

  if sqlcode = 0;
    return 0;
  else;
    return sqlcode;
  endif;

end-proc;
 
