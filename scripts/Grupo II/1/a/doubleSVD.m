function [U,S,V] = doubleSVD(imagem,opt) %opt: opção de fazer o display do
%número de valores singulares obtidos: 1 se queremos display, 0 c.c.
A=im2gray(imread(imagem)); %comando im2gray de modo a considerar a imagem 
%como estando a preto e branco

A=double(A);%Obter matriz com entradas com precisão dupla
[U,S,V]=svd(A);%Obter decomposição SVD

if opt==1
    min(size(S)) %mostrar o número de valores singulares obtidos, se desejado
end
end
%Nota: ao aplicar função na command window, para apenas ver o nº de valores
%singulares obtido, usar ";" (suprimindo o output muito grande da
%decomposição SVD da matriz em questão).