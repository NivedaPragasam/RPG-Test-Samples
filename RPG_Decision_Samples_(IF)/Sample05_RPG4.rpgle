// RPG IV (RPGLE) — VALLOG05: Validate fields and write to log
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f LogFile usage(*output);

dcl-s Email varchar(50) inz('user@example.com');
dcl-s Active ind inz(*on);
dcl-s Severity char(1) inz('M');

if %scan('@': Email) > 0;
  if Active;
    if Severity = 'H';
      dsply ('High severity active user');
    elseif Severity = 'M';
      dsply ('Medium severity active user');
    else;
      dsply ('Low severity active user');
    endif;
  else;
    dsply ('Inactive user');
  endif;
  write LogR; // record format
else;
  dsply ('Invalid email');
endif;

*inlr = *on;
return;
