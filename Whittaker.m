%{
%ídem a newton però fent f'(x) = m constant
%PUTNS A FAVOR: CAP
%PUTNS EN CONTRA:
%1. Igual de lent que bisecció
%2. Cal triar bé la primera aproximació
%}
function [x1] = Whittaker(x0, m, xs, f) 

tol = 10^(-xs); 

display('                        WHITTAKER')
display('i                       x(i)                r(i)')
display('--------------------------------------------------')

error = 1; 
found = 0; 
i = 0;
while (error == 1 && found == 0 && i < 1000)
    i = i + 1; 
    x1 = x0 - f(x0)/m; 
    if(i == 1)
        r = abs((x0-x1)/x1);
    else
        r = [r,abs((x0-x1)/x1)];
    end
    
    if(tol > r(i))
        error = 0; 
    end
    if (tol > abs(f(x1)))
        found = 1; 
    end
    
    formatSpec = '%d                   '; 
    fprintf(formatSpec, i)
    formatSpec = '%1.7f            %1.7f \n'; 
    fprintf(formatSpec, x1, r(i));
    
    x0 = x1; 
end

plot(log(r),'y', 'DisplayName', 'Whitataker')

hold on
end

