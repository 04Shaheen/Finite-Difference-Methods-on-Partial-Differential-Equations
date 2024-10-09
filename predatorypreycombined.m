% Parameters
a = 1;
b = 0.1;
c = 1.5;
d = 0.75;
dt = 0.1; 
T = 100;
x0 = [10; 5];
nsteps = T / dt;

% Initialize arrays with zeros
xrk2 = zeros(2, nsteps + 1);
xrk2(:, 1) = x0;
xrk4 = zeros(2, nsteps + 1);
xrk4(:, 1) = x0;
trk2 = zeros(1, nsteps + 1);
trk4 = zeros(1, nsteps + 1);

xin1 = x0;
xin2 = x0;

%rk2
for k = 1:nsteps
    trk2(k + 1) = k * dt;
    xout = rk2singlestep(@(t, x) predatorPrey(t, x, a, b, c, d), dt, k * dt, xin1);
    xrk2(:, k + 1) = xout;
    xin1 = xout;
end

%rk2
for k = 1:nsteps
    trk4(k + 1) = k * dt;
    xout = rk4singlestep(@(t, x) predatorPrey(t, x, a, b, c, d), dt, k * dt, xin2);
    xrk4(:, k + 1) = xout;
    xin2 = xout;
end

%prey graph
figure;
subplot(2, 1, 1);
plot(trk2, xrk2(1, :), 'k', 'LineWidth', 2);
hold on;
plot(trk4, xrk4(1, :), 'r', 'LineWidth', 2);
legend('RK2 Prey', 'RK4 Prey');
title('Prey Population');
xlabel('Time');
ylabel('Population');

%predator
subplot(2, 1, 2);
plot(trk2, xrk2(2, :), 'k', 'LineWidth', 2);
hold on;
plot(trk4, xrk4(2, :), 'r', 'LineWidth', 2);
legend('RK2 Predator', 'RK4 Predator');
title('Predator Population');
xlabel('Time');
ylabel('Population');

%combine predator and prey for comparison
figure;
plot(trk2, xrk2(1, :), 'k', 'LineWidth', 2);
hold on;
plot(trk4, xrk4(1, :), 'r', 'LineWidth', 2);
plot(trk2, xrk2(2, :), 'c', 'LineWidth', 2);
plot(trk4, xrk4(2, :), 'g', 'LineWidth', 2);
legend('RK2 Prey', 'RK4 Prey', 'RK2 Predator', 'RK4 Predator');
title('Predator and Prey Populations');
xlabel('Time');
ylabel('Population');
