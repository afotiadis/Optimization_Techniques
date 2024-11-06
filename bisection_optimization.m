% Plot the number of calculations for each function, for the different
% lambdas and epsilons.
clear;
close all;
%functions to be minimized
syms x;
f_1 = (x-2)^2 + x*log(x+3);
f_2 = exp(-2*x)+(x-2)^2;
f_3 = exp(x)*(x^3-1)+(x-1)*sin(x);

size = 50;

% Fixed Lambda.
% Plot the the number of calculations for each function, for the different
% lambdas
k = zeros(size,1); 
e = zeros(size,1); 
lambda = 0.01;
figure('Name','Plots for fixed lambda','NumberTitle','off')
i = 0;
for epsilon = linspace(0.001,0.0049,size) %epsilon> lambda/2 
    i = i + 1;
    [a,b,k(i),e(i),~] = bisectionalgorithm(f_1, epsilon, lambda);
end
subplot(3,1,1)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_1(x) = (x-2)^2 + x \cdot \ln(x+3)$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

i = 0;
for epsilon = linspace(0.0001,0.0049,size) %epsilon> lambda/2
    i = i + 1;
    [a,b,k(i),e(i),~] = bisectionalgorithm(f_2, epsilon, lambda);
end
subplot(3,1,2)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_2(x) = e^{-2x} + (x-2)^2$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

i = 0;
for epsilon = linspace(0.0001,0.0049,size) %epsilon> lambda/2
    i = i + 1;
    [a,b,k(i),e(i),~] = bisectionalgorithm(f_3, epsilon, lambda);
end
subplot(3,1,3)
plot(e,2*(k-1),'-r','LineWidth',1.4)
title('$f_3(x) = e^{x^3 - 1} + (x-1) \cdot \sin(x)$','Interpreter', 'latex')
xlabel('\epsilon') 
ylabel('numbers of iterations') 

%=========================================================================

% Fixed epsilon

k = zeros(size,1); l = zeros(size,1); epsilon = 0.001; 
figure('Name','Plots for fixed epsilon','NumberTitle','off')
i = 0;
for lambda = linspace(0.0021,0.1,size) %lambda>2epsilon
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisectionalgorithm(f_1, 0.001, lambda);
end
subplot(3,1,1)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_1(x) = (x-2)^2 + x \cdot \ln(x+3)$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lambda = linspace(0.0021,0.1,size) %lambda>2epsilon
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisectionalgorithm(f_2, 0.001, lambda);
end
subplot(3,1,2)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_2(x) = e^{-2x} + (x-2)^2$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

i = 0;
for lambda = linspace(0.0021,0.1,size) %lambda>2epsilon
    i = i + 1;
    [a,b,k(i),epsilon,l(i)] = bisectionalgorithm(f_3, epsilon, lambda);
end
subplot(3,1,3)
plot(l,2*(k-1),'-r','LineWidth',1.4)
title('$f_3(x) = e^{x^3 - 1} + (x-1) \cdot \sin(x)$','Interpreter', 'latex')
xlabel('l') 
ylabel('numbers of iterations') 

%=======================================================================
%Giving l some standard values
figno=3;
epsilon=0.001;
l_val=[0.01,0.05,0.1];
funcNames = {
    '$f_1(x) = (x-2)^2 + x \cdot \ln(x+3)$', ...
    '$f_2(x) = e^{-2x} + (x-2)^2$', ...
    '$f_3(x) = e^{x^3 - 1} + (x-1) \cdot \sin(x)$'
};

F={f_1,f_2,f_3}; %struct that contains all the functions 

%In this loop we study how the edges of the search area change during the
%algorithm's performance
for j=1:3
    figure(figno)
    figno=figno+1;
    for n=1:3
        subplot(3,1,n)
        [a,b,k]=bisectionalgorithm(F(j),epsilon,l_val(n));
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