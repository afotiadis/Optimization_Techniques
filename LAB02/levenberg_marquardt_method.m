close all;
clc;
clear;

syms x y;
f(x,y)=(x.^5).*exp(-x.^2-y.^2);

X=[0 -1 1;0 -1 1];
method = ["lev_marq_const", "lev_marq_gamma", "lev_marq_armijo"];
gamma_method = ["const", "minimized with modified golden section", "armijo"];
epsilon=0.01;
gamma=0.5;
figno=1;

for i=1:3
    for j=1:3
        algorithm=str2func(method(j));
        [xk,n]=algorithm(f,epsilon,gamma,X(:,i));
        plot_titles=sprintf(['Levenber-Marquardt\nMethod for gamma %s' ...
            ',Starting point = (%d,%d) \n#iterations = %d Minimum=' ...
            '(%.2f,%.2f)'],gamma_method(j),X(1,i),X(2,i),n,xk(1,end),xk(2,end));
        figure(figno);
        figno=figno+1;
        fcontour(f,[-3,3]);
        hold on;
        grid on;
        title(plot_titles);
        xlabel('x');
        ylabel('y');
        plot(xk(1,1:end),xk(2,1:end));
        scatter(xk(1,end),xk(2,end),'*');
        figure(figno);
        hold on;
        figno=figno+1;
        plot(0:n,f(xk(1,:),xk(2,:)))
        text=sprintf('Minimum @(%.3f,%.3f)\n f=%.3f',xk(1,end),xk(2,end),double(f(xk(1,end),xk(2,end))));
        annotation('textbox','String',text);
        graph_title=sprintf(['Value of the function as k changes, using' ...
            '\n%s method for gamma with (%d,%d) as starting point'],gamma_method(j),X(1,i),X(2,i));
        title(graph_title);
        set(gca,'Xtick',0:n);
        xlabel('k-th iteration');
        ylabel('f(xk,yk)');
    end
end

