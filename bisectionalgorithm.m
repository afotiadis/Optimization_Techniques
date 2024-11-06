function [a,b,k,e,l] = bisectionalgorithm(f,epsilon,lambda)
% Bisection 

k = 1; %Initializing the iterations variable (first iteration) 
a = []; %preallocating for the edges of the search area
b= [];
l = lambda; %Parameters
e = epsilon;
a(k) = -1; 
b(k) = 3;

%Implementing the repeating part of the algorithm
while b(k)-a(k)>l
    x_1 = (a(k) + b(k))/2 - e;
    x_2 = (a(k) + b(k))/2 + e;
    k = k + 1;
    if subs(f,x_1) < subs(f,x_2)
        a(k) = a(k-1);
        b(k) = x_2;
    else
        a(k) = x_1;
        b(k) = b(k-1);
    end
end