clear all; clc; close all;


%% Params
ord = 6;
w = hamming(ord+1);
%%



lower = -ord/2;
upper = ord/2;
b = zeros(ord+1,1);
n = [lower:upper];
%disp(n)
for i = 0:ord
    if (n(i+1)==0) 
        continue
    end
    b(i+1) = cos(n(i+1)*pi) / (n(i+1));
    % note ideal differentiator = cos function
end
disp("b koeffizienten")
disp(b')

disp("window")
disp(w');

disp("b koeffizienten mit window")
disp((w.*b)');

[H,f] = freqz([1 -1], 1, 10000, 1);
plot(f,abs(H)); grid;
