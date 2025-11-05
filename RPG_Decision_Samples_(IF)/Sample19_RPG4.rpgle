// RPG IV (RPGLE) — ACCT19: Closed account handling, else-if add/update
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Account keyed usage(*update:*output);

dcl-s Key char(12) inz('ACC-0001');
dcl-s State char(1) inz('A'); // A=Active, C=Closed
dcl-s Bal packed(9:2) inz(250.00);

chain Key Account;
if %found(Account);
  if State = 'C';
    dsply ('Closed — no update');
  elseif State = 'A';
    Bal += 50.00;
    update AccountR;
  else;
    dsply ('Unknown state');
  endif;
else;
  if Bal > 0;
    write AccountR;
  else;
    dsply ('Zero balance — not adding');
  endif;
endif;

*inlr = *on;
return;
