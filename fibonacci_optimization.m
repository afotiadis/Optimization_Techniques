clear;
close all; 
clc;

syms x;
f_1 = (x-2)^2 + x*log(x+3);
f_2 = exp(-2*x)+(x-2)^2;
f_3 = exp(x)*(x^3-1)+(x-1)*sin(x);


size=40;
k=zeros(size,1);
l=zeros(size,1);
figno=1;
i=0;

for lambda=linspace(0.005,0.15,size)
    i=i+1;
    [a,b,k(i),l(i)]=fib_algorithm(f_1,lambda);
end
figure(figno)
subplot(3,1,1)
plot(l,k,'-r')
title("Change of calculation for different l using f_1 ")
xlabel("l")
ylabel("iterations")

i=0;
for lambda=linspace(0.005,0.15,size)
    i=i+1;
    [a,b,k(i),l(i)]=fib_algorithm(f_2,lambda);
end
subplot(3,1,2)
plot(l,k,'-r')
title("Change of calculation for different l using f_2 ")
xlabel("l")
ylabel("iterations")

i=0;
for lambda=linspace(0.005,0.15,size)
    i=i+1;
    [a,b,k(i),l(i)]=fib_algorithm(f_3,lambda);
end
subplot(3,1,3)
plot(l,k,'-r')
title("Change of calculation for different l using f_3 ")
xlabel("l")
ylabel("iterations")

figno=figno+1;

l_val=[0.01,0.05,0.1];
funcNames = {'$f_1$ = $(x-3)^{2}$ + $sin^{2}(x+3)$',... 
    '$f_2$ = (x-1) $\cdot$ $cos(\frac{x}{2})$  + $x^{2}$',...
    '$f_{3}$ = ${(x+2)}^{2}$ + $e^{x-2}$ $\cdot$ $sin{(x+3)}$'};
F={f_1,f_2,f_3};
for j=1:3
    figure(figno)
    figno=figno+1;
    for n=1:3
        subplot(3,1,n)
        [a,b,k]=fib_algorithm(F(j),l_val(n));
        for i=0:1:k-1
            plot(i,a(i+1),'*r')
            hold on;
            plot(i,b(i+1),"ob")
        end
        xlim([0 12])
        title(funcNames(1,j),'Interpreter','latex')
        xlabel(sprintf("number of iterations for l=%.2f",l_val(n)))
        ylabel("[a,b]")
    end
end
