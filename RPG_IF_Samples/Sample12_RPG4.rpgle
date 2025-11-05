// RPG IV (RPGLE) — NEGCHK12: Validate negative amounts and process
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f ErrLog usage(*output);
dcl-s Amt packed(9:2) inz(-10.00);
dcl-s Action char(1) inz(' ');

if Amt < 0;
  Action = 'E';
elseif Amt = 0;
  Action = 'N';
else;
  Action = 'P';
endif;

if Action = 'E';
  dsply ('Error: Negative amount');
  write ErrLogR;
elseif Action = 'N';
  dsply ('No-op: Zero amount');
else;
  dsply ('Proceed: Positive amount');
endif;

*inlr = *on;
return;
