PGM
             CALL       PGM(INVENTPGM/REPORT_GEN_REORDER)

             CPYTOIMPF  FROMFILE(INVENTORY/REORDER_REPORT) +
                          TOSTMF('/tmp/reorder_report.csv') +
                          MBROPT(*REPLACE) STMFCODPAG(*PCASCII) +
                          RCDDLM(*CRLF) DTAFMT(*DLM) STRDLM(*NONE) +
                          FLDDLM(',')

             SNDPGMMSG  MSG('Reorder report created in /tmp') +
                          TOPGMQ(*EXT) MSGTYPE(*INFO)
ENDPGM
