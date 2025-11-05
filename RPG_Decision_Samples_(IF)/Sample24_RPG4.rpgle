// RPG IV (RPGLE) — DEFAULT24: Assign defaults based on environment
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f CfgOut usage(*output);
dcl-s Env char(3) inz('DEV');
dcl-s Timeout packed(5:0) inz(0);

if Env = 'PRD';
  Timeout = 120;
elseif Env = 'TST';
  Timeout = 60;
else;
  Timeout = 30;
endif;

write CfgOutR;

*inlr = *on;
return;
