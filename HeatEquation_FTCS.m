close all
%Initial Conditions
dx = 0.1;
dt = 0.02;
v = 1/6;
X = 0:dx:1;
T = 0.02;
time = 0:dt:T;
U = zeros(length(time),length(X));
for i=2:length(X)-1
    U(1,i) = sin(2*pi*X(i));
end
lambda = v*(dt/(dx^2));
plot(X,U(1,:),'k','LineWidth',2)
hold on
for j=1:length(time)-1
    for i=2:length(X)-1
        U(j+1,i) = U(j,i) + lambda*(U(j,i+1)-2*U(j,i)+U(j,i-1));
    end
    U(j+1,1) = 0;  % Left boundary condition
    U(j+1,end) = 0;  % Right boundary condition
end
plot(X,U(end,:),'r','LineWidth',2)