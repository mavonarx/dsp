clear all; clc; close all;

% Params  
% ACHTUNG 
% Differenzengleichung: y koeffizienten sind -a (negativ) 
% a hat immer 1 als 1. koeffizient
a = [1 0 0.25];
b = [1 2 1];

input = [1 0 0 0 0 0 0];
h = filter(b,a, input);
disp("Impulsantwort ")
disp(h)

fs = 1; 
figure(1)
[H,f] = freqz(b,a,1000,fs); 
plot(f,abs(H)); grid;

figure(2)
zplane(b,a)