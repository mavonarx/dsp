[x,fs] = audioread('input/aufgabe_5.wav');

x=x'; % Zeilenvektor
N = length(x);
window = hanning(N);
x = x'.*window; % elementwise multiplication

t = [0:N-1]/fs;

subplot(2,1,1);
plot(1000*t,x); grid;
xlabel('t / ms'); ylabel('x[n]');

Freqs = [0:N-1]*fs / N;
subplot(2,1,2);
grid; xlabel('f / Hz'); ylabel('(abs(X[m])/N) / dB');
F = abs(fft(x)/N);
plot(Freqs, (20*log10(F)))