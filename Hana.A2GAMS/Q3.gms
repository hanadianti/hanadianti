*DIANTI FARHANA KAMASELA
*GAMS 2ND ASSIGNMENT


*Q3. Solve Exercise 3.3.1 in the text, “GAMS-for environmental-economic modeling*”. The model is shown 
*on p.33. Answer the question to [Solve the model and display the optimal investment path I(t)] in the middle 
*of p.33. Use “Equation Capital stock” as below. This equation is shown in the 2nd note on p.33.

SET      t/2001*2020/;


Variable                    cc(t),L(t),K(t),Y(t),cc2;
positive variable           C(t),I(t);

Parameter
         gL,delta,A,L0,K0,r
;
         gL     =   0.02;
         delta  =   0.10;
         A      =   1   ;
         L0     =   10  ;
         K0     =   20  ;
         r      =   0.03;


Equation
OBJ      Objective function
LAB(t)   Labour stock
CAP(t)   Capital stock
INC(t)   Income
PRO(t)   Production
CON(t)   Consumption per capita
;


OBJ..    cc2     =e= sum(t,cc(t)*1/((1+r)**ord(t)));
LAB(t).. L(t)    =e= L0*((1+gL)**ord(t));
CAP(t).. K(t)    =e= (K0$(ord(t)=1))+K(t-1)*(1-delta)+I(t);
INC(t).. Y(t)    =e= C(t)+I(t);
PRO(t).. Y(t)    =e= A*K(t)**0.2*L(t)**0.8;
CON(t).. cc(t)   =e= C(t)/L(t);

L.L(t) = L0;
K.L(t) = K0;

L.LO(t) = 0;
K.LO(t) = 0;
cc.LO(t)= 0;
Y.LO(t) = 0;

model Q3 /all/;

solve Q3 maxmizing cc2 using NLP;

display I.l,cc2.l;


*$libInclude x xldump Hana.xls sheet1!A1:S2


