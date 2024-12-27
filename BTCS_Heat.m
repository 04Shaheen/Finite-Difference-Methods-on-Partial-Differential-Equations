close all;

% Initialize parameters
dx = 0.01;
dt = dx^2 / 2; % Stability criterion
v = 1 / 6; % Diffusion coefficient
X = 0:dx:1;
T = 0.02;
time = 0:dt:T;

N = length(X);
M = length(time);

U = zeros(M, N); % Numerical solution
V = zeros(M, N); % Analytical solution
error = zeros(M, N); % Error array

% Initial condition
for i = 1:N
    U(1, i) = sin(4 * pi * X(i));
end

% Analytical solution over time
for j = 1:M
    V(j, :) = sin(4 * pi * X) .* exp((-16) * pi^2 * v * time(j));
end

% Lambda for the BTCS scheme
lambda = v * dt / dx^2;

% Construct the coefficient matrix for BTCS
A_BTCS = diag(1 + 2 * lambda * ones(1, N)) + ...
         diag(-lambda * ones(1, N-1), 1) + ...
         diag(-lambda * ones(1, N-1), -1);

% Boundary conditions: Fix the first and last rows for Dirichlet BC
A_BTCS(1, :) = 0;
A_BTCS(1, 1) = 1;
A_BTCS(end, :) = 0;
A_BTCS(end, end) = 1;

% Time stepping loop for BTCS
for j = 1:M-1
    U(j+1, :) = A_BTCS \ U(j, :)';
    U(j+1, 1) = 0; % Boundary condition at x=0
    U(j+1, end) = 0; % Boundary condition at x=1
end

% Plot initial and final solutions
figure;
hold on;
plot(X, U(end, :), 'r', 'LineWidth', 2); % Numerical solution
plot(X, V(end, :), 'g', 'LineWidth', 2); % Analytical solution
xlabel('X');
ylabel('U');
title('Heat Equation using BTCS');
legend('Numerical Solution', 'Analytical Solution');
hold off;

% Compute the error between the numerical and analytical solutions
for j = 1:M
    error(j, :) = abs(U(j, :) - V(j, :));
end

% Plot the error on a log scale
figure;
semilogy(X, error(end, :), 'b', 'LineWidth', 2); % Logarithmic plot of error
xlabel('X');
ylabel('Log(Error)');
title('Logarithmic Error Plot (BTCS)');
legend('Error at final time step');
