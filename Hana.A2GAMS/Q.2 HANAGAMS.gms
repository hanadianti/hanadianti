
*DIANTI FARHANA KAMASELA
*GAMS 2ND ASSIGNMENT

*Q.2 Solve for k when the below restrictions are satisfied.

*A=X, B=Y


VARIABLE
A,B,K;

Equation
EQ1, EQ2, EQ3; 

EQ1..           (A**2)/4+(B**2)/4=e=1;
EQ2..           B=l=A/2-1/2;
EQ3..           K =e= B - 2*A;

A.L=1/2;
B.L=1/2;
A.LO=0;
B.LO=0;

Model
Q2/EQ1,EQ2,EQ3/;

SOLVE Q2 MINIMIZING K USING NLP;

display K.L;


