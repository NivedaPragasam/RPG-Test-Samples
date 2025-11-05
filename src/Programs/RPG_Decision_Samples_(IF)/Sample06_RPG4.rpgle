// RPG IV (RPGLE) — MEMUPD06: Membership level assignment and update
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Member keyed usage(*update:*output);

dcl-s MemberId char(12) inz('M001-2025');
dcl-s Points packed(7:0) inz(7200);
dcl-s Level char(1) inz(' ');

chain MemberId Member;
if %found(Member);
  if Points >= 10000;
    Level = 'P';
  elseif Points >= 5000;
    Level = 'G';
  else;
    Level = 'S';
  endif;
  monitor;
    update MemberR;
  on-error;
    dsply ('Update failed');
  endmon;
else;
  if Points >= 8000;
    Level = 'G';
  elseif Points >= 3000;
    Level = 'S';
  else;
    Level = 'B';
  endif;
  write MemberR;
endif;

*inlr = *on;
return;
