%Funció de càlcul de pesos que integren exactament fins a grau n calculats
%mitjançant sistema d'equacions. 
function w = Pesos(x,a,b)
    n = length(x);
    A = [];
    c = [];
    for i = 0:n-1
        A = [A ; x.^i];
        c = [c;(b^(i+1)-a^(i+1))/(i+1)];
    end
    w = A\c;
end

