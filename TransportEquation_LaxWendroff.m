close all
%initialize function
dx = 0.01;
X = -10:dx:10;
dt = 0.01;
T = 2;
timespan = T/dt;
time = 0:dt:T;
U = zeros(length(time),length(X));
for i=1:length(X)
    k=X(i);
    if(k<=0)
        U(1,i)=1;
    end
    if(k>0&&k<=1)
        U(1,i) = 1-k;
    end
    if(k>1)
        U(1,i)=0;
    end
end

R = dt/dx;
c = 1.5;
%scheme
for j=1:length(time)-1
   % t = time(j);
    for i=2:length(X)-1
     %Lax-Wendroff Scheme
        U(j+1,i) = (c*R/2)*(1+c*R)*U(j,i-1)+(1-c^2*R^2)*U(j,i)-(c*R/2)*(1-c*R)*U(j,i+1);
    end
    %Boundary values 
    U(j+1,1) = U(j+1,2); 
    U(j+1,end) = U(j+1,end-1); 
end

plot(X,U(1,:),'k','Linewidth',2)
hold on
plot(X,U(end,:),'r','Linewidth',2)
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Position')
ylabel('Time')
title('Lax-Wendroff Scheme')
xlim([-12 12])
ylim([-0.2 1.2]) 

line([10 10], ylim, 'Color', 'k', 'LineStyle', '--')
line([-10 -10], ylim, 'Color', 'k', 'LineStyle', '--')
legend('Initial at T=0','Final at T=2')
