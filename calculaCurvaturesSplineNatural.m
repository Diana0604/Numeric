%L'spline natural és el més suau: 
%Rugositat: I(f)=integral(x0,xn)f''(x)^2

function d2S = calculaCurvaturesSplineNatural(x,y)
%y = f(x)
% el 0 del full és un 1 aquí

n = length(x)-1; 

%omplim h i t
h = zeros(n,1);
t = zeros(n,1); 
for i = 1:n
    h(i) = x(i+1)-x(i);
    t(i) = y(i+1)-y(i);
end

%omplim d, mu i lambda
mu = zeros(n-1,1); 
lambda = zeros(n-1,1); 
d = zeros(n-1,1); 
for i = 1:n-1
    d(i) = 6/(h(i+1)+h(i))*(t(i+1)/h(i+1)-t(i)/h(i));
    mu(i) = h(i)/(h(i+1)+h(i));
    lambda(i) = h(i+1)/(h(i+1)+h(i));
end

%construir matriu
nOnes = ones(1,n-1) ;
lambdaA = lambda(1:n-2);
muA = mu(2:n-1);
A = diag(2*nOnes, 0) + diag(muA, -1) + diag(lambdaA, 1);

%construir vector sistema. 
%RECORDAR: NORMALMENT B(1) = D(1)-MU(1)S0 i D(N-1) = LAMBDA(N-1)*S(N) PERO
%EN AQUEST CAS NO HO FEM AIXI PERQUE LES S
%SON ZERO (DEF SPLINE NATURAL)
b = zeros(n-1,1);
for i = 1:n-1
    b(i) = d(i);
end

%curvatures
d2S = (A^-1)*b; 
d2S = [0; d2S;0];