%Funció de càlcul de pesos que integren exactament fins a grau m-1 calculats
%mitjançant sistema d'equacions, on m ve donat pels punts on es coneix f. 
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

