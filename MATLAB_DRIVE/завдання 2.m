clc;
clear;
close all;

%% Вхідні дані (3 ознаки)
P = [ -2   2  -2   2  -2   2  -2   2;
      -2  -2   2   2  -2  -2   2   2;
      -2  -2  -2  -2   2   2   2   2];

%% Класи
T = [1 1 1 1 0 0 0 0];

%% Створення персептрона
net = perceptron;

%% Параметри навчання
net.trainParam.epochs = 100;
net.trainParam.showWindow = true;

%% Навчання
net = train(net, P, T);

%% Вивід параметрів
disp('Ваги:');
disp(net.IW{1});

disp('Зсув:');
disp(net.b{1});

%% Перевірка
Y = net(P);

disp('Результат класифікації:');
disp(Y);