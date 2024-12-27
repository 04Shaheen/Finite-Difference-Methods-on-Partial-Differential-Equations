close all
% Initial Conditions
dx = 0.01;
dt = dx^2 / 2;
v = 1 / 6;
X = 0:dx:1;
T = 0.02;
time = 0:dt:T;

U = zeros(length(time), length(X)); % Numerical solution
V = zeros(length(time), length(X)); % Analytical solution
error = zeros(length(time), length(X)); % Error array

% Initial condition
for i = 1:length(X)
    U(1,i) = sin(4 * pi * X(i));
end
lambda = v * (dt / (dx^2));

% Plot the initial condition
figure;
hold on;

% Analytical solution over time
for j = 1:length(time)
    V(j,:) = sin(4 * pi * X) .* exp((-16) * pi^2 * v * time(j));
end

% FTCS scheme for the heat equation (numerical solution)
for j = 1:length(time) - 1
    for i = 2:length(X) - 1
        U(j + 1, i) = U(j, i) + lambda * (U(j, i + 1) - 2 * U(j, i) + U(j, i - 1));
    end
    % Boundary conditions
    U(j + 1, 1) = 0;
    U(j + 1, end) = 0;
end

% Plot the final numerical and analytical solutions
plot(X, U(end, :), 'r', 'LineWidth', 2);
plot(X, V(end, :), 'g', 'LineWidth', 2);
xlabel('X');
ylabel('U');
title('Comparison with Analytical Solution');
legend( 'Numerical', 'Analytic');
hold off;

% Compute the error between the numerical and analytical solutions
for j = 1:length(time)
    error(j,:) = abs(U(j,:) - V(j,:));
end

% Plot the error on a log scale
figure;
semilogy(X, error(end,:), 'b', 'LineWidth', 2); % Logarithmic plot of error
xlabel('X');
ylabel('Log(Error)');
title('Logarithmic Error Plot');
legend('Error at final time step');
