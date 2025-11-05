H****************************************************************
H* Mixed RPG IV — ORDPROC13 (Fixed-form + /FREE)
H****************************************************************
FORDHDR    UF   E           K DISK
FORDDTL    UF   E           K DISK
C                   EVAL      ORD#      = 'O-7788'
C     ORD#      CHAIN     ORDHDR                          90
C                   IF        *IN90 = *OFF
C                   /FREE
C                     dcl-s priority char(1) inz('N');
C                     dcl-s qty packed(7:0) inz(15);
C                     if qty >= 20;
C                       priority = 'H';
C                     elseif qty >= 10;
C                       priority = 'M';
C                     else;
C                       priority = 'L';
C                     endif;
C                   /END-FREE
C                   UPDATE    ORDHDRR
C                   ELSE
C                   EXCPT     MSGNF
C                   ENDIF
C                   SETON                                        LR
OQSYSPRT   E                                        MSGNF
O                                           'ORDER NOT FOUND'
