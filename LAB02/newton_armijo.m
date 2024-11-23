function [xk,n]= newton_armijo(f,epsilon,gamma,X)

d=[];
k=1;
xk=X;

grad_f=gradient(f);
hess_f=hessian(f);
max_step=100;

mk=0;
a=2*10^(-3);
b=1/4;
s=gamma*b^mk;

while(norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))>epsilon)

    grad_mtx=double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
    hess_mtx=double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));

    d=[d -hess_mtx\grad_mtx];

    fx_k=double(f(xk(1,k),xk(2,k)));
    while(fx_k-double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k)))<-a*b^mk*s*d(:,k)'*grad_mtx)
        mk=mk+1;
        gamma=s*b^mk;
    end
    x_k=xk(:,k)+gamma*d(:,k);
    xk=[xk x_k];

    k=k+1;
    if(k==max_step || f(xk(1,k),xk(2,k))>=f(xk(1,k-1),xk(2,k-1)))
        break
    end

    mk=0;
    gamma=s*b^mk;
end
n=k-1;
end
