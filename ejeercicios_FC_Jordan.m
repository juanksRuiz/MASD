A = [3,-1,1,1,0,0;1,1,-1,-1,0,0;0,0,2,0,1,1;0,0,0,2,-1,-1;0,0,0,0,1,1;0,0,0,0,1,1];
lam = eig(A);
% lam_1 = 2 -------> m_1 = 5
% lam_2 = 0 -------> m_2 = 1

% Para lam_1 = 2:
a1 = A - lam(1)*eye(size(A));
n11 = 6 - rank(a1);

a1^2
%n12 = 4;

a1^3
%n13 = 5;

%n11 = 2 bdJ de orden 1+
%n12 - n11 = 2 bsdJ de orden 2+
%n13 - n13 = 1 bdJ de orden 3

%--> un bloque de orden 2 y un bloque de orden 3

% Para lam_2 = 0
n21 = 6 - rank(A) % = 1 --> 1 bdJ de orden 1

%% Ejercicio 2
% Encontrar vectores propios generalizados LI de:
A = [1,1,0;0,1,2;0,0,3];
lam = eig(A)
a1 = A - lam(1)*eye(size(A))
rref([a1 zeros(3,1)])
%% Ejercicio 3
% encontrar una base conformada por cadenas de vectores prop. gen. de
A = [1,2,0;1,1,2;0,-1,1];
lam = eig(A)

a1 = A - 1*eye(size(A))
v3 = [1;0;1];
v2 = a1*v3
v1 = a1*v2
M = [v1,v2,v3]
%% Ejercicio 5
% Encontrar la matriz modal de:
A = [1,1,2;0,1,3;0,0,2];
lam = eig(A)
% lam(1) = 1 --------> m_1 = 2
% lam(2) = 2 --------> m_2 = 3
a1 = A - lam(1)*eye(size(A))
v2 = [1;1;0];
v1 = [1;0;0];
a2 = A - lam(3)*eye(size(A));
u1 = [5;3;1];

M = [v1,v2,u1];
Ag = inv(M)*A*M
syms('t')
eJt = [exp(t), t*exp(t), 0;0,exp(t),0;0,0,exp(t)]
inv(M)*eJt*M
