function hw5p7=hw5p7()
time = [5, 7, 15, 17, 25, 39, 32, 42, 45, 50];
observed_population = [0.2, 1.8, 6.5, 9.1, 10.8, 12.2, 11.4, 12.6, 12.8, 13.0];

model = @(params, t) params(1) ./ (1 + params(2) * exp(-params(3) * t));

objective = @(params) sum((model(params, time) - observed_population).^2);

initial_guess = [observed_population(end), 1, 0.1];

fitted_params = fminsearch(objective, initial_guess);

K = fitted_params(1);
C = fitted_params(2);
r0 = fitted_params(3);

fitted_population = model(fitted_params, time);

figure;
plot(time, observed_population);
hold on;
plot(time, fitted_population, 'LineWidth', 2, 'DisplayName', 'Fitted Logistic Growth Model');
title('Yeast Population Growth');
xlabel('Time (t)');
ylabel('Population');
legend('show');
grid on;
hold off;

disp('Fitted Parameters:');
disp(['K (Carrying Capacity): ', num2str(K)]);
disp(['C (Exponential Growth Factor): ', num2str(C)]);
disp(['r0 (Growth Rate): ', num2str(r0)]);
