function dx = ODE10(t,x)
    dx(1,1) = 0.5*x(2)+5;
    dx(2,1) = -0.5*x(1)+10;
end