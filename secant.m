%{
%idem a Newton però considerem f'(x(k)) ~=(f(x(k)-f(x(k-1))/(x(k)-x(k-1))
%PUNTS A FAVOR: 
%1. Convergència súper lineal (gairebé quadràtica) i no usa derivada
%PUNTS EN CONTRA: 
%2. A cada iteració cal fer una avaluació extra de la funció
%}
function [x1] = secant(x0, x1, xs, f)
tol = 10^(-xs);

%taula on aniran apareixent els valors
display('                        SECANT')
display('i                       x(i)                r(i)')
display('--------------------------------------------------')

%aturarem algorisme quan f(x) < tol -> ja que això vol dir que estem prou a
%prop de zero i quan r(xk, xk-1) < tol -> ja que això vol dir que 
found = 0; 
error = 1; 
i = 0; 

while (error == 1 && found == 0 && i < 1000)
    
    i = i + 1; 
    
    if f(x0) - f(x1) ~= 0
        aux = x0-f(x0)*(x0-x1)/(f(x0)-f(x1)); 
    end
    
    if i == 1
        r = abs((x1-aux)/aux);
    else
        r = [r, abs((x0-aux)/aux)];
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
    fprintf(formatSpec, aux, r(i));
    
    x0 = x1; 
    x1 = aux; 
end

plot(log(r),'r', 'DisplayName', 'Secant')

hold on