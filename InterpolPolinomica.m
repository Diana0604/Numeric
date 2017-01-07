%INTERPOLACIÓ HABITUAL:
%{
%Base: {1,x,x^2,x^3,...}
%V-> matriu de Vandermonde. Està mal condicionada
%Error de truncament desconegut :(
%}
%LAGRANGE: (NO FET)
%{
base: Li(x)=(x-x0)(x-x1)·...·(x-x(j-1))(x-x(j+1))·...·(x-xn)/(xj-x0)(xj-x1)·...·(xj-x(j-1)(xj-x(j+1)·...·(xj-xn))
surten polinomis de grau n
Avantatges: 
1. coeficients immediats i ben condicionats
2. Rn(x) = L(x)F^(n+1)(mu(x))/(n+1)!
Inconvenient: cal calcular els Lj
%}
function [] = InterpolPolinomica(x0, xf, N, f)
for(i = 1:length(N))
    X = linspace(x0, xf, N(i));
    F = f(X)';
    V = zeros(i+1);
    for(j = 1:N(i))
        for (k = 1:N(i))
            V(j,k) = X(j)^(k-1);
        end
    end
    a = (V^(-1))*F;
    Polinomi(0,a)
    fplot(@(x)Polinomi(x,a),[x0, xf]);
    hold on
end
fplot(@(x)f(x), [x0, xf]);
legend('2 punts','4 punts','6 punts','8 punts', 'Funcio')
title('Interpolacio amb punts')
xlabel('X')
ylabel('Y')
hold off
end