function hw5p6=hw5p6()
years = 1:15; % Years from t=1 to t=15
observed_population = [25, 30, 38, 48, 55, 60, 70, 80, 110, 130, 142, 140, 151, 180, 250]; % Bison population data at t=1 and t=15

% Transform data for linear regression
log_observed_population = log(observed_population);

linear_fit = polyfit(years, log_observed_population, 1);

r0 = linear_fit(1);
N0 = exp(linear_fit(2));

fitted_population = N0 * exp(r0 * years);

figure;
plot(years, observed_population);
hold on;
plot(years, fitted_population, 'LineWidth', 2, 'DisplayName', 'Fitted Exponential Growth Model');
title('Bison Population Growth in Northern Yellowstone National Park');
xlabel('Years (t)');
ylabel('Population');
legend('show');
grid on;
hold off;

disp('Fitted Parameters:');
disp(['N0 (Initial Population): ', num2str(N0)]);
disp(['r0 (Growth Rate): ', num2str(r0)]);

