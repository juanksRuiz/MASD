% Taller 10
% Ejercicio 2

A = [0,0.5;-0.5,0];
b = [5;10];

xpe = (eye(size(A))-A)\b;
% Solo hay un punto de equilibrio
% x* = [20;10]

% con la ecuacioni caracteristica los valores propios son 
lam = eig(A); % lam1 = 1/2 ; lam2 = -1/2;

% Como estamos en un sistema dicreto y abs(lam(i)) < 1 entonces
% x* es asintóticamente estable la MTE M*lam^(k-l)*inv(M) tiene a 0

% t0 = 0;
% tf = 100;
% tspan = [t0,tf];
% [t,x] = ode45('ODE10', tspan, [8,6]);
% stem(x)

X1 = [0];
X2 = [0];
for i = 2:20
    X1(i) = 0.5*X2(i-1)+5;
    X2(i) = -0.5*X1(i-1)+10;    
end

stem(X1);
hold on;
stem(X2);
legend("x1","x2")
title("Simulacion con X0 = [0,0]")