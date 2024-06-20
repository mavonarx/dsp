clear all; clc;
% N kommt auf die Wortbreite drauf an, und nicht auf die anuahl abtastwerte

% Params
N = 2^32;
fs = 100* 10^6;
f0 = 12.5 * 10^6;


delta_f = fs/N;
M = f0 / delta_f;
disp("M = " + M)