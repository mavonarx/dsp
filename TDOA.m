% ====================================================================
% Lokalisierung mit Korrelatoren TDOA
% ====================================================================
clear; close all; clc;

%%% Parameter
fs = 1000;
A = 10; % distance of the microphones
c = 343; % Schallgeschwindigkeit


x = 1-2*[1 1 1 1 1 0 0 0 1 1 0 1 1 1 0 1 0 1 0 0 0 0 1 0 0 1 0 1 1 0 0];
load('empfangssignale.mat','y0','y1');
Ns = length(y0);


b = fliplr(x);

subplot(4,1,1); plot(y0); grid; ylabel('y_0[n]');
subplot(4,1,2); plot(y1); grid; ylabel('y_1[n]');

r0 = filter(b,1,y0);
r1 = filter(b,1,y1);

subplot(4,1,3); plot(r0); grid; ylabel('r_0[n]');
subplot(4,1,4); plot(r1); grid; ylabel('r_1[n]');
xlabel('Samples'); %xlabel('t/ms'); 


% Aus den samples kann die Time difference abgelesen werden (10Ts). 
delta_TS = 10;
disp(1/fs * delta_TS * 1000 + "ms");
TDoA = 1/fs * delta_TS;
D = (TDoA /2)*c + A/2;
disp("D = " +D)
disp("Genauigkeit: +- "+  c * (1/fs) /2)