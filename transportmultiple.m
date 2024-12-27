close all
% Initialize function
dx = 0.01;
X = -10:dx:10;
dt = 0.01;
T_values = [0.5, 1, 1.5, 2]; % Multiple time instances
colors = jet(length(T_values)); % For different colors
time_total = max(T_values);
time_steps = time_total/dt;

% Time array for solving
time = 0:dt:time_total;
U = zeros(length(time),length(X));

% Initial condition
for i = 1:length(X)
    k = X(i);
    if k <= 0
        U(1,i) = 1;
    elseif k > 0 && k <= 1
        U(1,i) = 1 - k;
    else
        U(1,i) = 0;
    end
end

lambda = dt/dx;

% FTBS scheme
for j = 1:length(time)-1
    for i = 2:length(X)
        U(j+1,i) = U(j,i)*(1-lambda) + lambda*U(j,i-1);
    end
    U(j+1,1) = U(j+1,2); % Boundary condition
end

% Plotting the results at multiple time instances
figure;
hold on;

% Plot the initial condition
plot(X, U(1,:), 'k', 'Linewidth', 2, 'DisplayName', 'Initial Condition at T=0');

% Plot results at multiple time steps
for k = 1:length(T_values)
    % Find the index corresponding to the required time step
    idx = round(T_values(k)/dt);
    plot(X, U(idx,:), 'Color', colors(k,:), 'LineWidth', 2, 'DisplayName', ['T = ' num2str(T_values(k))]);
end

% Customize the plot
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Position')
ylabel('U')
title('Transport Equation - FTBS at Multiple Time Instances')

% Add vertical dashed lines for reference
xlim([-12 12])
ylim([-0.2 1.2])
line([10 10], ylim, 'Color', 'k', 'LineStyle', '--')
line([-10 -10], ylim, 'Color', 'k', 'LineStyle', '--')

% Add legend
legend show
hold off
