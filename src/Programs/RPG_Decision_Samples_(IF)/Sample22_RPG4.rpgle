// RPG IV (RPGLE) — CROSS22: Update two files based on thresholds
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f Cust keyed usage(*update);
dcl-f Score keyed usage(*update);
dcl-s CustId char(10) inz('C-900');
dcl-s Points packed(7:0) inz(3200);
dcl-s Grade char(1) inz(' ');

chain CustId Score;
if Points >= 5000;
  Grade = 'A';
elseif Points >= 3000;
  Grade = 'B';
else;
  Grade = 'C';
endif;

if %found(Score);
  update ScoreR;
else;
  dsply ('Score not found');
endif;

chain CustId Cust;
if %found(Cust);
  update CustR;
else;
  dsply ('Cust not found');
endif;

*inlr = *on;
return;
