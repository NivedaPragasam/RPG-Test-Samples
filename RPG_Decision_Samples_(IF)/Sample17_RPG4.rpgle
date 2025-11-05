// RPG IV (RPGLE) — RETRY17: Retry update if lock occurs
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Acct keyed usage(*update);
dcl-s AcctNo char(10) inz('A-5555');
dcl-s Attempts packed(3:0) inz(0);
dcl-s Done ind inz(*off);

dow not Done and Attempts < 3;
  Attempts += 1;
  chain AcctNo Acct;
  if %found(Acct);
    monitor;
      update AcctR;
      Done = *on;
    on-error 1218;
      dsply ('Locked, attempt ' + %char(Attempts));
    on-error;
      dsply ('Update failure');
      Done = *on;
    endmon;
  else;
    dsply ('Account not found');
    Done = *on;
  endif;
enddo;

*inlr = *on;
return;
