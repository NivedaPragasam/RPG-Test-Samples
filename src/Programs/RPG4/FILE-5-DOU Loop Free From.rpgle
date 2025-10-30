**free
  ctl-opt dftactgrp(*no) actgrp(*caller);

  dcl-proc Main;
  dcl-s count int(5) inz(0);

  dou count >= 5;
    // loop body
    dsply ('Count=' + %char(count));
    count += 1;
    // use LEAVE to break early, ITER to continue
  enddo;