close all
dx = 0.01;
dt = 0.002; 
X = -1:dx:3; 
T = [0.02, 0.06, 0.1, 0.75, 1, 5, 10, 20, 50]; 
colors = jet(length(T)); 
figure;
hold on;

U_initial = rectangularPulse(0.5, 1.5, X);
plot(X, U_initial, 'k', 'LineWidth', 2);

v = 1/60;

for k = 1:length(T)
    time = 0:dt:T(k);
    U = zeros(length(time), length(X));
    % Set initial condition
    U(1, :) = rectangularPulse(0.5, 1.5, X);

    lambda = v * (dt / (dx^2));

    for j = 1:length(time)-1
        for i = 2:length(X)-1
            U(j+1,i) = U(j,i) + lambda * (U(j,i+1) - 2 * U(j,i) + U(j,i-1));
        end
        % Force boundary conditions
        U(j+1,1) = 0;  
        U(j+1,end) = 0;
    end
    
    plot(X, U(end,:), 'Color', colors(k,:), 'LineWidth', 2);
end

xlabel('X');
ylabel('U');
title('Heat Equation on Rectangular Pulse');
legend(['Initial Condition', arrayfun(@(t) ['T = ', num2str(t)], T, 'UniformOutput', false)], 'Location', 'Best');
hold off;
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
ylim([-1 2])
xlim([-1 3])