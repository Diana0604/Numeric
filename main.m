close all
format long
xs = input('quantes xifres significatives correctes vols? '); 
n = 10; 
XNT = zeros(2, n+1); 
XNTN = zeros(2, n+1); 

figure;
%Anal�tica
[x1,r] = NewtonRhapson([1;1],xs, @residu, @Jacobiana);
display(x1)
plot(log(r), 'DisplayName', sprintf('Anal�tica'))
hold on

%Num�rica
[x1,r] = NewtonRhapson([1;1],xs, @residu, @Jacobs);
display(x1)
plot(log(r), 'DisplayName', sprintf('Num�rica'))

%VARIANT NEWTON - WHITAKER
%Anal�tica
[x1,r] = variantNewton([1;1],xs, @residu, @Jacobiana, 1);
display(x1)
plot(log(r), 'DisplayName', sprintf('"Whitaker"'))
hold on

%VARIANT NEWTON - BROYDEN (tipus secant)
%Anal�tica
[x1,r] = broyden([1;1],xs, @residu, @Jacobiana);
display(x1)
plot(log(r), 'DisplayName', sprintf('Broyden'))

legend('show')
title('Estudi error')
xlabel('iteraci�')
ylabel('log(r)')
hold on