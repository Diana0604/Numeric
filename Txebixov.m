function [] = Txebixov(x0, xf, M, K, f)
X = linspace(x0, xf, M + 1);
L = zeros(1,9);

for i = 1:length(K)
    
    D = zeros(K(i) + 1, 1); 
    for j = 1 : K(i) + 1
        D(j) = integral(@(x)((1./sqrt(1-x.^2)).*chebyshevT(j-1,x).^2),x0,xf);
    end
    
    B = zeros(K(i) + 1, 1);
    for j = 1 : K(i) + 1
        B(j) = integral(@(x)((1./sqrt(1-x.^2)).*f(x).*chebyshevT(j-1,x)),x0,xf);
    end
    
    a = B./D;
    
    fplot(@(x)PolinomiT(x,a),[x0, xf]);
    hold on
end

fplot(@(x)f(x), [x0, xf]);
legend('grau2','grau4','grau6','grau8', 'Funcio')
title('Aproximaciˇ per Txebixov')
xlabel('X')
ylabel('Y')
hold off