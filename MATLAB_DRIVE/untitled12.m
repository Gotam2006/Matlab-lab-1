figure;
hold on;
grid on;

%% Вхідні дані
P = [ 0.5  -0.4  -0.8  -1.0   0.5   1.3   0    1.0   1.5   0.4  -0.2;
      3.0   2.5  -0.3   0.4   0.1  -0.4   0    0.2  -0.3  -1.5  -1.8];

T = [1 1 1 1 2 2 3 3 4 4 4];
T = ind2vec(T);

%% Мережа (та ж, що в попередньому завданні)
net = patternnet(10);
net = train(net, P, T);

%% Сітка простору
x1 = -3:0.05:3;
x2 = -3:0.05:3;
[X1, X2] = meshgrid(x1, x2);

gridPoints = [X1(:)'; X2(:)'];

%% Відповідь мережі для всієї площини
Y = net(gridPoints);
classes = vec2ind(Y);

%% Перетворення у матрицю для графіка
Z = reshape(classes, size(X1));

%% Розфарбування областей
contourf(X1, X2, Z, 4, 'LineColor', 'none');
colormap(jet);
alpha(0.4);

%% Вхідні точки
gscatter(P(1,:), P(2,:), vec2ind(T), 'rgbk', 'o', 8);

%% Параметри графіка
xlabel('X1');
ylabel('X2');
title('Розділення простору входів на 4 класи');
legend('Область 1','Область 2','Область 3','Область 4','Дані');

hold off;