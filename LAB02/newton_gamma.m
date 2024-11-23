function [xk,n]=newton_gamma(f,epsilon,~,X)

d=[];
k=1;
xk=X;

grad_f=gradient(f);
hess_f=hessian(f);
max_step=100;

syms gamma_value;

while(norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))>epsilon)
    grad_mtx=double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
    hess_mtx=double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));

    d=[d -hess_mtx\grad_mtx];

    func_min(gamma_value)=f(xk(1,k)+gamma_value*d(1,k),xk(2,k)+gamma_value*d(2,k));

    gamma=gold_sect_modified(func_min,0.001,0.1);

    x_k=xk(:,k)+gamma*d(:,k);
    xk=[xk x_k];

    k=k+1;

    if(k==max_step || f(xk(1,k),xk(2,k))>=f(xk(1,k),xk(2,k-1)))
        break
    end
end
n=k-1;
end
