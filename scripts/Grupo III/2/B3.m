
g=@(n)  mpot2(hilb(n),[1;zeros(n-1,1)],10^-5) %nr de condição de Hn pelo metodo potências 
f=@(n)  cond(hilb(n),2) %nr de condição de Hn pela função do Matlab
x=[5:15 20 25 30 35 40];
y=[5:40];
w=arrayfun(g,x)  %vetor com nr de condição de matrizes Hn para n=5,...,15,20,25,...,40
z=arrayfun(f,y);
hold on
clear figure
plot(x,log(w),"bx")  %log do nr de condição por potências
plot(x,log(w),"b") 
plot(y,log(z),"r")  %log do nr de condição por função do Matlab 
xlabel("Dimensão de Hn") 
ylabel("log(cond(Hn))")
set(gca, 'XLim', [5, 40], 'XTick', 5:5:40,'XTickLabel', 5:5:40);


