function xout = spring_mass_damper(t,x,w,d)
A = [0 1; -w^2 -2*d*w];
xout = A*x;
end

