function [x,Y,h] = EulerEnrere(f,v,y0, npassos)
    a = v(1); 
    b = v(2); 
    punts = npassos + 1; 
    x = linspace(a,b,punts); 
    h = x(2)-x(1); 
    Y = y0;
    
    xs = 5; 
    
    for i = 2 : punts
        g = @(y) y - Y(:,i-1)- h*f(x(i),y);
        yN = newton(0, xs, g,  @(y) f(x(i-1),y)); 
        Y = [Y,yN]; 
    end
end

