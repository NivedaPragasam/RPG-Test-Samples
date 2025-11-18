**FREE
ctl-opt dftactgrp(*no) actgrp(*new);

dcl-f CUSTFILE usage(*update:*delete:*output) keyed;

dcl-pi *n end-pi;

dcl-s opt char(1);
dcl-s custId packed(5:0);
dcl-s found ind;

dow '1';
   dsply 'Enter option: A=Add, U=Update, D=Delete, F=Find, X=Exit' opt;
   if %upper(opt) = 'X';
      leave;
   endif;

   dsply 'Enter Customer ID:' custId;

   chain custId CUSTFILE;
   found = %found();

   select;
      when %upper(opt) = 'A';
         if found;
            dsply ('Customer already exists: ' + %char(custId));
         else;
            dsply 'Enter Name:' CUSTNM;
            dsply 'Enter City:' CITY;
            dsply 'Enter Balance:' BAL;
            write CUSTFILE;
            dsply 'Record added.';
         endif;

      when %upper(opt) = 'U';
         if not found;
            dsply ('Customer not found: ' + %char(custId));
         else;
            dsply ('Old Name: ' + %trim(CUSTNM));
            dsply 'Enter new Name:' CUSTNM;
            dsply 'Enter new City:' CITY;
            dsply 'Enter new Balance:' BAL;
            update CUSTFILE;
            dsply 'Record updated.';
         endif;

      when %upper(opt) = 'D';
         if not found;
            dsply ('Customer not found: ' + %char(custId));
         else;
            delete CUSTFILE;
            dsply 'Record deleted.';
         endif;

      when %upper(opt) = 'F';
         if found;
            dsply ('Name: ' + %trim(CUSTNM));
            dsply ('City: ' + %trim(CITY));
            dsply ('Balance: ' + %char(BAL));
         else;
            dsply ('Customer not found: ' + %char(custId));
         endif;

      other;
         dsply 'Invalid option.';
   endsl;
enddo;

*inlr = *on;
Return; 
