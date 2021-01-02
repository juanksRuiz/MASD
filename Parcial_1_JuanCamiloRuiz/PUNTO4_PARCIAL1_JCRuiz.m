L0 = 1;
tspan = [0,12];
[t,y] = ode45('myODE',tspan,L0);


xlabel("tiempo")
ylabel("Talla (cm)")
plot(t,y)



