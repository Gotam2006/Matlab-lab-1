clc;
clear;
close all;

%% Вхідні дані
P = [ 1.5   1.0  -1.5  -0.5;
     -2.0  -0.5  -1.0  -1.5];

%% Класи
T = [1 0 0 1];

%% Створення персептрона
net = perceptron;

%% Налаштування параметрів
net.trainParam.epochs = 100;   % як у тебе на скріні
net.trainParam.showWindow = true; % показати Training Progress

%% Навчання мережі
net = train(net, P, T);

%% Вивід ваг і зміщення
disp('Ваги (weights):');
disp(net.IW{1});

disp('Зсув (bias):');
disp(net.b{1});

%% Перевірка
Y = net(P);

disp('Результат класифікації:');
disp(Y);