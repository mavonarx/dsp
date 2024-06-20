clear all; clc

% Params
x = [1 1 1 1];
N = 3; % downsampling rate
%

% in einem Schritt
% y=decimate(x,N);

% oder in zwei schritten

% Params
b = [1 1 1 1];
a = [1];

%
yos = filter(b, a, x);
y = downsample(yos,N);


% plot
%times = 0:length(yos)-1;
%times2 = 0:length(y)-1;
%figure(1)
%subplot(2,1,1)
%plot(times,yos, times2, y)

figure(2)
freqz(b,a)

