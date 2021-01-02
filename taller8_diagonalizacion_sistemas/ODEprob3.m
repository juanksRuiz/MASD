function dz = ODEprob3(t,z)
    dz(1,1) = -3*z(1);
    dz(2,1) = -z(2);
    dz(3,1) = 0;
end