function [xk,n] = lev_marq_armijo(f,epsilon,gamma,X)

d=[];
k=1;
xk=X;

grad_f=gradient(f);
hess_f=hessian(f);

mk=0;
a=2*10^(-3);
b=1/4;
s=gamma*b^mk;

    while(norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))>epsilon)
        hess_mtx=double(subs(hess_f,symvar(hess_f),{xk(:,k)'}));
        eigen_values=eig(hess_mtx);
    
        if(sum(eigen_values<0)>0)
            uk=max(abs(eigen_values))+0.2;
        end
        A=hess_matrix+uk*eye(2);
        B=-double(subs(grad_f,symvar(grad_f),{xk(:,k)'}));
    
        d=[d linsolve(A,B)];
    
        f_xk=double(f(xk(1,k),xk(2,k)));
        while (f_xk-double(f(xk(1,k)+gamma*d(1,k),xk(2,k)+gamma*d(2,k)))<-1*b^mk*s*d(:,k)'*(-B))
            mk=mk+1;
            gamma=s*b^mk;
        end
        x_k=xk(:,k)+gamma*d(:,k);
        xk=[xk x_k];
    
        k=k+1;
    
        mk=0;
        gamma=s*b^mk;
    end
n=k-1;
end