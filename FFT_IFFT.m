clear all; clc;

a = [0 0.7071 1 0.7071 0 -0.7071 -1 -0.7071];

fft_val = fft(a);
ifft_val = ifft(a);

disp("FFT")
disp(fft_val)
disp("Abs FFt")
disp(abs(fft_val))
disp(" ")

disp("IFFT")
disp(ifft_val)

