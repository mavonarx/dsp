clear; close all; clc;

%%%%%% Params
s = [1 2 -1 1]; % define search pattern
%load('input/bitfolge.mat','x'); % define pattern to search through
x = [-2 -1 1 0 3 -1 2 -2 0 -1];
x_cor_used = false;

% TDOA has its own script
%%%%%%%%

if x_cor_used
    [rxs,lag] = xcorr(x,s);
end

% mit Filter muss main einfach s umkehren
%
if ~x_cor_used
    b = flip(s);
    disp("b")
    disp(b)
    disp(" ")
    disp ("r")
    rxs = filter(b,1,x);
    disp(rxs)
    lag = [0:length(rxs)-1];
end


subplot(2,1,1);
plot(lag,abs(rxs));
grid; xlabel('m'); ylabel('r_x_s[m]');
title('KKF');

if x_cor_used
    [max,argmax] = max(abs(rxs));
    disp("Anfang")
    disp(lag(argmax))
    disp("Ende")
    disp(lag(argmax)+ length(s))
end

if ~x_cor_used
    [max,argmax] = max(abs(rxs));
    disp("Anfgang")
    disp(lag(argmax)+1- length(s))
    disp("Ende")
    disp(lag(argmax))
end


% print -dpng Abbildung