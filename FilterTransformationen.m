clear all; clc; close all;

% Aufgabe 2 Blatt 3 Filtertransformationen
fs = 1;

%%%% PARAMS
b = [0.0750    0.1592    0.2251    0.2500    0.2251    0.1592    0.0750];
disp("Ausgangs b")
disp(b)
%% ADJUST FILTER LOWER 
f0 = fs/4;

%%%%%%%%%%%
ord = length(b)-1;
omega_0 = 2 * pi * f0/ fs;


% TP -> BP
n = [1:ord+1];
b_tp_bp = zeros(ord+1,1);
%disp(n)
is_symetric = b(1)==b(ord+1);
if is_symetric
    for i = n
        b_tp_bp(i) = 2 * cos((i-1)*omega_0* 1/fs)* b(i);
    end
else
    for i = n
        b_tp_bp(i) = 2 * sin((i-1)*omega_0* 1/fs)* b(i);
    end
end
disp("TP - BP transformation")
disp(transpose(b_tp_bp));

% TP -> HP
pattern = [1, -1];
pattern = repmat(pattern,1,ord+1);
pattern = pattern(1:ord+1);
b_tp_hp = pattern.*b;
disp("TP - HP transformation:")
disp(b_tp_hp);

% Komplementärfilter BP -> BS; BS -> BP
b_comp = -b;  
b_comp(ceil(ord/2)+1) = b_comp(ceil(ord/2)+1)+1;
disp("Komplementär BS - BP Transformation")
disp(b_comp)


%%%%%%%% ADJUST THE FILTER!
b_chosen = b_tp_bp; % b_tp_hp, b_comp, b_tp_bp
%%%%%%%%%%%% 


figure(1)

subplot(2,1,1)
zplane(b,1)
title("Ursprünglich")
subplot(2,1,2)
zplane(b_chosen,1)
title("Chosen")

figure(2)
subplot(2,2,1);
[H,f] = freqz(b,1,1000,fs);
plot(f,abs(H));grid;
title("Ursprünglicher Amplitudengang")
xlabel('f / f_s'); ylabel('abs(H(f))');

subplot(2,2,2);
plot(f,180*unwrap(angle(H))/pi);
title("Ursprünglicher Phasengang")
grid;
xlabel('f / f_s'); ylabel('phi_H(f))');


subplot(2,2,3);
[H_new,f] = freqz(b_chosen,1,1000,fs);
plot(f,abs(H_new));grid;
title("Chosen Filter Amplitudengang")
xlabel('f / f_s'); ylabel('abs(H(f))');

subplot(2,2,4);
plot(f,180*unwrap(angle(H_new))/pi);
title("Chosen Filter Phasengang")
grid;
xlabel('f / f_s'); ylabel('phi_H(f))');