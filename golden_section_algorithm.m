function [a,b,k,l] = golden_section_algorithm(f,lambda)

gamma=(sqrt(5)-1)/2;
k=1;
a=[];
a(k)=-1;
b=[];
b(k)=3;
l = lambda;
x1=a(k)+(1-gamma)*(b(k)-a(k));
x2=a(k)+gamma*(b(k)-a(k));
while(b(k)-a(k)>l)
    k=k+1;
    if (subs(f,x1)>subs(f,x2))
        a(k)=x1;
        b(k)=b(k-1);
        x1=x2;
        x2=a(k)+gamma*(b(k)-a(k));
    else
        a(k)=a(k-1);
        b(k)=x2;
        x2=x1;
        x1=a(k)+(1-gamma)*(b(k)-a(k));
    end
end

