clear all; clc; close all;

%% Params
ord = 6;
w = hamming(ord+1) %rectwin(ord+1); 
fs = 1;
%%

% envelope = abs(hilbert(x))

lower = -ord/2;
upper = ord/2;
b = zeros(ord+1,1);
n = [lower:upper];
disp("n");
disp(n);
for i = 0:ord
    if (mod(n(i+1),2)==0) 
        continue
    end
    b(i+1) = 2/ ((n(i+1))*pi);
end
disp("b = h koeffizienten")
disp(b')

disp("window")
disp(w');

disp("b = h koeffizienten mit window")
b_win = w.*b;
disp((b_win)');



[H,f] = freqz(b_win,1, 1000,fs);

subplot(2,1,1)
plot(f,abs(H), -f,abs(H));
grid;
xlim([-fs/2 fs/2]);
title("Amplitudengang")
xlabel('Frequenz (Hz)')
ylabel('Amplitude')

subplot(2,1,2)
plot(f,unwrap(angle(H)), -f,unwrap(angle(H)));
grid;
xlim([-fs/2 fs/2]);
title("Phasengang")
xlabel('Frequenz (Hz)')
ylabel('Phase (Radiant)')
