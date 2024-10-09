function xout = rk2singlestep(f,dt,tk,xk)
f1 = f(tk,xk);
f2 = f(tk+(dt/2),xk+(dt/2)*f1);
xout = xk+dt*f2;
end

