% CALCUL I DIBUIX D'SPLINES
% Aquest script calcula i dibuixa l'Spline cubic C1 amb aproximació de les
% derivades, per als punts base i valors de la funcio a x i y.
%

%Dades
x = [0,1,3,4,5,7]; y = [1,1.25,1,0.5,0,0.4];
%x = [0,1,3,4,5,7]; y = [1,1.25,2,0.5,0,0.4];

%Spline C1 cubic amb aproximacio de les derivades
i = 2:length(x)-1;
dS = [ (y(2)-y(1))/(x(2)-x(1)) (y(i-1)-y(i+1))./(x(i-1)-x(i+1)) (y(end)-y(end-1))/(x(end)-x(end-1))]
[xS1,yS1,coeficients]=dibuixaSplineCubic(x,y,dS,[]);
coeficients
figure(1)
plot(xS1,yS1,'r-',x,y,'ko','LineWidth',2)
legend('C1 cubic')

%Spline natural
d2S = calculaCurvaturesSplineNatural(x,y)
 [xS2,yS2,coeficients]=dibuixaSplineCubic(x,y,[],d2S);
 coeficients
 figure(1)
 plot(xS1,yS1,'r-',xS2,yS2,'b-',x,y,'ko','LineWidth',2)
 legend('C1 cubic','Natural')

 %Spline parabolic C1 (recurrent)
 [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y);
 coeficients
 figure(1)
 plot(xS1,yS1,'r-',xS2,yS2,'b-',xS3,yS3,'g-',x,y,'ko','LineWidth',2)
 legend('C1 cubic','Natural','parabolic')

 %bases
 %PARABÒLIC C1
 %figure
 x = [0,1,3,4,5,7]; y = [0,0,0,0,0,0]; 
 
 %dibuixar base:
 
%  per dibuixar la base posem tots els f(x(i)) a zero excepte el de
%  l'element i de la base (que és 1). L'element que acompanya a la condició
%  extra val zero a tot arreu però forcem derivada 1 en x(1)
 for i = 1:length(x)
   y(i) = 1; 
   [xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y);
   plot(xS3,yS3,x,y,'ko','LineWidth',2)
   hold on;
   %legend('parabolic')
   y(i) = 0;
 end
 
 %[xS3,yS3,coeficients]=dibuixaSplineC1Parabolic(x,y,1);
 %plot(xS3,yS3,x,y,'ko','LineWidth',2)
 

 %DADES-COEFICIENTS: 
 %{
 cal que: coeficients-dades-condicions=0
 coeficients-dades=dim espai
 %}