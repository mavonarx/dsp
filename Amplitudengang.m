close all; clc; clear all

%%%%  Params
b = [-0.1061    0.0000    0.3183    0.5000    0.3183    0.0000   -0.1061];
a = [1];

fs = 1000;  % change to 2* pi if not given or to 1 - use 1 for fs/2 fs/4 etc. 
[H,f] = freqz(b,a, 10000, fs);


figure(1)
title("abs H")
subplot(3,1,1);
plot(f, abs(H));grid;
xlim([0 fs/2])
xlabel('f / f_s'); ylabel('abs(H(f))');
title("Amplitudengang - abs H")


subplot(3,1,2)
plot(f,(abs(H)).*abs(H));grid;
xlim([0 fs/2])
title("abs H - 2 -fach kaskadiert")


subplot(3,1,3);
plot(f,(180/pi)*unwrap(angle(H)));
title("Phasengang")
grid;
xlabel('f / f_s'); ylabel('phi_H(f) in Grad');