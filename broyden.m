%function broyden = broyden(funcioF,x0,niter)
%IDEA: 
%{
mètode tipus Newton però que la "Jacobiana" sigui més fàcil de trobar. 
1. S(k)*delta(x(k))=delta(f(k)) (quan deltax -> zero, S -> Jacob)
2. S(k)*z=S(k-1)*z per tot z ortogonal a <delta(x(k)>) -> La idea és que 
 S(k) i S(k+1) s'assemblin
A més S(k-1)*delta(x(k))=-f(k-1) (pas iteratiu)
Hipòtesi: S(k)=S(k-1)+uv' -> a partir de 1+2trobar u i v
%}
function [x,r] = broyden(x, xs, f, J)
tol = 10^(-xs); 
error = 1; 
found = 0; 

fprintf('                        Broyden\n')
display('i                       r(i)                x(i)')
display('--------------------------------------------------')

S = J(x);
deltaX=-S^(-1)*f(x); 
x1 = x + deltaX; 
r = norm(x1-x)/norm(x1);
i = 1;
x = x1;

while ((error == 1 || found == 0) && i < 100)
    i = i+1;
    
    v = deltaX; 
    u = f(x)/(norm(deltaX)^2);
    S = S + u*v';
    deltaX=-S^(-1)*f(x); 
    
    x1 = x + deltaX;
    r = [r,norm(x1-x)/norm(x1)];
    x = x1;
    
    fprintf('%d                   ', i)
    formatSpec = '%1.7f'; 
    fprintf(formatSpec, r(i));
    fprintf('            %1.7f \n', x1(1));
    fprintf('                                        %1.7f \n', x1(2));
   
    %comprovar error
    if tol > r(i)
        error = 0;
    end
    %comprovar valor funció
    if tol > norm(residu(x1))
        found = 1; 
    end
    
end
