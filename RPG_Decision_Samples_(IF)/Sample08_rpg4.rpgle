// RPG IV (RPGLE) — STATFLG08: Toggle flags based on conditions
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f StatusF usage(*update:*output);

dcl-s Enabled ind inz(*off);
dcl-s Mode char(1) inz('N');
dcl-s Attempts packed(3:0) inz(0);

if Mode = 'M';
  Enabled = *on;
elseif Mode = 'H';
  if Attempts > 3;
    Enabled = *off;
  else;
    Enabled = *on;
  endif;
else;
  Enabled = *off;
endif;

write StatusR;

*inlr = *on;
return;
