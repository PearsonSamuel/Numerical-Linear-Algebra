function qualidade = simplifica(imagem,percentagem)

A=im2gray(imread(imagem));
A=double(A);
S=svd(A); %Obter valores singulares de A
Denominador=sumsqr(S);%No cálculo da qualidade da imagem, o denominador é
%a soma dos quadrados dos valores singulares de A
N=ceil(length(S)*percentagem);%min(size(S)) dá-nos o número de valores 
% singulares de A. N é o número de valores a preservar.

[U2,S2,V2]=svds(A,N); %Decomposição SVD retendo a percentagem de 
% valores singulares desejada
Numerador=sumsqr(S2); %O numerador no cálculo da qualidade é a soma dos 
% quadrados dos valores singulares retidos

%Obtenção da nova matriz:
X=U2*S2*V2';
Anew=uint8(X);
%Produção do resultado:
imshow(Anew) %imagem obtida
qualidade=100*(Numerador/Denominador); %qualidade de dados preservada
end
