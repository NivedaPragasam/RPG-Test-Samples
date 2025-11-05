// RPG IV (RPGLE) — CUSTUPD04: Add/Update customer with tiered discount and error handling
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f CustMst keyed usage(*update:*output);

dcl-s CustKey char(10) inz('C00045');
dcl-s Tier char(1) inz('B');
dcl-s Discount packed(5:2) inz(0);
dcl-s Found ind inz(*off);

chain CustKey CustMst;
if %found(CustMst);
  Found = *on;
  if Tier = 'A';
    Discount = 0.15;
  elseif Tier = 'B';
    Discount = 0.10;
  else;
    Discount = 0.05;
  endif;
  monitor;
    update CustMstR; // record format
  on-error 1218;
    dsply ('Record lock on update');
  on-error;
    dsply ('Update error');
  endmon;
else;
  if Tier = 'A';
    Discount = 0.20;
  elseif Tier = 'B';
    Discount = 0.12;
  else;
    Discount = 0.08;
  endif;
  monitor;
    write CustMstR;
  on-error;
    dsply ('Add error');
  endmon;
endif;

*inlr = *on;
return;
