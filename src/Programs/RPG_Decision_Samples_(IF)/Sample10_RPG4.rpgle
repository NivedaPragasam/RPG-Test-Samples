// RPG IV (RPGLE) — PAYLOG10: Payment method branching with log write
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f PayLog usage(*output);
dcl-s Method char(1) inz('C'); // C=Card, P=PayPal, B=Bank
dcl-s Approved ind inz(*off);

if Method = 'C';
  Approved = *on;
elseif Method = 'P';
  Approved = *on;
else;
  Approved = *off;
endif;

write PayLogR;

*inlr = *on;
return;
