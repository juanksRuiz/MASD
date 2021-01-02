function [X,Y] = circulo(x,y,r)
    X = linspace(-r,r,100);
    Y1 = sqrt(r^2-X.^2);
    Y2 = -Y1;
    X = X+x;
    Y1 = Y1+y;
    Y2 = Y2 + y;
    X = [X, nan, X, nan]';
    Y = [Y1, nan Y2, nan]';
end