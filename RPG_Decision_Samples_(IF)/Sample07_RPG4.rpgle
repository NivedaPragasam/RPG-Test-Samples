// RPG IV (RPGLE) — INVALLOC07: Allocate inventory with nested conditions
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f InvDtl keyed usage(*update);
dcl-s Item char(10) inz('ITEM001');
dcl-s ReqQty packed(7:0) inz(25);
dcl-s AllocQty packed(7:0) inz(0);

setll Item InvDtl;
read InvDtl;
dow not %eof(InvDtl);
  if ReqQty > 0;
    if AllocQty < ReqQty;
      if ReqQty >= 20;
        AllocQty += 10;
      elseif ReqQty >= 10;
        AllocQty += 5;
      else;
        AllocQty += 2;
      endif;
      monitor;
        update InvDtlR;
      on-error 1218;
        dsply ('Lock, retry later');
      on-error;
        dsply ('Update error');
      endmon;
    else;
      dsply ('Allocation complete');
      leave;
    endif;
  else;
    dsply ('No requirement');
    leave;
  endif;
  read InvDtl;
enddo;

*inlr = *on;
return;
