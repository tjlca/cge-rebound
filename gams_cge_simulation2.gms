*rebound effect is showin using this file. 
*Rebound effect for total emission shown over here. 
*Rebound effect is much higher 
*VC scale emission were changed to get nice effect.


option limrow = 0;
option limcol = 0;
option sysout = off;
option solprint = off;


$include 9_CGE_P2P.gms
*********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************

*********************OPTIMIZATION RUNS********************************

***********************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************************
p2ps.UP('2') = 0;


Solve CGEP2P maximizing utility using NLP;



Display Value_chain_emission.L,Equipment_scale_emission.L,env_l.L,env_g.L;

Display Ez1.L,EZ2.L,Ez3.L,Ez4.L;

Display F1.L,F2.L,POut.L,Rate.L,Efficiency.L,EqCO2.L,Cost.L,pEQ.L,utility.L;

Display P2Px.L,P2Pint.L,P2Ps.L,F1.L,size_of_conventional_flow.L,size_of_emergent_flow.L,demand_to_PR1.L,demand_to_PR2.L;
Display UU.L, Y.L, F.L, Z.L, D.L, AQ.L,Xp.L,IM.L,Xv.L,pf.L, pz.L,Xg.L,E.L,
        pq.L, pe.L, pm.L;


************Store the current Value chain emission*****************************************
Parameter vc_emission0,expected_red;
vc_emission0 = Ez4.L;
expected_red = Value_chain_emission.L*0.5/Ez4.L*100;

********************SHOCK***********************************************
*******************Introduction of New technology**********************

p2ps.UP('2') = 20000000;

*Model CGEP2P /all/;

Solve CGEP2P maximizing utility using NLP;
*Solve CGEP2P Minimizing utility using NLP;
Parameter reduction;
Parameter rebound;

reduction = 100 *  (vc_emission0-Ez4.L)/vc_emission0;

rebound =100-((power(reduction,2)**0.5)/Expected_red*100);
Parameter Slope;
Slope = rebound/myparam;



Display ANSWER;
Display ANSWER;

put fx;
fx.ps = 200;
fx.pw = 30000;
fx.nd = 3;
fx.ap = 1;
fx.pc = 8;
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
put slope                      ;
putclose;



Display Value_chain_emission.L,Equipment_scale_emission.L,env_l.L,env_g.L,rebound,reduction;
Display Ez1.L,EZ2.L,Ez3.L,Ez4.L;

Display F1.L,F2.L,POut.L,Rate.L,Efficiency.L,EqCO2.L,Cost.L,pEQ.L,utility.L;

Display P2Px.L,P2Pint.L,P2Ps.L,F1.L,size_of_conventional_flow.L,size_of_emergent_flow.L,demand_to_PR1.L,demand_to_PR2.L;

Display UU.L, Y.L, F.L, Z.L, D.L, AQ.L,Xp.L,IM.L,Xv.L,pf.L, pz.L,Xg.L,E.L,pq.L, pe.L, pm.L;





	
	
