clear all; clc; close all;
% Frequenzen gegeben

%% Params
N = 8;
freqs = [1 0 0.5 0 0 0 0.5 0];
x = ifft(freqs);
x = x;
Ts = 1/1000;
t = Ts/N;
times = [0:7] * t;

subplot(2,1,1);
scatter(times, x, 'filled');grid;
xlabel("t ");
ylabel("x(n)");
xlim([0 Ts]);
disp(x)