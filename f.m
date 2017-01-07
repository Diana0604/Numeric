%funció a integrar
function res = f(x)
    res = exp(-x)+(1/2).*exp(-(x-4).^2);
    %res = 1;
end