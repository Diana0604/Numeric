%T(n+1)=cos(narcosx)
%{
veure polinomi: cos(ntheta) = 2cos((n-1)theta)cos(theta)-cos((n-2)theta)
T(n)=2T(n-1)x-T(n-2)
%}

function res = PolinomiT(x, a)
    res = 0;    
    for (i = 1:length(a))
        res = res + a(i)*chebyshevT(i-1,x);
    end
end