close all
clc
x0 = -1;
xf = 1;
N = [3,5,7,9]; %punts que té la interpolació
M = 101; %punts que tenen els MQ
K = [2,4,6,8]; %grau dels polinomis per MQ



display('Interpolació Polinòmica');
subplot(2,2,1)
InterpolPolinomica (x0, xf, N, @Runge); 

display('Mínims Quadrats-Base 1, x, x^2...');
subplot(2,2,2)
MinimsQuadrats(x0, xf, M, K, @Runge)

display('Mínims Quadrats-Base Legendre');
subplot(2,2,3)
Legendre(x0, xf, M, K, @Runge)

display('Mínims Quadrats-Base Txebixov');
subplot(2,2,4)
Txebixov(x0, xf, M, K, @Runge)








%INTERPOLACIÓ POLINÒMICA
%{
Idea: exigim p(x(i))==f(x(i))
%}

%PRODUCTE ESCALAR
%{
-continu: pes*integrar(u*w)dx
-discret: sum(pes*u(x(i)*v(x(i))
%}

%MÍNIMS QUADRATS
%{
Volem minimitzar norma(f-p)^2 = Error
->p = sum(ci*phi(xi)) (phi base espai)
aleshores, dE/dci = 0 = d/dci(<f,f>-2<p,f>+<p,p>)
Si es desenvolupa: 
<phi(i),p>=<phi(i),f> => <phii(x),f(x)-sum(cjphij(x))>=0 -> sistema de
mínims quadràtics

en la base "típica"
dim/Núm condició
2/1.9*10^1
3/5.x*10^2
5/4.8*10^5
10-10^13
15-10^20
%}

%NÚMERO DE CONDICIÓ: norma(A*A^-1) = màxim error que es pot trobar

%RELACIÓ RECURRÈNCIA: 
%{
P(i+1)(x)=(a(i)x+b(i))P(i)(x)+c(i)P(i-1)(x)
%}