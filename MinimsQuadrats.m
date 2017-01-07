function [] = MinimsQuadrats(x0, xf, M, K, f)
X = linspace(x0, xf, M + 1);
F = f(X)';
for i = 1:length(K)
    A = zeros(K(i) + 1); %Base de les Funcions
    for(j = 1 : K(i) + 1)
        for(k = 1 : K(i) + 1)
            S = 0; 
            for t = 1 : M + 1
                S = S + X(t)^(j-1)*X(t)^(k-1);
            end
            A(j,k) = S; 
        end
    end
    B = zeros(K(i) + 1, 1);
    for (j = 1 :K(i) + 1)
        S = 0; 
        for(k = 1 : M + 1)
            S = S + X(k)^(j-1)*F(k); 
        end
        B(j) = S; 
    end
    a = A^(-1)*B;
    fplot(@(x)Polinomi(x,a),[x0, xf]);
    hold on
end
fplot(@(x)f(x), [x0, xf]);
legend('grau2','grau4','grau6','grau8', 'Funcio')
title('Aproximació per Mínims Quadrats')
xlabel('X')
ylabel('Y')
hold off
end