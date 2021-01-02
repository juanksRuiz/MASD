% 1. Preliminares: uso de la funcion plot
x = -1:0.01:1;
f1 = @(x) x^2;
f2 = @(x) 2*x;
y1 = [];
for i = x
    y1 = [y1,f1(i)];
end
% plot(x,y1,'Color','green','LineWidth',2);
% xlim([-2,2]);
% ylim([-1,2]);
% hold on;
% 
% y2 = [];
% for i = x
%     y2 = [y2 f2(i)];
% end
% plot(x,y2,'Color','red','LineWidth',2);
%==============================


% 2. Preliminares: creacion de video
% y = 0;
% v = VideoWriter('video2.avi');
% video.FrameRate=20;
% 
% open(v);
% for r = 0:0.01:1
%     plot(r,y,'Marker','o','MarkerSize',10);
%     xlim([-1.2,1.2]);
%     ylim([-1.5,1.5]);
%     F = getframe(gcf);
%     writeVideo(v,F);
% end

%close(v);

f = @(x,t) t-x^2; % dx
h = 0.1;
t = 0:h:150;
x0 = 2;
t0 = 0;
x = [x0];
n = length(t);

for i = 2:n
    x(i) = x(i-1)+ h*f(x(i-1),t(i-1));
end


plot(t,x)
