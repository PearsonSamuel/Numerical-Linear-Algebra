function [c] = mpot2(A,x0,eps)
if norm(x0,Inf)~= 1 %verificar condições para x0: norma infinito = 1
    disp("a aproximação inicial escolhida não é válida")
else
    c=1; %inicializar número de condição
    for i= 1:2
        if i==1
            B=A; %calcular rho(A)
        elseif i==2
            B=inv(A); %calcular rho(A^-1)
        end
        x=x0; %inicializar método das potências: k=0
        d=eps+1;
        lb1=eps;
        while d>eps %iterações do método: k=1,2,...
        lb0=lb1;
        z=B*x;
        v=find(x); %lista de índices de x(k) diferentes de 0
        j=v(1);
        lb1=z(j)/x(j);
        x=z/lb1;
        d=abs((lb1-lb0)/lb1);
        end
        c=abs(lb1)*c; %no final do ciclo for, c=1*rho(A)*rho(A^-1)
    end
end
