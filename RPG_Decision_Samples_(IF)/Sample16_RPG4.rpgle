// RPG IV (RPGLE) — HDRDTL16: Process header and detail records
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f OrdHdr keyed usage(*update);
dcl-f OrdDtl keyed usage(*update);
dcl-s OrdNo char(12) inz('O-2025-001');
dcl-s State char(1) inz('N');
dcl-s Total packed(9:2) inz(0);

chain OrdNo OrdHdr;
if %found(OrdHdr);
  setll OrdNo OrdDtl;
  read OrdDtl;
  dow not %eof(OrdDtl);
    Total += LineAmt;
    read OrdDtl;
  enddo;

  if Total > 1000.00;
    State = 'H';
  elseif Total > 500.00;
    State = 'M';
  else;
    State = 'L';
  endif;

  update OrdHdrR;
else;
  dsply ('Header not found');
endif;

*inlr = *on;
return;
