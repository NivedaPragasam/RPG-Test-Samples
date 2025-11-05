// RPG IV (RPGLE) — ACCESS23: Determine access level and write audit
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Audit usage(*output);
dcl-s Role char(1) inz('U'); // A=Admin, M=Manager, U=User
dcl-s Access char(1) inz('N');

if Role = 'A';
  Access = 'F';
elseif Role = 'M';
  Access = 'P';
else;
  Access = 'L';
endif;

write AuditR;

*inlr = *on;
return;
