clear all; clc

% Params
x = [1 2 0 -1 0];
N = 3; % downsampling rate
%

%y=interp(x,N);

% oder in zwei schritten

% Params
b = [0 1/3 2/3 1 2/3 1/3 0];
a = [1];

%
xup = upsample(x,N);
y = filter(b,a,xup);  % * N weil Amplitude mit N multipliziert werden muss


% plot
times = 0:length(xup)-1;
figure(1)
plot(times,xup, times, y)


figure(2)
freqz(b,a)