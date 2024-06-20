clear all; clc; close all;



%%%%% Params

K = 64; % OVERSAMPLING RATE
bit_count = 10; 
fs = 1;
%%%

delta_ENOB = log2(K)/2; 
disp("OHNE SIGMA DELTA - NUR OVERSAMPLING + DEZIMATION")
disp("Mehr bits: " + delta_ENOB)
disp("Jetzt daher "+ (bit_count + delta_ENOB) + " bits ")
disp("SNR verbessert sich um " + delta_ENOB * 6);
