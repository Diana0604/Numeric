%{
%PUNTS A FAVOR: 
%1.Molt robust -> SEMPRE hi ha convergència
%2. Cota de l'error abans de començar (interval inicial). E(k) =
%abs(m(k)-alpha) <= (b(k)-a(k))/2=(b(0)-a(0))/(2^(k+1)) -> 0
%PUNTS EN CONTRA: 
%1. és molt lent
%}
function [m] = biseccio(esq, dre, xs, f)
tol = 10^(-xs); 

display('                        BISSECCIÓ')
display('i                       x(i)                r(i)')
display('--------------------------------------------------')


a = f(esq);
b = f(dre);

if a*b > 0
    display('ETS UN COPRÒLIT!!!!')
else
    found = 0; 
    error = 1; 
    i = 0;
    while (error == 1 && found == 0 && i < 1000)
        i = i + 1; 
        if i ~= 1
            ant = m; 
        end
        
        %m és el valor del mig
        m = (esq + dre)/2;
        c = f(m);
        
        %substituïm el valor a on correspongui
        if c*a > 0
            esq = m; 
            a = c; 
        else
            dre = m; 
            b = c; 
        end
        
        %Observem error
        if i ~= 1
            if i == 2
                r = abs((m - ant)/m);
            else
                r = [r, abs((m - ant)/m)]; 
            end
            
            formatSpec = '%d                   '; 
            fprintf(formatSpec, i)
            formatSpec = '%1.7f            %1.7f \n'; 
            fprintf(formatSpec, m, r(i-1));
            
            if(tol > r(i-1))
                error = 0;  
            end
            if(tol > abs(f(m)))
                found = 1;
            end
        end
    end
end

plot(log(r),'b', 'DisplayName', 'Bisecció')
hold on