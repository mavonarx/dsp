%% Simulation Sigma-Delta-Wandler
clear; close all; clc;

% Parameter
N=128;      % Anzahl Samples

% Input und init
%x=0*ones(1,N);
x=sin(2*pi*[0:N-1]/N);
y=zeros(1,N);
d=zeros(1,N);
dint=zeros(1,N);

% Sigma-Delta-Modulator
for n=2:N,
    d(n) = x(n)-y(n-1);
    dint(n) = d(n)+dint(n-1);
    y(n) = sign(dint(n)+eps); 
    % eps ist eine ganz kleine Zahl, verhindert Fall sign(0) = 0
end

%% Ausgabe
subplot(2,1,1); plot([0:N-1],x); grid;
ylabel('Input');
axis([0 N -1.1 1.1]);
subplot(2,1,2); stairs(y); grid;
xlabel('Samples'); ylabel('Output');
axis([0 N -1.1 1.1]);