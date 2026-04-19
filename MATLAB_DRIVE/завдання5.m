clc;
clear;
close all;

%% =========================
%% 1. СТВОРЕННЯ ДАНИХ (як на рисунку)
%% =========================

n = 100;

% Внутрішній клас (чорні точки)
r1 = rand(1,n)*1;
theta1 = rand(1,n)*2*pi;
x1 = r1 .* cos(theta1);
y1 = r1 .* sin(theta1);

% Зовнішній клас (білі точки)
r2 = 1.5 + rand(1,n);
theta2 = rand(1,n)*2*pi;
x2 = r2 .* cos(theta2);
y2 = r2 .* sin(theta2);

P = [ [x1 x2]; [y1 y2] ];

T = [ ones(1,n) zeros(1,n) ]; % 1 - центр, 0 - зовні

%% =========================
%% 2. НОРМУВАННЯ
%% =========================
[Pn, ps] = mapminmax(P);

%% =========================
%% 3. СТВОРЕННЯ МЕРЕЖІ
%% =========================

net = patternnet(10); % прихований шар
net.trainParam.epochs = 200;

%% =========================
%% 4. НАВЧАННЯ
%% =========================

net = train(net, Pn, T);

%% =========================
%% 5. ПЕРЕВІРКА
%% =========================

Y = net(Pn);

disp('Результат:');
disp(round(Y));

%% =========================
%% 6. ГРАФІК РОЗДІЛЕННЯ
%% =========================

figure;
hold on;
grid on;

% Сітка
[x, y] = meshgrid(-2:0.05:2, -2:0.05:2);
gridPoints = [x(:)'; y(:)'];

gridPoints_n = mapminmax('apply', gridPoints, ps);

Z = net(gridPoints_n);
Z = reshape(Z, size(x));

% області
contourf(x, y, Z, 20, 'LineColor', 'none');
colormap(jet);
alpha(0.3);

% точки
plot(x1, y1, 'ko', 'MarkerFaceColor','k'); % центр
plot(x2, y2, 'wo'); % зовні

xlabel('X1');
ylabel('X2');
title('Нелінійна класифікація (2 класи)');
legend('Області','Клас 1 (центр)','Клас 0 (зовні)');

hold off;

%% =========================
%% 7. МОДЕЛЮВАННЯ (НОВІ ТОЧКИ)
%% =========================

P_test = [0 1.5 -1.5 0.5;
          0 1.5  1.5 0.2];

P_test_n = mapminmax('apply', P_test, ps);

Y_test = net(P_test_n);

disp('Моделювання:');
disp(round(Y_test));
