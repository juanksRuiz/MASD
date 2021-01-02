%a.
p1 = [-1,-1,-2];
p2 = [-1,1,-2];
p3 = [1,1,-2];
p4 = [1,-1,-2];


% punta
p5 = [0,0,2];

% line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)]);
% line([p2(1),p3(1)],[p2(2),p3(2)],[p2(3),p3(3)]);
% line([p3(1),p4(1)],[p3(2),p4(2)],[p3(3),p4(3)]);
% line([p4(1),p1(1)],[p4(2),p1(2)],[p4(3),p1(3)]);
% 
% 
% line([p1(1),p5(1)],[p1(2),p5(2)],[p1(3),p5(3)]);
% line([p2(1),p5(1)],[p2(2),p5(2)],[p2(3),p5(3)]);
% line([p3(1),p5(1)],[p3(2),p5(2)],[p3(3),p5(3)]);
% line([p4(1),p5(1)],[p4(2),p5(2)],[p4(3),p5(3)]);
% view(30,30);

%b.

Rx = @(teta) [1,0,0;0,cos(teta),-sin(teta);0,sin(teta),cos(teta)];
Ry = @(teta) [cos(teta),0,sin(teta);0,1,0;-sin(teta),0,cos(teta)];
Rz = @(teta) [cos(teta),-sin(teta),0;sin(teta),cos(teta),0;0,0,1];

%Cambiando puntos
% p1 = p1*Rz(pi/4);
% p1 = p1*Rx(pi/6);
% p1 = p1*Ry(pi/12);
% 
% p2 = p2*Rz(pi/4);
% p2 = p2*Rx(pi/6);
% p2 = p2*Ry(pi/12);
% 
% p3 = p3*Rz(pi/4);
% p3 = p3*Rx(pi/6);
% p3 = p3*Ry(pi/12);
% 
% p4 = p4*Rz(pi/4);
% p4 = p4*Rx(pi/6);
% p4 = p4*Ry(pi/12);
% 
% p5 = p5*Rz(pi/4);
% p5 = p5*Rx(pi/6);
% p5 = p5*Ry(pi/12);
% 
% 
% 
% 
% line([p1(1),p2(1)],[p1(2),p2(2)],[p1(3),p2(3)]);
% line([p2(1),p3(1)],[p2(2),p3(2)],[p2(3),p3(3)]);
% line([p3(1),p4(1)],[p3(2),p4(2)],[p3(3),p4(3)]);
% line([p4(1),p1(1)],[p4(2),p1(2)],[p4(3),p1(3)]);
% 
% 
% line([p1(1),p5(1)],[p1(2),p5(2)],[p1(3),p5(3)]);
% line([p2(1),p5(1)],[p2(2),p5(2)],[p2(3),p5(3)]);
% line([p3(1),p5(1)],[p3(2),p5(2)],[p3(3),p5(3)]);
% line([p4(1),p5(1)],[p4(2),p5(2)],[p4(3),p5(3)]);
% view(30,30);

% c.
rotacion(p1,p2,p3,p4,p5);


function rotacion(P1,P2,P3,P4,P5)
    disp("Iniciando rotacion...");
    Rx = @(teta) [1,0,0;0,cos(teta),-sin(teta);0,sin(teta),cos(teta)];
    Ry = @(teta) [cos(teta),0,sin(teta);0,1,0;-sin(teta),0,cos(teta)];
    Rz = @(teta) [cos(teta),-sin(teta),0;sin(teta),cos(teta),0;0,0,1];

    vel = 0:0.0001:1;
    aZ = pi/4;
    aX = pi/6;
    aY = pi/12;
    
    v = VideoWriter('rotacion.avi');
    video.frameRate = 20;
    open(v);
    
    for h = vel
        P1 = P1*Rz(h*aZ);
        P1 = P1*Rx(h*aX);
        P1 = P1*Ry(h*aY);
    
        P2 = P2*Rz(h*aZ);
        P2 = P2*Rx(h*aX);
        P2 = P2*Ry(h*aY);
        
        P3 = P3*Rz(h*aZ);
        P3 = P3*Rx(h*aX);
        P3 = P3*Ry(h*aY);
        
        P4 = P4*Rz(h*aZ);
        P4 = P4*Rx(h*aX);
        P4 = P4*Ry(h*aY);
        
        P5 = P5*Rz(h*aZ);
        P5 = P5*Rx(h*aX);
        P5 = P5*Ry(h*aY);
        
        l1 = line([P1(1),P2(1)],[P1(2),P2(2)],[P1(3),P2(3)]);
        l2 = line([P2(1),P3(1)],[P2(2),P3(2)],[P2(3),P3(3)]);
        l3 = line([P3(1),P4(1)],[P3(2),P4(2)],[P3(3),P4(3)]);
        l4 = line([P4(1),P1(1)],[P4(2),P1(2)],[P4(3),P1(3)]);
 
 
        l5 = line([P1(1),P5(1)],[P1(2),P5(2)],[P1(3),P5(3)]);
        l6 = line([P2(1),P5(1)],[P2(2),P5(2)],[P2(3),P5(3)]);
        l7 = line([P3(1),P5(1)],[P3(2),P5(2)],[P3(3),P5(3)]);
        l8 = line([P4(1),P5(1)],[P4(2),P5(2)],[P4(3),P5(3)]);
       
        F = getframe(gcf);
        writeVideo(v,F);
        
        delete(l1);
        delete(l2);
        delete(l3);
        delete(l4);
        delete(l5);
        delete(l6);
        delete(l7);
        delete(l8);
             
        
    end
    close(v);
    disp("rotacion terminada");
end