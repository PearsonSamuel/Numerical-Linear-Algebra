function res = cores(imagem,percentagem) %Nota: na verdade deve-se usar
%como input a fração dos valores singulares que se pretende preservar
%(número entre 0 e 1) e não uma percentagem propriamente dita.

%carregar imagem:
A=imread(imagem);

%decompor em camadas de diferentes cores e obter as matrizes com entradas
% em precisão dupla:
A1=A(:,:,1); %Vermelho
A1=double(A1);
A2=A(:,:,2); %Verde
A2=double(A2);
A3=A(:,:,3); %Azul
A3=double(A3);

%Obter valores singulares de cada matriz:
s1=svd(A1);
s2=svd(A2);
s3=svd(A3);
%Obter o número de valores singulares a preservar em cada matriz 
%(menor valor inteiro que permite preservar pelo menos a percentagem 
%pretendida):
n1=ceil(length(s1)*percentagem);
n2=ceil(length(s2)*percentagem);
n3=ceil(length(s3)*percentagem);

%Obter a decomposição SVD de cada matriz com o número certo de valores
%singulares preservados:
[U1,S1,V1]=svds(A1,n1);
[U2,S2,V2]=svds(A2,n2);
[U3,S3,V3]=svds(A3,n3);

%Obter as novas camadas RGB:
X1=U1*S1*V1';
X2=U2*S2*V2';
X3=U3*S3*V3';

Anew1=uint8(X1);
Anew2=uint8(X2);
Anew3=uint8(X3);

%Visualizar a imagem resultante da compressão:
Aend(:,:,1)=Anew1;
Aend(:,:,2)=Anew2;
Aend(:,:,3)=Anew3;
imshow(Aend)

