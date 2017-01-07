function eq = equacio(x)

K = 2;
eq = [K*(cos(x(1))*(8*sin(x(1))+3*sin(x(2))))-9*sin(x(1));
    K*(cos(x(2))*(3*sin(x(1))+2*sin(x(2))))-3*sin(x(2))];