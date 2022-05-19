*DIANTI FARHANA KAMASELA
*GAMS 2ND ASSIGNMENT

*Q.1 Solve for x and y of the above equation when y is minimized using GAMS solver “NLP (non linear problem)”

Variable

X, Y;

Equation

OBJ;

OBJ..    y =e= 2*x**4-3*x**2-4*x+2;

MODEL
Q1/OBJ/;

X.L=1;

solve Q1 MINIMIZING Y USING NLP;

display X.L,Y.L;

$exit










