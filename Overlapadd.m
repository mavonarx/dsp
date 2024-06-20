clear all; clc; close all;

%%%%% Params
L = 2; % = Blocklength
M = 1; % = unpadded part of block
N = 1; % = ORD
h = [1 1]; % Ord + 1 elements
x = [1 1 0];
%%%%%%%%%%%

assert(L>= M + N)

output = zeros(1,length(x)+L);

h_padded = [h, zeros(1,L-N-1)];
H_big = fft(h_padded);
count = 0;
disp_count = 0;
while count < length(x)
    index = count + 1;
    x_long = [x,zeros(1,L)];
    x_curr = [x_long(:,index:index+M-1), zeros(1,L-M)];
    disp("x"+ disp_count + "[n]");
    disp(x_curr);
    X_big = fft(x_curr);
    disp("X (big)"+ disp_count + "[n]");
    disp(X_big);
    disp("H (big)"+ disp_count + "[n]");
    disp(H_big);
    Y_big = X_big.*H_big;
    disp("Y (big)"+ disp_count + "[n]");
    disp(Y_big);
    y = ifft(Y_big);
    disp("y"+ disp_count + "[n]");
    disp(y);

    for k = 0:L-1
        output(index+k)= output(index+k) +y(k+1);
    end

    count = count + M;
    disp_count = disp_count + 1;
end
output = output(:,1:length(x));
disp("OUTPUT y = ")
disp(output)

% disp("convolution of h and x")
% disp(conv(h,x))




