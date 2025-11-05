// RPG IV (RPGLE) — TAXCALC11: Calculate tax tier, update or add record
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Sales keyed usage(*update:*output);
dcl-s Doc char(12) inz('S-2025-001');
dcl-s Amount packed(9:2) inz(1250.00);
dcl-s Tax packed(9:2) inz(0);

chain Doc Sales;
if Amount > 1000.00;
  Tax = Amount * 0.12;
elseif Amount > 500.00;
  Tax = Amount * 0.08;
else;
  Tax = Amount * 0.05;
endif;

if %found(Sales);
  monitor;
    update SalesR;
  on-error;
    dsply ('Update error');
  endmon;
else;
  write SalesR;
endif;

*inlr = *on;
return;
