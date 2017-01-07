%{
%FUNCIÓ ITERATIVA: 
%pensat iterativament: x(k+1) = x(k) + delta(x(k)) Volem: 0 = f(x(k+1))= 
%f(x(k)+delta(x(k)) ~= f(x(k))+ delta(x(k))f'(x(k))
%-> delta(x(k))=-f(x(k))/f'(x(k)) -> x(k)=x(k+1)-f(x(k))/f'(x(k)). 
%PUNTS FORTS: Molt ràpid
%PUNTS FEBLES: Cal una primera aproximació molt TOP
%CONVERGÈNCIA:
%arrel simple -> quadràtica
%arrel de multiplicitat p -> convergència lineal amb FAC 1-1/P
%}
function [x0] = newton(x0, xs, f, derivf)
%la tolerancia marcara quan l'error es prou petit
tol = 10^(-xs);
%taula on aniran apareixent els valors
display('                        NEWTON')
display('i                       x(i)                r(i)')
display('--------------------------------------------------')

%aturarem algorisme quan r(xk, xk-1) < tol 
found = 0; % per si feia per f(x) petit
error = 1; 
i = 0; 

while (error == 1 && found == 0 && i < 1000)
    
    i = i + 1;
    
    %que no hi hagi problemes derivant
    if(derivf(x0)) ~= 0
        x1 = x0 - f(x0)/derivf(x0);
    end
    if i == 1
        r = abs((x0-x1)/x1);
    else
        r = [r, abs((x0-x1)/x1)];
    end
    
    %si l'error relatiu és prou petit, ho tenim
    if(tol > r(i))
        error = 0;
    end
    
    
    %si estem prou aprop de zero, ho tenim
    if (tol > abs(f(x1)))
        found = 1; 
    end
    
    formatSpec = '%d                   '; 
    fprintf(formatSpec, i)
    formatSpec = '%1.7f            %1.7f \n'; 
    fprintf(formatSpec, x1, r(i));
    
    %següent it
    x0 = x1;
end

plot(log(r),'g', 'DisplayName', 'Newton')

hold on