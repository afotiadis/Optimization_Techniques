function [xk,n]= st_desc_armijo(f,epsilon,gamma,X)

d=[];
k=1;
xk=X;

grad_f=gradient(f);

mk=0;
a=2*10^(-3);
b=1/4;
s=gamma*b^mk;

while(norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))>epsilon)

    d=[d -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

    fx_k=double(f(x(1,k),x(2,k)));
    grad_mtx=double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
    while(fx_k-double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k)))<-a*b^mk*s*d(:,k)'*grad_mtx)
        mk=mk+1;
        gamma=s*b^mk;
    end

    x_k=xk(:,k)+gamma*d(:,k);
    xk=[xk x_k];

    k=k+1

    mk=0;
    gamma=s*b^mk;
end
n=k-1;
end