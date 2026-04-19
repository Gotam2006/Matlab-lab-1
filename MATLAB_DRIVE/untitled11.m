clc;
clear;
close all;

% Дані
P = [ ...
    0.5  1.0 -0.4 -0.8 -1.0  0.5  1.3  0.0  1.0  1.5  0.4 -0.2;
    3.0  0.0  2.5 -0.3  0.4  0.1 -0.4  0.0  0.2 -0.3 -1.5 -1.8
];

T = [ ...
    1 0 0 0 0 1 1 0 1 1 0 0;
    0 1 1 0 0 0 0 0 0 0 1 1;
    0 0 0 1 0 0 0 1 0 0 0 0;
    0 0 0 0 1 0 0 0 0 0 0 0
];

% Мережа
net = patternnet(10);

% ВАЖЛИВО — як на скріні
net.trainFcn = 'trainscg';
net.performFcn = 'mse'; % або crossentropy (спробуй обидва)

% Параметри зупинки (як у тебе)
net.trainParam.epochs = 1000;
net.trainParam.goal = 0;
net.trainParam.min_grad = 1e-6;
net.trainParam.max_fail = 6;

% Показувати вікно навчання
net.trainParam.showWindow = true;

% Навчання
[net, tr] = train(net, P, T);