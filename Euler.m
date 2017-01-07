function [x,Y,h] = Euler(f,v,y0, npassos)
    a = v(1); 
    b = v(2); 
    punts = npassos + 1; 
    x = linspace(a,b,punts); 
    h = x(2)-x(1); 
    Y = y0;
    
    for i = 1:punts-1
        Y1 = Y(:,i) + h*f(x(i),Y(:,i)); 
        Y = [Y,Y1]; 
    end
end

