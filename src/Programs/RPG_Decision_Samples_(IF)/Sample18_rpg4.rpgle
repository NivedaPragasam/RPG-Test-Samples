// RPG IV (RPGLE) — SWITCH18: Toggle switches and assign defaults
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Cfg usage(*update:*output);
dcl-s SwA ind inz(*off);
dcl-s SwB ind inz(*off);
dcl-s Mode char(1) inz('X');

if Mode = 'X';
  SwA = *on;
elseif Mode = 'Y';
  SwB = *on;
else;
  SwA = *off;
  SwB = *off;
endif;

write CfgR;

*inlr = *on;
return;
