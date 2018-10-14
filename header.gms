file fx /%myfile%/;



fx.ps = 200;
fx.pw = 30000;
fx.nd = 3;
fx.ap = 1;
fx.pc = 8;
*fx.nw = 6;
put fx;
put 'Demand'                      ;
put 'Eqem'                       ;
put 'EqVC'                       ;
put 'EqVCLocal'                     ;
put 'Global'                       ;
put 'Rate'                        ;
put 'Effc'                        ;
put 'Cost'                         ;
put 'Conv_Flow'                   ;
put 'Emer_Flow'                   ;
put 'Price_Conv'                  ;
put 'Price_em'                    ;
put 'DEM1'                        ;
put 'DEM2'                        ;
put 'rebound'                     ;
put 'reduction'                   ;
putclose;



Equation dummy;
Variable Dum;

dummy.. Dum=E=5;


MODEL head /all/;
Solve head minimizing Dum using NLP;
