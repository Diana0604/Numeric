format long
xs = input('quantes xifres significatives correctes vols?'); 

figure
xB = biseccio(-1, 0, xs, @pol)
xN = newton(-1, xs, @pol, @derivada)
xS = secant(0, -1, xs, @pol)
legend('show')
title('Comparaci� m�todes')
xlabel('iteraci�')
ylabel('log(r)')

figure
xB = biseccio(1, 2, xs, @pol)
xN = newton(2, xs, @pol, @derivada)
xS = secant(1, 2, xs, @pol)
legend('show')
title('Comparaci� m�todes')
xlabel('iteraci�')
ylabel('log(r)')

figure
xB = biseccio(3, 4, xs, @pol)
xN = newton(3, xs, @pol, @derivada)
xS = secant(3, 4, xs, @pol)
legend('show')
title('Comparaci� m�todes')
xlabel('iteraci�')
ylabel('log(r)')

figure
xB = biseccio(-1, 4, xs, @pol)
legend('show')
title('Bisecci�-inici (-1, 4)')
xlabel('iteraci�')
ylabel('log(r)')

figure
xB = biseccio(-2, 4, xs, @pol)
legend('show')
title('Bissecci�-inici (-2, 4)')
xlabel('iteraci�')
ylabel('log(r)')

figure
xN = newton(2.5, xs, @pol, @derivada)
legend('show')
title('Newton-inici 2.5')
xlabel('iteraci�')
ylabel('log(r)')

figure
xS = secant(0, 4, xs, @pol)
legend('show')
title('Secant-inici (0,4)')
xlabel('iteraci�')
ylabel('log(r)')

%COSES A SABER EN GRAL
%ERRORS: 
%{
%Volem aproximar el zero de dues maneres, per aix� utilitzem dos errors a 
%l'hora de calcular.
%Converg�ncia en f: Volem error = f(x(i)) --> 0
%Converg�ncia en x: Volem r(k) = (abs(x(k)-alpha))/abs(alpha) --> 0. Com que
%no coneixem alpha, utilitzem r ~=(abs(x(k)-x(k+1))/abs(x(k+1)) --> 0
%}

%BON ESQUEMA ITERATIU: 
%{
%CONSISTENT (alpha �nic punt fix)
%CONVERGENT lim(x(k))=alpha <=> lim(E(k)) = 0
%}

%TIPUS CONVERG�NCIA: 
%{
%1. E(k+1)<=lambda(E(k))^p �s converg�ncia d'ordre p
% p=1->lineal, p=2->quadr�tica etc. 
%2. S�per lineal E(k+1) < lambdaE(k)^b, b entre 1 i 2
%}

%OBSERVACIONS: 
%{
%1. Lineal -> Hi ha converg�ncia sii lambda < 1
%2. Resta -> Amb E(k) prou petit ja es garanteix converg�ncia
%lambda=FAC (Factor Assimpt�tic de Converg�ncia)
%}

%DEDUIR ERROR: 
%{
%phi'(alpha) != 0
%->phi'(alpha) < 1 => conv lineal i lambda = phi'(alpha)
%->phi'(alpha)>=1 => divergeix
%phi^p(alpha) = 0 phi^(p-1)(alpha) != 0, converg�ncia d'ordre p
%E(k+1)=x(k+1)-phi(alpha)=phi(x(k))-phi(alpha)=Taylor(phi)-phi(alpha)
%}