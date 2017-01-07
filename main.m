close all
format long
xs = input('quantes xifres significatives correctes vols? '); 
n = 10; 
XNT = zeros(2, n+1); 
XNTN = zeros(2, n+1); 

figure;
%Analítica
[x1,r] = NewtonRhapson([1;1],xs, @residu, @Jacobiana);
display(x1)
plot(log(r), 'DisplayName', sprintf('Analítica'))
hold on

%Numèrica
[x1,r] = NewtonRhapson([1;1],xs, @residu, @Jacobs);
display(x1)
plot(log(r), 'DisplayName', sprintf('Numèrica'))

%VARIANT NEWTON - WHITAKER
%Analítica
[x1,r] = variantNewton([1;1],xs, @residu, @Jacobiana, 1);
display(x1)
plot(log(r), 'DisplayName', sprintf('"Whitaker"'))
hold on

%VARIANT NEWTON - BROYDEN (tipus secant)
%Analítica
[x1,r] = broyden([1;1],xs, @residu, @Jacobiana);
display(x1)
plot(log(r), 'DisplayName', sprintf('Broyden'))

legend('show')
title('Estudi error')
xlabel('iteració')
ylabel('log(r)')
hold on