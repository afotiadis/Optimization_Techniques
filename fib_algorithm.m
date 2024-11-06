function [a,b,k,l] = fib_algorithm(f,lambda)
%Fibonacci Algorithm

%Initializing the number of repetitions, the starting edges of the search
%area and preallocating the saving matrices for the edges
l=lambda; 
n=0;
k=1;
a=[];
b=[];
a(k)=-1;
b(k)=3;
F=(b(k)-a(k))/l;

%Terminating condition
while F>fib_sequence(n-1)
    n=n+1;
end

%Implementing the method and the repeating part of it
x1=a(k)+(1-fib_sequence(n-1-k)/fib_sequence(n-k))*(b(k)-a(k));
x2=a(k)+(fib_sequence(n-1-k)/fib_sequence(n-k))*(b(k)-a(k));

for k=1:n-1
    if(subs(f,x1)<=subs(f,x2))
        a(k+1)=a(k);
        b(k+1)=x2;
        x2=x1;
        x1=a(k+1)+(1-fib_sequence(n-1-(k+1))/fib_sequence(n-(k+1)))*(b(k+1)-a(k+1));
    else
        b(k+1)=b(k);
        a(k+1)=x1;
        x1=x2;
        x2=a(k+1)+(fib_sequence(n-1-(k+1))/fib_sequence(n-(k+1)))*(b(k+1)-a(k+1));
    end
end
end
