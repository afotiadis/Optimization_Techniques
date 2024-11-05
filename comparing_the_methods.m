clear;
close all;
clc;

syms x;
f_1 = (x-2)^2 + x*log(x+3);
%f_2 = exp(-2*x)+(x-2)^2;
%f_3 = exp(x)*(x^3-1)+(x-1)*sin(x);

size=10;
k_b=zeros(size,1);
k_gs=zeros(size,1);
k_f=zeros(size,1);
k_bw=zeros(size,1);
l_b=zeros(size,1);
l_gs=zeros(size,1);
l_f=zeros(size,1);
l_bw=zeros(size,1);
figno=1;
figure(figno)

i=0;

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

plot(l_b,2*(k_b-1),'r');
hold on;
plot(l_gs,2*(k_gs-1),'b');
hold on;
plot(l_f,2*(k_f-1),'c');
hold on;
plot(l_bw,2*(k_bw-1),'g');
hold off;


title("Comparison for the 4 algorithms");
xlabel("l");
ylabel("Number of calls")
legend("bisection","golden section","fibonacci","bisection with derivatives");

