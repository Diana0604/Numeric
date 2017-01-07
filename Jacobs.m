%Jacobiana numèrica
function [f] = Jacobs(x)
param = 2; 
h = 10^(-10);
f = [ transpose((residu(x + [h;0]) - residu(x))/h)
    transpose((residu(x + [0;h]) - residu(x))/h)];
f = transpose(f);

end