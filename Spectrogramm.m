clear; close all; clc;

%% Signal einlesen
[x,fs] = audioread('input/aufgabe_6.wav');
x = x';
N = length(x);
disp("Duareation = " + (N/fs))
t = [0:N-1]/fs;
NFFT = 50;  % frei wählbar  !nehme 2-er potennz


figure(1)
subplot(2,1,1);
plot(1000*t,x); grid;
xlabel('t / ms');

window = hanning(NFFT);
no_overlapping_samples = 0; % wie viel überlappen sich die fenster -> 0 = überlappungsfrei



subplot(2,1,2);
spectrogram(x,window,no_overlapping_samples,NFFT,fs,'yaxis')