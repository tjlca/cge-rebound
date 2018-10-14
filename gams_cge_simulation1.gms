*option limrow = 0;
*option limcol = 0;
*option sysout = off;
*option solprint = off;


$include 9_CGE_P2P.gms
*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

*********************OPTIMIZATION RUNS********************************

***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************


Parameter demand /10/;
Set count /1*2/;
Equation Budget;
Budget.. pEQ*p2ps('6') =E= demand;


p2ps.UP('2') = 0;
Loop(count,


demand = demand + 5;


Solve CGEP2P maximizing utility using NLP;
*Solve CGEP2P Minimizing utility using NLP;
$ontext
Display ANSWER;
Display ANSWER;
Display ANSWER;
Display ANSWER;
Display ANSWER;
Display ANSWER;

put fx;
put p2pf.L('5')                   ;
put Ez1.L                         ;
put Ez2.L                         ;
put Ez3.L                         ;
put Ez4.L                         ;
put Rate.L                        ;
put Efficiency.L                  ;
put Cost.L                        ;
put size_of_conventional_flow.L   ;
put size_of_emergent_flow.L       ;
put p_F1_1.L                      ;
put p_F1_2.L                      ;
put demand_to_PR1.L            ;
put demand_to_PR2.L            ;
putclose;

$offtext

Display Value_chain_emission.L,Equipment_scale_emission.L,env_l.L,env_g.L;
Display Ez1.L,EZ2.L,Ez3.L,Ez4.L;

Display F1.L,F2.L,POut.L,Rate.L,Efficiency.L,EqCO2.L,Cost.L,pEQ.L,utility.L;

Display P2Px.L,P2Pint.L,P2Ps.L,F1.L,size_of_conventional_flow.L,size_of_emergent_flow.L,demand_to_PR1.L,demand_to_PR2.L;
Display UU.L, Y.L, F.L, Z.L, D.L, AQ.L,Xp.L,IM.L,Xv.L,pf.L, pz.L,Xg.L,E.L,
        pq.L, pe.L, pm.L;


************Store the current Value chain emission*****************************************
Parameter vc_emission0;
vc_emission0 = Value_Chain_emission.L;




********************SHOCK***********************************************
*******************Introduction of New technology**********************




p2ps.UP('2') = 20000000;

*Model CGEP2P /all/;

Solve CGEP2P maximizing utility using NLP;
*Solve CGEP2P Minimizing utility using NLP;
Parameter reduction;
Parameter rebound;

reduction = 100 *  (Value_chain_emission.L - vc_emission0)/vc_emission0;

rebound = ((reduction**2)**0.5)/50*100;



;
Display ANSWER;
Display ANSWER;
Display ANSWER;
Display ANSWER;
Display ANSWER;
Display ANSWER;

put fx;
put p2pf.L('5')                   ;
put Ez1.L                         ;
put Ez2.L                         ;
put Ez3.L                         ;
put Ez4.L                         ;
put Rate.L                        ;
put Efficiency.L                  ;
put Cost.L                        ;
put size_of_conventional_flow.L   ;
put size_of_emergent_flow.L       ;
put p_F1_1.L                      ;
put p_F1_2.L                      ;
put demand_to_PR1.L            ;
put demand_to_PR2.L            ;
put rebound                    ;
put reduction                  ;
putclose;



Display Value_chain_emission.L,Equipment_scale_emission.L,env_l.L,env_g.L,rebound,reduction;
Display Ez1.L,EZ2.L,Ez3.L,Ez4.L;

Display F1.L,F2.L,POut.L,Rate.L,Efficiency.L,EqCO2.L,Cost.L,pEQ.L,utility.L;

Display P2Px.L,P2Pint.L,P2Ps.L,F1.L,size_of_conventional_flow.L,size_of_emergent_flow.L,demand_to_PR1.L,demand_to_PR2.L;
Display UU.L, Y.L, F.L, Z.L, D.L, AQ.L,Xp.L,IM.L,Xv.L,pf.L, pz.L,Xg.L,E.L,pq.L, pe.L, pm.L;



);

