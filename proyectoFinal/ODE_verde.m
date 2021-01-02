function dx = ODEx(t,x, n0,eps0,alfa1,D0,x1f)
    % n0: numero de carros
    % eps0: distancia entre dos carros consecutivos
    % alfa1: coeficientes de proporcionalidad, len(alfa1) = n0
    % D0: distancia del semáforo
    % x1f: posicion final de
      
    % v0: velocidad inicial (velocidad inicial)
    % v0 = alfa1(1)*(D0-x1f);
    v0 = 30;
    dx(1,1) = v0;
    for i = 2:n0
        dx(i,1) = alfa1(i)*(x(i-1) - x(i) - eps0);
    end
    
end