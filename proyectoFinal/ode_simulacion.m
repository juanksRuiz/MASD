% tiempo: s
% distancia: m
%% Simulacion: semáforo ROJO
eps = 10; % metros
n = 5;
D = 30;

t0r = 0;
tfr = 10;
tspanR = t0r:0.05:tfr;

X0r = (0:-10:-(n-1)*10);
X0r = X0r + (rand(1,n)-0.5);
% ALFAS AFUERA
alfaR = [1,rand(1,n-1)]*0.8+0.2;

[tr,xr] = ode45(@ODE_rojo,tspanR, X0r,[],n,eps,alfaR,D);
% plot(tr,xr)
% xlabel("tiempo (s)")
% ylabel("distancia (m)")
% legend("x1","x2","x3","x4","x5","Location","southeast")
%--------------------------------------------------------------------------
% for i = 1:length(tr)
%     for j = 1:n
%         carro(xr(i,j),0);
%     end
%     axis([X0r(n)-5 102 -10 10])
%     % Controla las unidades en cada eje
%     daspect([1 1 1])
%     pause(0.01);
%     cla;
% end

%% Simulación: semáforo VERDE 
X0v = xr(length(tr),:);
t0v = tfr;
tfv = t0v+10;
tspanV = t0v:0.05:tfv;
alfaV = alfaR;
alfaV(1) = rand(1)*0.8+0.2; 

[tv,xv] = ode45(@ODE_verde,tspanV,X0v,[],n,eps,alfaV,D,xr(length(tr),1));
% plot(tv,xv);
% xlabel("tiempo (s)")
% ylabel("distancia (m)")
% legend("x1","x2","x3","x4","x5","Location","northwest")
%HACER ZOOM SOBRE EL INICIO

%--------------------------------------------------------------------------
% 
% for i = 1:length(tv)
%     for j = 1:n
%         carro(xv(i,j),0);
%     end
%     axis([X0r(n)-5 102 -10 10])
%     % Controla las unidades en cada eje
%     daspect([1 1 1])
%     pause(0.01);
%     cla;
% end

%% simulacion final 
% graficando ciclo completo: rojo y verde
T = [tr;tv];
xf = [xr;xv];
% plot(T,xf);
% hold on;
% line([tr(length(tr)), tr(length(tr))],[-100,350],'LineStyle','--','Color','red');
% % line(x,y,'Color','red','LineStyle','--')
% xlabel("tiempo (s)")
% ylabel("distancia (m)")
% legend("x1","x2","x3","x4","x5","Location","northwest")
%--------------------------------------------------------------------------
% VIDEO
for i = 1:length(T)
    line([D,D],[-20,20],'color','black');
    if T(i) <= tfr-3
        plot(D-5,15,'.r','MarkerSize',60);
    elseif (T(i)>= (tfr -3)) && (T(i) < tfr)
        plot(D-5,15,'.y','MarkerSize',60);
    else
        plot(D-5,15,'.g','MarkerSize',60);
    end
    
    for j = 1:n
        carro(xf(i,j),0);
        hold on;
    end
    axis([X0r(n)-5 102 -20 20])
    %Controla las unidades en cada eje
    daspect([1 1 1])
    pause(0.01);
    cla;
end


%% condiciones de equilibrio
% n = 3;
% a = sym('a',[n,1]);
% % Construimos la matriz A del sistema con semaforo rojo
% A = [-a(1),zeros(1,n-1)];
% for i = 2:n
%     reg = [zeros(1,i-2),a(i),-a(i), zeros(1,n-i)];
%     A = [A; reg];
% end
% 
% syms('E');
% syms('D');
% 
% u = [a(1)*D; -a(2:length(a))*E];
% xp = (-A)\u;
% 
% % calculemos la matriz de transición de estados
% syms('t');
% phi = expm(A*t);
% phi = simplify(phi)
% pretty(phi); % horrible, mejor con inv(M)*exp(Jt)*M
% 
% 
% % como el limite de phi es la matriz 0 podemos afirmar que
% x* es asintoticamente estable

%%
% % preliminares: creación de vieo
% % 
% x=(-1:0.01:1); %creamos la variable independiente para graficar la línea
% 
% v = VideoWriter('prueba.avi'); %creamos un objeto 'v' donde se almacenarán las imágenes que conforman el video
% video.FrameRate=20; %definimos la cantidad de imágenes por segundo que tendrá el video
% 
% open(v); %par iniciar a adicionar las imágenes en v
% 
% for m =-1:0.01:1 % m es la pendiente de la línea
%     y = m*x; %variable dependite de la línea
%     plot(x,y,'LineWidth',2);
%     xlim([-1.5, 1.5]); %fijamos los límites del eje x de la gráfica
%     ylim([-1.5, 1.5]); %fijamos los límites del eje y de la gráfica
%     F = getframe(gcf); %transformamos la imágen que se está mostrando en un frame
%     writeVideo(v,F); %adicionamos el frame a 'v'
% end
% 
% close(v); % finalizamos el video