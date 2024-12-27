close all
% Initialize function
dx = 0.01;
X = -10:dx:10;
dt = dx/2;
T = 2;
time = 0:dt:T;
c=1;
R = c*dt/dx;
U = zeros(length(time), length(X));

% Initial condition
for i = 1:length(X)
    k = X(i);
    if k <= 0
        U(1, i) = 1;
    elseif k > 0 && k <= 1
        U(1, i) = 1 - k;
    else
        U(1, i) = 0;
    end
end
plot(X, U(1, :), 'k', 'LineWidth', 2)
hold on


N = length(X); 
A4 = zeros(N, N);


for i = 1:N
    A4(i, i) = 1 - R; 
    if i < N
        A4(i, i + 1) = R; 
    end
end

A4(1, :) = 0;
A4(end, :) = 0;
A4(1, 1) = 1;
A4(end, end) = 1;


for j = 1:length(time) - 1
    U(j + 1, :) = A4 \ U(j, :)'; 
    U(j + 1, 1) = U(j + 1, 2);
    U(j + 1, end) = U(j + 1, end - 1);
end

% Plot results
plot(X, U(end, :), 'r', 'LineWidth', 2)
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
xlabel('Position')
ylabel('Time')
title('Implicit Scheme with BTFS (lambda>0)')
xlim([-12 12])
ylim([-0.2 1.2])

line([10 10], ylim, 'Color', 'k', 'LineStyle', '--')
line([-10 -10], ylim, 'Color', 'k', 'LineStyle', '--')
legend('Initial at T=0', 'Final at T=2')
