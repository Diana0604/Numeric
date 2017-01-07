%Jacobiana Original
function [f] = Jacobiana(x)
param = 2;
f = [ param*(-sin(x(1))*(8*sin(x(1))+3*sin(x(2)))+8*cos(x(1))*cos(x(1)))-9*cos(x(1)), param*3*cos(x(1))*cos(x(2))
    param*3*cos(x(2))*cos(x(1)), param*(-sin(x(2))*(3*sin(x(1))+2*sin(x(2)))+2*cos(x(2))*cos(x(2)))-3*cos(x(2))];
end