h0 = 50;
hc = 100;


t0 = 0;
tf = 2;
tspan = [t0 tf];
y0 = h0;

[t,y] = ode45('miODE1',tspan,y0);


figure()
xlim([-2,2]);
ylim([-2,2]);
zlim([0,60]);
view(60,30);
% Punto 1
for i = 1:length(t)
    agua(y(i),hc)
    pause(0.1)
    cla;
end




%%
function agua(h,hc)
%la función agua(h,hc) dibuja un contenedor cilíndrico de altura hc con agua cuya altura es h


r=1; %radio del cilindro (contenedor y agua)
n=500; %resolución del cilindro (contenedor y agua)

[X,Y,Z] = cylinder(r,n); %se crea el cilindro (contenedor y agua)

hold on
%dibuja el contenedor:
surf(X,Y,(hc-h)*Z+h,'facecolor','b','FaceAlpha',0.1,'Edgecolor','none'); 
plot3(X(2,:),Y(2,:),(hc-h)*Z(2,:)+h)

%dibuja el agua:
ag=surf(X,Y,h*Z,'facecolor','b','LineStyle','none');
fill3(X(1,:),Y(1,:),h*Z(1,:),'b');  
fill3(X(2,:),Y(2,:),h*Z(2,:),'b');  


end

