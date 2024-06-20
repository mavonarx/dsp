clear all; clc; close all;
% Aufgabe 1 Filterdesign
fs = 1;
small_num = eps;
a = [1];


%%%%% Params:
ord = 6;
fdb = fs/8; % grenzfrequenz
w = hamming(ord+1); % change to hanning if needed

% MANUAL WINDOW HERE
w = [1 1 1 1 1 1 1];
w = w';

%%%%%%%%%%%%%%%
n = linspace(-ord/2,ord/2,ord+1);
h = zeros(ord+1,1);
i = 1;
for element = n
    if element ==0
        h(i) = sin(small_num * pi * fdb / (fs/2))/(small_num*pi); % edit func here
        i=i + 1;
        continue
    end
    h(i) = sin(element * pi * fdb / (fs/2)) / (element * pi);
    i=i + 1;
end

disp("h")
disp(transpose(h))
disp("Window")
disp(transpose(w))
disp(length(h))
disp(length(n))
disp(length(w))
b = h.*w; % elementwise mutliply
disp("b")
disp(transpose(b))

[H,f] = freqz(b,a,1000, fs); % 1000 punkte
HdB = 20* log10(abs(H)); % umrechnung in Db falls nötig

subplot(2,1,1);
plot(f, abs(H));grid;
xlabel('f / f_s'); ylabel('abs(H(f))');
title("Amplitudengang")

subplot(2,1,2);
plot(f,180*unwrap(angle(H))/pi);
title("Phasengang")
grid;
xlabel('f / f_s'); ylabel('phi_H(f)');
