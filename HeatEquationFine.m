close all
% Initial Conditions
dx = 0.01;
%dt = 0.002;
dt = dx^2/2;
v = 1/60;
X = 0:dx:1;
T = [0.2, 0.6, 0.9, 1, 1.5, 3.5, 5, 50];
colors = jet(length(T)); 

figure;
hold on;

%initial plot
U_initial = sin(2*pi*X);
plot(X, U_initial, 'k', 'LineWidth', 2);

for k = 1:length(T)
    time = 0:dt:T(k);
    U = zeros(length(time), length(X));
    V = zeros(length(time), length(X));
    
    for i = 1:length(X)
        U(1,i) = sin(2*pi*X(i));
    end
    
    lambda = v * (dt / (dx^2));
    
    for j = 1:length(time)-1
        for i = 2:length(X)-1
            U(j+1,i) = U(j,i) + lambda * (U(j,i+1) - 2 * U(j,i) + U(j,i-1));
           
        end
        %force boundary conditions
        U(j+1,1) = 0;  
        U(j+1,end) = 0;
    end
    plot(X, U(end,:), 'Color', colors(k,:), 'LineWidth', 2);
    hold on
end

ax = gca;
ax.XAxisLocation = 'origin';
xlabel('X');
ylabel('U');
title('Heat Equation (lambda<1/2)');
legend(['Initial Condition', arrayfun(@(t) ['T = ', num2str(t)], T, 'UniformOutput', false)]);
hold off;