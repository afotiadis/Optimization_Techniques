function [xk,n]= lev_marq_const(f,epsilon,gamma,X)

d=[];
k=1;
xk=X;

grad_f=gradient(f);
hess_f=hessian(f);

while(norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))>epsilon)
    hess_mtx=double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
    eigen_values=eig(hess_mtx);

    if(sum(eigen_values<0)>0)
        uk=max(abs(eigen_values))+0.2;
    end
    A=hess_matrix+uk*eye(2);
    B=-double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));

    d=[d linsolve(A,B)];

    x_k=xk(:,k)+gamma*d(:,k);
    xk=[xk x_k];

    k=k+1;
end

n=k-1;
end