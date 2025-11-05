// RPG IV (RPGLE) — DEL25: Delete record with confirm flag and log
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Orders keyed usage(*delete);
dcl-f DelLog usage(*output);
dcl-s OrdNo char(12) inz('O-DEL-22');
dcl-s Confirm ind inz(*on);

chain OrdNo Orders;
if %found(Orders);
  if Confirm;
    delete Orders;
    write DelLogR;
  elseif not Confirm;
    dsply ('Delete not confirmed');
  else;
    dsply ('Unknown confirmation state');
  endif;
else;
  dsply ('Order not found');
endif;

*inlr = *on;
return;
