A*  -------------------------------------------------------------
A*  INVENTD - Inventory Entry Display File
A*  -------------------------------------------------------------
A                                      DSPSIZ(24 80 *DS3)
A                                      CF(99)
A          R INVENTR                   TEXT('Item Entry Format')
A                                      OVERLAY
A                                      CA03(03 'Exit')
A                                      CA05(05 'Refresh')
A                                      CF06(06 'Add/Update Item')
A                                      CSRLOC(ITMNUM)
A                                      WINDOW(2 2 15 50)
A                                      WDWCAP(*NONE)
A                                      WDWBDR(*COLOR BLACK)
A                                      WDWFMT(*WHITE)
A                                      WDWBGF(*COLOR BLU)
A                                      WDWDFT(*COLOR BLU)
A                                      WDWBGF(*NONE)
A                                      WDWDFT(*NONE)
A                                  1  5'Add/Update Inventory Item'
A                                      COLOR(PNK)
A                                  3  5'Item Number:'
A            ITMNUM         7A  B  3 20
A                                  4  5'Description:'
A            ITMDSCR       30A  B  4 20
A                                  5  5'Quantity:'
A            ITMQTY         7P 0B  5 20
A                                  6  5'Unit Cost:'
A            ITMCST         7P 2B  6 20
A                                  7  5'Selling Price:'
A            ITMSLPR        7P 2B  7 20
A                                  8  5'Reorder Point:'
A            ITMRORD        7P 0B  8 20
A                                  13 5'F3=Exit, F5=Refresh, F6=Save'
A                                      COLOR(BLU)
