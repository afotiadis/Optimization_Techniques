clear;
close all;
clc;
%In this program we use all the methods on all the functions and use the
%results to compare their efficiency
syms x;
f_1 = (x-2)^2 + x*log(x+3);
%f_2 = exp(-2*x)+(x-2)^2; 
%f_3 = exp(x)*(x^3-1)+(x-1)*sin(x);
%(Comment in the corresponding lines to run the
%simulation for f2 or f3)

size=10; %running 10 iterations
k_b=zeros(size,1); %the number of iterations for the bisection method
k_gs=zeros(size,1);%the number of iterations for the golden section method
k_f=zeros(size,1);%the number of iterations for the fibonacci method
k_bw=zeros(size,1);%the number of iterations for the bisection with der method
l_b=zeros(size,1);%the precision for the bisection method
l_gs=zeros(size,1);%the precision for the golden section method
l_f=zeros(size,1);%the precision for the fibonacci method
l_bw=zeros(size,1);%the precision for for the bisection with der method
figno=1;
figure(figno)

i=0;
%Testing all the algorithms
for lambda=linspace(0.0021,0.01,size)
    i=i+1;
    [~,~,k_b(i),~,l_b(i)]=bisectionalgorithm(f_1,0.0001,lambda);
    [~,~,k_gs(i),l_gs(i)]=golden_section_algorithm(f_1,lambda);
    [~,~,k_f(i),l_f(i)]=fib_algorithm(f_1,lambda);
    [~,~,k_bw(i),l_bw(i)]=bisection_w_der(f_1,lambda);

    %[~,~,k_b(i),~,l_b(i)]=bisectionalgorithm(f_2,0.0001,lambda);
    %[~,~,k_gs(i),l_gs(i)]=golden_section_algorithm(f_2,lambda);
    %[~,~,k_f(i),l_f(i)]=fib_algorithm(f_2,lambda);
    %[~,~,k_bw(i),l_bw(i)]=bisection_w_der(f_2,lambda);

    %[~,~,k_b(i),~,l_b(i)]=bisectionalgorithm(f_3,0.0001,lambda);
    %[~,~,k_gs(i),l_gs(i)]=golden_section_algorithm(f_3,lambda);
    %[~,~,k_f(i),l_f(i)]=fib_algorithm(f_3,lambda);
    %[~,~,k_bw(i),l_bw(i)]=bisection_w_der(f_3,lambda);
end

%Plotting all the results in one figure
plot(l_b,2*(k_b-1),'r');
hold on;
plot(l_gs,k_gs,'b');
hold on;
plot(l_f,(k_f-1),'c');
hold on;
plot(l_bw,k_bw,'g');
hold off;


title("Comparison for the 4 algorithms");
xlabel("l");
ylabel("Number of calls")
legend("bisection","golden section","fibonacci","bisection with derivatives");

