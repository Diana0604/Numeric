function [xd,yd,coeficients] = dibuixaSplineC1Parabolic(x,y)
    n = length(x); 
    
    %omplim h i t
    h = zeros(n,1);
    t = zeros(n,1); 
    for i=1:n-1
    h(i)=x(i+1)-x(i);
    t(i)=y(i+1)-y(i);
    end
    
    %derivada del primer
    dx=zeros(n,1); 
    dx(1)=t(1)/h(1);
    %if(d == 1) dx(1)=1; end
    coeficients = zeros(3,n-1); 
    for i = 1:n-1
        M = [x(i)^2, x(i), 1;
            2*x(i), 1, 0;
            x(i+1)^2, x(i+1), 1];
        V=[y(i); dx(i);y(i+1)];
        
        %cal solucionar sistema M*coefs(i)=V;
        coeficients(1:3,i)=(M^(-1))*V;
        
        %calcula la següent derivada
        dx(i+1)=2*coeficients(1,i)*x(i+1)+coeficients(2,i);
    end
    
    %xd i yd
    xd = []; yd = [];
    x01 = [0:1/20:1]; %20 subintervals a cada interval
    for i=1:length(x)-1
        xs = x(i)+x01*h(i); %valors de x a l'interval
        ys = coeficients(1,i)*(xs).^2 + coeficients(2,i)*(xs) + coeficients(3,i);
        xd = [xd xs]; yd = [yd ys];
    end
     
end

