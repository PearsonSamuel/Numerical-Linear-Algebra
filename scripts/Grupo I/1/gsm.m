
% EXERCÍCIO I.1

function [Q,R] = gsm(A)
    
  [m,n] = size(A); % dimensões da matriz A
  Q = zeros(m,n); % matriz genérica com as dimensões de Q
  R = zeros(n,n); % matriz genérica com as dimensões de R
  Anew = A; % gerar matriz de modo a não alterar a matriz A diretamente

  for i = 1:1:n 
      R(i,i) = norm(Anew(:,i)); % elementos na diagonal de R
      Q(:,i) = Anew(:,i)/R(i,i); % colunas de Q

      for j = i+1:1:n
          R(i,j) = Q(:,i)'*Anew(:,j); % elementos acima da diagonal de R
          Anew(:,j) = Anew(:,j)-R(i,j)*Q(:,i); % coluna de A a ser usada no próximo cálculo de R(i,j), passo de ortogonalização
      end
  end   

end


