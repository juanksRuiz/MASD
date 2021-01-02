function xp = ODEx(t,x)
    %ahora x es un vector
    % k constante de resorte
    k = 10;
    % masa del resorte
    m = 2;
    %b: constante de amortiguamiento
    b = 1;
    xp(1,1) = x(2);
    xp(2,1) = (-k*x(1)-b*x(2))/m;
end