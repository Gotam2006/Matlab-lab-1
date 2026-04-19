figure;
hold on;
grid on;

% Точки класу 1
plot(P(1, T==1), P(2, T==1), 'ro', 'MarkerSize', 8, 'LineWidth', 2);

% Точки класу 0
plot(P(1, T==0), P(2, T==0), 'bx', 'MarkerSize', 8, 'LineWidth', 2);

% Розділяюча пряма
w = net.IW{1};
b = net.b{1};

x = -3:0.1:3;
y = -(w(1)*x + b)/w(2);

plot(x, y, 'k-', 'LineWidth', 2);

xlabel('X1');
ylabel('X2');
title('Класифікація персептроном');
legend('Клас 1','Клас 0','Розділяюча пряма');

hold off;