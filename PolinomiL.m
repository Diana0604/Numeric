%P(n+1)=((2n+1)/(n+1))xP(n)-(n/(n+1))P(n-1)
function res = PolinomiL(x, a)
    res = 0;    
    for (i = 1:length(a))
        res = res + a(i)*legendreP(i-1,x);
    end
end