close all
% %*********************************FUNCIÓ f.m*******************************
% %Coneixem la integral exacta: 
% a = 0; 
% b = 5;
% Int = Integralf(a,b);
% 
% %********************************NEWTON-COTES******************************
% fprintf('NEWTON-COTES \n');
% 
% n = 14; Integrarem fins a grau n 
% Error = []; 
% Punts = []; 
% 
% for i = 0:n
%     %i+1 punts equiespaiats:
%     x = linspace(a,b,i+1);
% 
%     
%     %Càlcul de Pesos per Newton-Cotes i integral per Newton-Cotes
%     w = NewtonCotes(x,a,b);
%     I = f(x)*w;
%     
%     fprintf('la integral dóna %1.7f \n', I);
%     error = abs(Int-I);
%     fprintf('Error comès: %1.7f \n', error);
%     
%     Error = [Error,(error)];
%     Punts = [Punts, (i+1)]; 
% end
% 
% %error
% plot(log(Punts), log(Error), 'r'); 
% hold on
% 
% %********************************GAUSS*************************************
% fprintf('GAUSS \n');
% n = 14;
% 
% Error = []; 
% Punts = []; 
% 
% for i = 0:n
%     %i+1 punts equiespaiats entre -1 i 1:
%     [z,w]=QuadraturaGauss(i+1);
% 
%     %canvi variable:
%     x = ((b-a)/2)*z+(b+a)/2;
%     I = ((b-a)/2)*w*f(x);
%     fprintf('la integral dóna %1.7f \n', I);
%     error = abs(Int-I);
%     fprintf('Error comès: %1.7f \n', error);
%     Error = [Error,error];
%     Punts = [Punts, (i+1)]; 
% end
% %error
% plot(log(Punts), log(Error), 'b'); 





%*********************************FUNCIÓ f2.m******************************
figure
%Coneixem la integral exacta (en aquest interval!): 
a = -4; 
b = 4; 
Int2 = atan(4)-atan(-4);

%********************************NEWTON-COTES******************************
fprintf('NEWTON-COTES \n');

n = 14;
Error = []; 
Punts = []; 

for i = 0:n
    %i+1 punts equiespaiats:
    x = linspace(a,b,i+1);

    
    %Càlcul de Pesos per Newton-Cotes i integral per Newton-Cotes
    w = NewtonCotes(x,a,b);
    I = f2(x)*w;
    
    fprintf('la integral dóna %1.7f \n', I);
    error = abs(Int2-I);
    fprintf('Error comès: %1.7f \n', error);
    
    Error = [Error,(error)];
    Punts = [Punts, (i+1)]; 
end

%error
plot(log(Punts), log(Error), 'r'); 
hold on

%********************************GAUSS*************************************
fprintf('GAUSS \n');
n = 14;

Error = []; 
Punts = []; 

for i = 0:n
    %i+1 punts equiespaiats entre -1 i 1:
    [z,w]=QuadraturaGauss(i+1);

    %canvi variable:
    x = ((b-a)/2)*z+(b+a)/2;
    I = ((b-a)/2)*w*f2(x);

    fprintf('la integral dóna %1.7f \n', I);
    error = abs(Int2-I);
    fprintf('Error comès: %1.7f \n', error);
    Error = [Error,(error)];
    Punts = [Punts, (i+1)]; 
end
%error
plot(log(Punts), log(Error), 'b'); 



% figure
% %*********************************FUNCIÓ f3.m*******************************
% %Coneixem la integral aproximada: 
% a = 0; 
% b = pi/2;
% Int3 = 2*(1-1/(3^2)+1/(5^2)-1/(7^2));
% Int3
% 
% %********************************NEWTON-COTES******************************
% %{ 
% NO FUNCIONA NEWTON-COTES TANCADA PERQUÈ NO ESTÀ ACOTADA A PROP DEL ZERO! 
% 
% fprintf('NEWTON-COTES \n');
% 
% n = 14;
% Error = []; 
% Punts = []; 
% 
% 
% for i = 1:n
%     %i+1 punts equiespaiats:
%     x = linspace(a,b,i+1);
% 
%     
%     %Càlcul de Pesos per Newton-Cotes i integral per Newton-Cotes
%     w = NewtonCotes(x,a,b);
%     I = f3(x)*w;
%     fprintf('la integral dóna %1.7f \n', I);
%     error = abs(Int3-I);
%     fprintf('Error comès: %1.7f \n', error);
%     Error = [Error,(error)];
%     Punts = [Punts, (i+1)]; 
% end
% %}
% 
% %error
% plot(log(Punts), log(Error), 'r'); 
% hold on
% 
% %********************************GAUSS*************************************
% fprintf('GAUSS \n');
% n = 14;
% 
% Error = []; 
% Punts = []; 
% 
% for i = 0:n
%     %i+1 punts equiespaiats entre -1 i 1:
%     [z,w]=QuadraturaGauss(i+1);
% 
%     %canvi variable:
%     x = ((b-a)/2)*z+(b+a)/2;
%     I = ((b-a)/2)*w*f3(x);
%     fprintf('la integral dóna %1.7f \n', I);
%     error = abs(Int3-I);
%     fprintf('Error comès: %1.7f \n', error);
%     Error = [Error,error];
%     Punts = [Punts, (i+1)]; 
% end
% %error
% plot(log(Punts), log(Error), 'b'); 