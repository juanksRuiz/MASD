function dx =  ODE_rojo(t,x,n0,eps0,alfa2,D0)
    % D0: distancia del semaforo
    % n0: numero de carros
    % eps0: distancia entre dos carros consecutivos
    % alfa1: coeficientes de proporcionalidad, len(alfa1) = n0
    % Ahora el primer alfa es del primer carro
    
    dx(1,1) = alfa2(1)*(D0-x(1));
    for i = 2:n0
        dx(i,1) = alfa2(i)*(x(i-1) - x(i) - eps0);
    end
    
end