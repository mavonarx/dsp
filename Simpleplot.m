clear all; clc; close all;
global fs Ts f_0 N prefactor

%% Params
window = false;
fs = 8000;
N = 16;
Ts = 1 / fs;
first_repeat_at = 0.8;
f_0 = 1000 /first_repeat_at;
prefactor = 1; % factor before sin or cosinus
% ADJUST SINUS OR COSINUS AT THE BOTTOM OF FILE


times = [0:N-1]*Ts;
x = fun(times);
% AdJUST WINDOW
w = hamming(length(x)); % change to hanning if needed
x_with_win = x'.*w;
if window
    disp("window " + w)
    disp(x-x_with_win)
    x = x_with_win;
end

subplot(2,1,1);
plot(times, x, 'b-o');grid;
xlabel("t ");
ylabel("x(n)");
xlim([0 N*Ts])
ylim([-prefactor prefactor])

subplot(2,1,2);
f_aufl = fs/N;
disp(f_aufl)
f_arr = [0:N-1]* f_aufl;
disp(abs(fft(x)));
disp(f_arr)
stem(f_arr, abs(fft(x))/N, 'b-o');grid;
xlim([0 fs]);
title("attention scale!!", color="red")

function val = fun(x)
    global f_0 Ts prefactor
    val = prefactor * cos(2 * pi * f_0* x); % x = N * ts = time-samplepoints
end



