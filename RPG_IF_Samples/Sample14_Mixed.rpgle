H****************************************************************
H* Mixed RPG III with /FREE — VALWRITE14
H****************************************************************
FVALIDF    UF   E           K DISK
C                   MOVEL     'VAL001'     KEY
C     KEY       CHAIN     VALIDF                          90
C                   IF        *IN90 = '1'
C                   /FREE
C                     dcl-s code char(3) inz('A1');
C                     dcl-s valid ind inz(*on);
C                     if code = 'A1';
C                       valid = *on;
C                     elseif code = 'B2';
C                       valid = *off;
C                     else;
C                       valid = *off;
C                     endif;
C                   /END-FREE
C                   WRITE     VALIDFR
C                   ELSE
C                   UPDATE    VALIDFR
C                   ENDIF
C                   SETON                                        LR
