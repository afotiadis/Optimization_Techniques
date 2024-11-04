function [a,b,k,l] = bisection_w_der(f,lambda)

k=1;
n=0;
a=[];
b=[];
a(k)=-1;
b(k)=3;
l=lambda;
syms x;
df=diff(f,x);

while(n<log2((b(k)-a(k)))/l)
    n=n+1;
end

for k=1:n
    xk=(a(k)+b(k))/2;
    der=subs(df,xk);

    if der==0
        return
    elseif der>0
        a(k+1)=a(k);
        b(k+1)=xk;
    else
        a(k+1)=xk;
        b(k+1)=b(k);
    end
end
end