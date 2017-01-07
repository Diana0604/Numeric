%Funció de càlcul de pesos que integren exactament fins a grau m calculats
%mitjançant sistema d'equacions. 
function w = NewtonCotes(x,a,b)
    m = length(x);
    A = [];
    c = [];
    for i = 0:m-1
        A = [A ; x.^i];
        c = [c;(b^(i+1)-a^(i+1))/(i+1)];
    end
    w = A\c;
end

