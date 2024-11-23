function [xk,n] = st_desc_const(f,epsilon,gamma,X)

d=[];
k=1;
xk=X;
grad_f=gradient(f);

while(norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))>epsilon)

    d=[d -double(subs(grad_f, symvar(grad_f),{xk(:,k)'}))];

    x_k=xk(:,k)+gamma*d(:,k);
    xk=[xk x_k];

    k=k+1;
end
n=k-1;
end