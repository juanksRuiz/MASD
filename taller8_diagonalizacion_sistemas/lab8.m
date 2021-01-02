% problema 2
% A: matriz del sistema
A = [-1,1,0;1,-2,1;0,1,-1];
lam = eig(A); % -3, -1, 0

%%Encontremos los vectores propios de A
% for i  = 1:length(lam)
%     disp("Valor propio:");
%     disp(lam(i))
%     a = A - lam(i)*eye(size(A));
%     disp ("rref([(A - lam(i)), zeros(n,1)] )")
%     sol = rref([a,zeros(size(A,1),1)]);
%     disp(sol);
%     disp("-------------------------------------")
% end

% M = [1,1,1;-2,0,1;1,-1,1]
% % Matriz A_gorro del nuevo sistema:
% Ag = inv(M)*A*M;
% 
% % simulando el nuevo sistema (ahora con z)
% t_span = [0,10];
% [t,z] = ode45('ODEprob3',t_span,[8,6,1]);
% plot(t,z)
% legend('z1','z2','z3')

%% Ejercicio 3
% a)
% A = [0.5,0,0;0.5,0.75,0;0,0.25,1];
% lam = eig(A);
% 
% for i  = 1:length(lam)
%     disp("Valor propio:");
%     disp(lam(i))
%     a = A - lam(i)*eye(size(A));
%     disp ("rref([(A - lam(i)), zeros(n,1)] )")
%     sol = rref([a,zeros(size(A,1),1)]);
%     disp(sol);
%     disp("-------------------------------------")
% end

%%Ejercicio 5
n = 5;
A = ones(n,n);
syms("lam");
M = [ones(1,n-1),1;-eye(n-1,n-1),ones(n-1,1)];
% Diagonalizacion del sistema
Ag = inv(M)*A*M;
An = A - 5*eye(size(A));
rref([An zeros(n,1)]);