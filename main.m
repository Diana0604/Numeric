%{
% Objectius:
% - Entendre els conceptes basics dels metodes per a la resolucio numerica
% d'EDOs.
% - Implementar un metode per resoldre EDOs (metode d'Euler)
% - Comprovar experimentalment la convergencia d'un metode
%
% Tasques a fer:
% 1) Executar i mirar aquest script per veure com es pot resoldre el 
%    problema de valor inicial (PVI) amb la funcio de Matlab ode45
% 2) Implementar el metode d'Euler per a la resolucio del mateix PVI
%    Cal crear la funcio Euler amb els arguments d'entrada i sortida
%    especificats a aquest script. 
% 3) Dibuixar una grafica de log10(abs(error)) en funcio de log10(h), on l'error
%    s'evalua com la diferencia entre la solucio analitica i la solucio
%    numerica per x=2. Comprovar si l'ordre de convergencia coincideix amb
%    el teoric.
% Agafar npassos = [10,20,40,80...]=10+2.^[0:4] que correspon a dividir la
% h per dos cada vegada
% Es proposa ara resoldre el PVI y''= -y, y(0)=1, y'(0)=0 per x en (0,T)
% 4) Reduir la EDO de segon ordre a un sistema d'EDOs de 1er ordre
%    Resoldre numericament el PVI amb el metode d'Euler per T=2*pi. Comprovar
%    la converg?ncia.
% 5) Amb h=0.01 resoldre el problema per T=10*pi,50*pi. ?s el m?tode
%    (absolutament) estable? 


% Resolucio de la EDO dy/dx = -y/(10x+1) per x en (0,1) 
% amb condicio inicial y(0)=1
%}
%Apartat 2)
%{
f=@(x,y) -y/(10*x+1); a=0; b=1;  y0=1;

%Solucio amb funcions intrinseques de Matlab
[x,Y]=ode45(f,[a,b],y0);
figure(1), plot(x,Y,'-*'), title('ode45')

%Solucio amb el metode d'Euler
 h=0.1;
 npassos=ceil((b-a)/h); 
 [x,Y]=Euler(f,[a,b],y0,npassos);
 figure(2), plot(x,Y,'-*'), title('Euler')
%}

%Apartat 3)
%{ 
f=@(x,y) -y/(10*x+1); a=0; b=2;  y0=1;
Errors = []; 
H = []; 
Passos = []; 
yb = analitica(b); 
for(i = 0:5)
    npassos = 10*2^i; % a cada iteració doblem el nombre de passos
    %Solucio amb el metode d'Euler
     [x,Y,h]=Euler(f,[a,b],y0,npassos);
     H = [H,h]; 
     Passos = [Passos, npassos]; 
     Errors = [Errors, abs(Y(npassos)- yb)]; 
     %figure(2), plot(x,Y,'-*'), title('Euler')
end
%plot(log(H), log(Errors))
%legend('Pas')
plot(log(Passos), log(Errors)); 
legend('#punts')

xlabel('log_{10}(criteri)'), ylabel('log_{10}(error)')
title('Errors-Euler'); 
%}

%Apartat 4)
%{
figure
f=@(x,y) [y(2);-y(1)]; a=0; b=2*pi;  y0=[1;0];
yb = cos(b); 

%calcular només una vegada
%{
h = 0.1; 
ninterval=ceil((b-a)/h); 

[x,Y] = Euler(f,[a,b],y0,ninterval);
plot(x,Y(1,:)); 
hold on
plot(x,Y(2,:));
%}

%Estudi errors per diferents passos
%Cal estudiar els vaps de la matriu i mirar que caiguin a la regió on sabem
%que és estable. En aquest cas els vaps són i i -i, que cauen a dins! 
%{
Errors = []; 
H = []; 
Interval = [];

for i = 1:5
    ninterval = 10*2^i; % a cada iteració doblem el nombre de passos
    %solucio usant Eurelr
    [x, Y, h] = Euler(f,[a,b],y0,ninterval);  
    Interval = [Interval, ninterval]; 
    Errors = [Errors, abs(Y(1,ninterval)- yb)]; 
    plot(x,Y(1,:)); 
end

%Error: Pot ser en funció del pas o del nombre d'intervals
%plot(log(H), log(Errors))
%legend('Pas')
%plot(log(Interval), log(Errors)); 
legend('#punts')

xlabel('log_{10}(criteri)'), ylabel('log_{10}(error)')
title('Errors-Euler'); 
%}
%}

%Apartat 5
%{
%T = 10pi -> Manté estabilitat
f=@(x,y) [y(2);-y(1)]; a=0; b=10*pi;  y0=[1;0];
yb = cos(b); 

h = 0.01; 
ninterval=ceil((b-a)/h); 

[x,Y] = Euler(f,[a,b],y0,ninterval);
plot(x,Y(1,:)); 
title('T = 10pi');

%T = 50*pi -> NO ÉS ESTABLE! Hauria de ser un sinus i se'n va de 1
figure
f=@(x,y) [y(2);-y(1)]; a=0; b=50*pi;  y0=[1;0];
yb = cos(b); 

h = 0.01; 
ninterval=ceil((b-a)/h); 

[x,Y] = Euler(f,[a,b],y0,ninterval);
plot(x,Y(1,:)); 
title('T = 50pi'); 
%}

%Apartat 2) - Euler Enrere
%{
figure
f=@(x,y) -y/(10*x+1); a=0; b=1;  y0=1;

%Solucio amb funcions intrinseques de Matlab
[x,Y]=ode45(f,[a,b],y0);
plot(x,Y,'-*'), title('ode45')

%Solucio amb el metode d'Euler
 h=0.1;
 npassos=ceil((b-a)/h); 
 [x,Y]=EulerEnrere(f,[a,b],y0,npassos);
 figure(2), plot(x,Y,'-*'), title('Euler')
%}