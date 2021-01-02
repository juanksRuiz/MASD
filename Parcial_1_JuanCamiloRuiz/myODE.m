function dy = myODE(t,y)
    A = 50;
    k = 0.5;
    dy = k*(A-y);
end