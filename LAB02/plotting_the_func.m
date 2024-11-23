clc;
clf;
clear;

syms x y;
f(x,y)=(x.^5).*exp(-x.^2-y.^2);

figno=1;
figure(figno)
grid on;
fsurf(f,'ShowContours','on');
title('3D plot of $f(x,y)$ = $x^{5}$ $\cdot$ $e^{-x^2-y^4}$','Interpreter','latex');
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
box on;
figno=figno+1;

figure(figno)
fcontour(f,[-3,3]);
grid on;
title('Contour lines of $f(x,y)$ = $x^{5}$ $\cdot$ $e^{-x^2-y^4}$','Interpreter','latex');
xlabel('x');
ylabel('y');
