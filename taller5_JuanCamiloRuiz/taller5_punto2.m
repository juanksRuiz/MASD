% simulacion de resorte amortiguado horizontalmente
% Los parámetros del sistema (masa, constante del resorte 
% y constante de amortiguamiento están en el script 'ODEx').
t0 = 0;
tf = 10;
x0 = 1;
x1 = 1;
[t,x] = ode45('ODEx',[t0,tf],[x0,x1]);

%Dibujamos círculo que representa masa (en el for del video)
rad = 0.5;

v = VideoWriter('resorte_amortiguado.avi'); %creamos un objeto 'v' donde se almacenarán las imágenes que conforman el video
video.FrameRate=20; %definimos la cantidad de imágenes por segundo que tendrá el video

open(v); %para iniciar a adicionar las imágenes en v

for i =1:length(t)
    [Xcirc, Ycirc] = circulo(x(i,1),0,rad);
    xpts = [min(x(:,1)),x(i,1)- rad];
    ypts = [0,0];
    p = plot(Xcirc,Ycirc);
    hold on;
    if (x(i,1)-rad) > min(x(:,1))
        line(xpts,ypts);
    end
    
    xlim([-2, 1.5]); %fijamos los límites del eje x de la gráfica
    ylim([-1.5, 1.5]); %fijamos los límites del eje y de la gráfica
    F = getframe(gcf); %transformamos la imágen que se está mostrando en un frame
    writeVideo(v,F); %adicionamos el frame a 'v'
    clf
end

close(v); % finalizamos el video
