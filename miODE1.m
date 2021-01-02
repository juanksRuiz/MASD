function dy = myODE(t,y)
g = 9.8;
a0 = 5; %area de orificio
dy = -(sqrt(2*g)*a0*sqrt(y))/pi;
end