% Lorenz parameters
sigma = 10;
beta = 8/3;
rho = 28;

% Initial condition
x0 = [1; 1; 1];

dt = 0.01;
tspan = 0:dt:100;
steps = length(tspan);
%lorenz system
lorenz = @(t, x) [sigma*(x(2)-x(1)); x(1)*(rho-x(3))-x(2); x(1)*x(2)-beta*x(3)];

%rk4
X_rk4 = zeros(3, steps);
X_rk4(:,1) = x0;
for i = 2:steps
    time = (i-1) * dt;
    X_rk4(:,i) = rk4singlestep(lorenz, dt, time, X_rk4(:,i-1));
end

%euler method for comparison
X_euler = zeros(3, steps);
X_euler(:,1) = x0;
for i = 2:steps
    time = (i-1) * dt;
    X_euler(:,i) = X_euler(:,i-1) + dt * lorenz(time, X_euler(:,i-1));
end

% Create a new figure window
figure;

% Plot the RK4 trajectory
plot3(X_rk4(1,:), X_rk4(2,:), X_rk4(3,:), 'k', 'LineWidth', 1.5);
hold on;

% Plot the Euler trajectory
plot3(X_euler(1,:), X_euler(2,:), X_euler(3,:), 'c', 'LineWidth', 1);

set(gca, 'FontSize', 14);
view(20, 40);

% Ensure the plot is visible
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Lorenz Attractor');

% Optional: Add grid and adjust figure properties
grid on;
set(gcf, 'Position', [100 100 800 600]);
legend('RK4', 'Euler');
drawnow;

% Function definitions must be at the end of the script
function xout = rk4singlestep(f, dt, t, x)
    k1 = f(t, x);
    k2 = f(t + dt/2, x + dt*k1/2);
    k3 = f(t + dt/2, x + dt*k2/2);
    k4 = f(t + dt, x + dt*k3);
    xout = x + (dt/6)*(k1 + 2*k2 + 2*k3 + k4);
end