function res = Polinomi(x, a)
    res = 0;    
    for (i = 1:length(a))
        res = res + a(i)*x^(i-1);
    end
end