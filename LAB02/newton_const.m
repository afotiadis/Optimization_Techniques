function [xk,n]=newton_const(f,epsilon,gamma,X)

d=[];
k=1;
xk=X;

grad_f=gradient(f);
hess_f=hessian(f);

while((norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))))>epsilon)
    grad_mtx=double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
    hess_mtx=double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));

    d=[d -hess_mtx\grad_mtx];
    x_k=xk(:,k)+gamma*d(:,k);
    xk=[xk x_k];
    k=k+1;
end
n=k-1;
end