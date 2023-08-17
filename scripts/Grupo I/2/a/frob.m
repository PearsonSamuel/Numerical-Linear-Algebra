
% EXERCÍCIO I.2 a)

function [res] = frob(n)

    % definição da matriz A com dimensão 100xn
    A = zeros(100,n);
    for i = 1:1:100
        for j = 1:1:n
            A(i,j) = 1/(i+j-1);
        end
    end

    % determinação das matriz Q e R através da função definida previamente 
    [Q,R] = gsm(A); 
    % matriz identidade com as mesmas dimensões de Q
    I = eye(n); 

    F1 = (Q*R)-A; % matriz correspondente à primeira norma
    F2 = (Q'*Q)-I; % matriz correspondente à segunda norma

    % determinação de ambas as normas
    res = [norm(F1,"fro"); norm(F2,"fro")]; 

end




