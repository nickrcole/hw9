function hw9p5=hw9p5()
x = [0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1];
y = [0.7829, 0.8052, 0.5753, 0.5201, 0.3783, 0.2923, 0.1695, 0.0842, 0.0415, 0.009, 0];

figure;
plot(x, y);
hold on;

orders = [1, 2, 4, 8];

for i = 1:length(orders)
    order = orders(i);
    coefficients = polyfit(x, y, order);
    xFit = linspace(min(x), max(x), 100);
    yFit = polyval(coefficients, xFit);
    plot(xFit, yFit, 'DisplayName', ['Order ', num2str(order), ' Polynomial']);
end