clc;
clear all;



rx=importdata('D:\\Share\\Ultrasonic_Python\\sigmadeltaDecimalOutput.txt');

rx = rx - 0.5;

figure;
fs = 4.0e6;
N = 4000*10;
f = -fs/2:fs/N:fs/2-fs/N;
plot(f,20*log10(abs(fftshift(fft(rx(1:N))))));

% figure;
% fs = 4.0e6;
% N = floor(length(rx(1:4000))/4000+1)*4000;
% f = -fs/2:fs/N:fs/2-fs/N;
% plot(f,20*log10(abs(fftshift(fft([rx(1:4000)' zeros(1,N-length(rx))])))));



