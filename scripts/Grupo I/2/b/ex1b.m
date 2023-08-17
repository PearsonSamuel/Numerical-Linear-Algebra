
% EXERCÍCIO I.2 b)

% gerar matriz A de hilbert
A = hilb(100);

% gerar vetor b
syms j
b = ones(100,1);
for i = 1:1:100
    b(i) = symsum(1/(i+j-1),j,1,100);
end

% determinar solução do sistema Ax=b usando QR
[Q, R] = gsm(A); % decomposição QR de A
x = inv(R)*inv(Q)*b; % solução deduzida no relatório
disp(x);


% cálculo dos erros relativos da solução 
e = ones(100,1);
for k = 1:1:100
    e(k) = abs(1-x(k))*100;
end
disp(e);


% explicar os resultados obtidos
cond(A); % número de condição de A
disp(R); % visualizar matriz R

