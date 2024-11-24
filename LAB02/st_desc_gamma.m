function[xk,n]=st_desc_gamma(f,epsilon,~,X)

d=[];
k=1;
xk=X;
grad_f=gradient(f);

syms gamma_value

while(norm(double(subs(grad_f,symvar(grad_f),{xk(:,k)'})))>epsilon)
    d=[d -double(subs(grad_f,symvar(grad_f),{xk(:,k)'}))];

    func_min(gamma_value)=f(xk(1,k)+gamma_value*d(1,k),xk(2,k)+gamma_value*d(2,k));

    gamma=gold_sect_modified(func_min,0.001,0,1);

    x_k=xk(:,k)+gamma*d(:,k);
    xk=[xk x_k];
    k=k+1;
end

n=k-1;
end