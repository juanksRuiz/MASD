x = linspace(-1.5,1.5);
y = linspace(-1,3);
f = @(x,y) (1-x).^2+100*(y-x.^2).^2;
a = 1;
b = 100;
EPS = 0.1;
%Punto iniciales;
x0 = 0;
y0 = 5;
zh = 40;
z0 = f(x0,y0)+zh;

p = [x0;y0;z0];

h = 0.0001;

% Graficando la duncion de Rosenbrock
[xx,yy]=meshgrid(x,y);
ff = f(xx,yy);
surf(xx,yy,ff);
shading interp
hold on;
plot3(x0,y0,z0,'o','MarkerSize',10,'MarkerFaceColor','red')
hold on
dx0 = dx(x0,y0,a,b);
dy0 = dy(x0,y0,a,b);
g = [dx0,dy0];


v = VideoWriter('montaña.avi'); %creamos un objeto 'v' donde se almacenarán las imágenes que conforman el video
video.FrameRate=20; %definimos la cantidad de imágenes por segundo que tendrá el video

open(v); %para iniciar a adicionar las imágenes en v

for i =1:80
    cla;
    surf(xx,yy,ff);
    shading interp
    hold on;
    hold on
    p(1) = p(1) - h*dx(p(1),p(2),a,b);
    p(2) = p(2) - h*dy(p(1),p(2),a,b);
    p(3) = f(p(1),p(2))+zh;
    plot3(p(1),p(2),p(3),'o','MarkerSize',10,'MarkerFaceColor','green')
    hold on
    Dx = dx(p(1),p(2),a,b);
    Dy = dy(p(1),p(2),a,b);
    g = [Dx,Dy];
    
    xlim([-1.5, 1.5]); %fijamos los límites del eje x de la gráfica
    ylim([-1, 3]); %fijamos los límites del eje y de la gráfica
    F = getframe(gcf); %transformamos la imágen que se está mostrando en un frame
    writeVideo(v,F); %adicionamos el frame a 'v'
    cla
end

close(v); % finalizamos el video

% 
% while norm(g) > EPS
%     p(1) = p(1) - h*dx(p(1),p(2),a,b);
%     p(2) = p(2) - h*dy(p(1),p(2),a,b);
%     p(3) = f(p(1),p(2));
%     plot3(p(1),p(2),p(3),'o','MarkerSize',10,'MarkerFaceColor','green')
%     hold on
%     Dx = dx(p(1),p(2),a,b);
%     Dy = dy(p(1),p(2),a,b);
%     g = [Dx,Dy];
% end
