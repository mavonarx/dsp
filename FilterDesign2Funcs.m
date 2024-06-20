fs = 8000;

N = 63;

F = [0 1000 1200 4000]/(fs/2);

A = [1 1 0 0];

beq = firpm(N,F,A); 
bls = firls(N,F,A);

[Heq,f] = freqz(beq,1,1000,fs); [Hls,f] = freqz(bls,1,1000,fs);

subplot(2,1,1);

plot(f,20*log10(abs(Heq)),'-r',f,20*log10(abs(Hls)),'--b'); grid;
title("Amplitudengang")

xlabel('f / Hz'); ylabel('abs(H(f))'); legend('Parks-McClellan','Least-Squares'); axis([0 fs/2 -60 0]);

subplot(2,1,2);

plot(f,unwrap(angle(Heq)),'-r',f,unwrap(angle(Hls)),'--b'); grid;
title("Phasengang")

xlabel('f / Hz'); ylabel('phi_H(f) / rad'); legend('Parks-McClellan','Least-Squares');