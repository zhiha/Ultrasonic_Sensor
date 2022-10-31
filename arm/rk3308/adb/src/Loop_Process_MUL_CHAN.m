clear all;
clc;
%% read file
fid1 = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data_recv_t3.bin');
raw = fread(fid1,'uint8');

%% process raw data 
frame_size = 1495;
frame_num = floor(length(raw)/frame_size);
frame = zeros(frame_size,frame_num);
raw_cut = raw(1:frame_num*frame_size);
frame = reshape(raw_cut,[frame_size,frame_num]);

start_time_byte = 4; % 32 bit;
receive_time_byte = 4; % 32 bit;

valid_data = frame(11:end,:);
valid_data_serial = valid_data(:);

valid_bit_data = zeros(length(valid_data_serial)*8,1);

valid_bit_data_channel_1 = zeros(floor(length(valid_bit_data)/14),1);
valid_bit_data_channel_2 = zeros(floor(length(valid_bit_data)/14),1);

for i=1:length(valid_data_serial)
    valid_bit_data((i-1)*8+1:i*8) = bitget(valid_data_serial(i),1:1:8);
end

valid_bit_data_channel_1 = valid_bit_data(1:18:end);
valid_bit_data_channel_2 = valid_bit_data(2:18:end);

valid_bit_data_channel_1 = valid_bit_data_channel_1 - 0.5;

fs = 4.8e6;
N = 4800;
f = -fs/2:fs/N:fs/2-1;
figure;
plot(f,abs(fftshift(fft(valid_bit_data_channel_1(1:N)))));
grid on;

fs = 4.8e6;
N = 4800;
f = -fs/2:fs/N:fs/2-1;

fid2 = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data_send_t3.bin');
raw = fread(fid2,'int16');
figure;
plot(f,abs(fftshift(fft(raw))));
xlabel("Time (ns)");
ylabel("Amptitue");
title("Data(Send)");
grid on;

% %%
% sample_rate = 4.8e6;
% t1 = 0: 1/sample_rate : (length(data1)-1)/sample_rate;
% t1 = t1.*1e-3;
% 
% figure;
% subplot(2,1,1)
% plot(t1,data1);
% xlabel("Time (ns)");
% ylabel("Amptitue");
% title("Data(Send)");
% grid on;
% 
% fs = 4.8e6;
% N = 4800;
% f = -fs/2:fs/N:fs/2-1;
% 
% subplot(2,1,2)
% plot(f,abs(fftshift(fft(data1))));
% xlabel("Time (ns)");
% ylabel("Amptitue");
% title("Data(Send)");
% grid on;
% 
% 
% %%
% for i=1:length(data2)
%     data3((i-1)*8+1:i*8) = bitget(data2(i),8:-1:1);
% end
% 
% data3 = data3 - 0.5;
% 
% fs = 4.8e6;
% N = 4800;
% f = -fs/2:fs/N:fs/2-1;
% figure;
% subplot(2,1,1);
% plot(f,abs(fftshift(fft(data3(1:4800)))));
% grid on;
% 
% %%
% data4 = data3(1:4800);
% long = lowpass(data4,40e3,fs);
% 
% subplot(2,1,2);
% plot(f,abs(fftshift(fft(long))));
% grid on;
% 
% %%
% data5=long.*data1;
% figure;
% plot(f,abs(fftshift(fft(data5))));
% grid on;
