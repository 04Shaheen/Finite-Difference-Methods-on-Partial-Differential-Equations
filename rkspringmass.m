%parameters
w = 2*pi;
d = 0.25;
dt = 0.1;
T = 10;
x0 = [2;0];
nsteps = T/dt;
xrk2 = zeros(2,nsteps);
xrk2(:,1)=x0;
xrk4 = zeros(2,nsteps);
xrk4(:,1)=x0;
trk2 = zeros(1,nsteps);
trk4 = zeros(1,nsteps);
xin1 = x0;
xin2 = x0;
for k=1:nsteps
    trk2(k+1) = k*dt;
    xout = rk2singlestep(@(t, x) spring_mass_damper(t, x, w,d), dt, k*dt, xin1);
    xrk2(:,k+1) = xout;
    xin1 = xout;
end

for k=1:nsteps
    trk4(k+1) = k*dt;
    xout = rk4singlestep(@(t, x) spring_mass_damper(t, x, w,d), dt, k*dt, xin2);
    xrk4(:,k+1) = xout;
    xin2 = xout;
end

plot(trk2,xrk2(1,:),'k','Linewidth',2)
hold on
plot(trk4,xrk4(1,:),'r','LineWidth',2)
legend('RK2','RK4')
title('Runge Kutta Methods to Approximate Solutions to Spring-Mass Damper System')


