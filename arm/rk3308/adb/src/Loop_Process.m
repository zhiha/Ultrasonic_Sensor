clear all;
clc;
%%
fid1 = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data\\loop\\data_send2.bin','rb');
fid2 = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data\\loop\\data_recv.bin');
data1 = fread(fid1,'int16');
data2 = fread(fid2,'uint8');
data3 = zeros(4800*8,1);
data4 = zeros(4800,1);

%%
sample_rate = 4.8e6;
t1 = 0: 1/sample_rate : (length(data1)-1)/sample_rate;
t1 = t1.*1e-3;

figure;
subplot(2,1,1)
plot(t1,data1);
xlabel("Time (ns)");
ylabel("Amptitue");
title("Data(Send)");
grid on;

fs = 4.8e6;
N = 4800;
f = -fs/2:fs/N:fs/2-1;

subplot(2,1,2)
plot(f,abs(fftshift(fft(data1))));
xlabel("Time (ns)");
ylabel("Amptitue");
title("Data(Send)");
grid on;


%%
for i=1:length(data2)
    data3((i-1)*8+1:i*8) = bitget(data2(i),8:-1:1);
end

data3 = data3 - 0.5;

fs = 4.8e6;
N = 4800;
f = -fs/2:fs/N:fs/2-1;
figure;
subplot(2,1,1);
plot(f,abs(fftshift(fft(data3(1:4800)))));
grid on;

%%
data4 = data3(1:4800);
long = lowpass(data4,40e3,fs);

subplot(2,1,2);
plot(f,abs(fftshift(fft(long))));
grid on;

%%
data5=long.*data1;
figure;
plot(f,abs(fftshift(fft(data5))));
grid on;
