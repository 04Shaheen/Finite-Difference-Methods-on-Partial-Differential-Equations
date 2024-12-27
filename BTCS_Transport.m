close all
% Initialize function
dx = 0.01;
X = -10:dx:10;
dt = dx / 2;
T = 2;
time = 0:dt:T;
c = 1; 
R = c * dt / dx;
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
A_BTCS = zeros(N, N);


for i = 2:N-1
    A_BTCS(i, i-1) = -R / 2; 
    A_BTCS(i, i) = 1;        
    A_BTCS(i, i+1) = R / 2;  
end


A_BTCS(1, 1) = 1; 
A_BTCS(N, N) = 1; 


for j = 1:length(time) - 1
    U(j + 1, :) = A_BTCS \ U(j, :)'; 
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
title('Implicit Scheme with BTCS')
xlim([-12 12])
ylim([-0.2 1.2])

line([10 10], ylim, 'Color', 'k', 'LineStyle', '--')
line([-10 -10], ylim, 'Color', 'k', 'LineStyle', '--')
legend('Initial at T=0', 'Final at T=2')
