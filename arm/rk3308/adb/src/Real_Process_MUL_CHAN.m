clc;
clear all;

%% read file
rx = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data\realTest\data_recv_1031_RealTest_TwoObj1.bin');
tx = importdata('./fmcwData.txt');
rx_raw = fread(rx,'uint8');
tx = tx';
%% process raw data 
frame_size = 1495;
frame_num = floor(length(rx_raw)/frame_size);
frame = zeros(frame_size,frame_num);
raw_cut = rx_raw(1:frame_num*frame_size);
frame = reshape(raw_cut,[frame_size,frame_num]);

pulse_seq = unique(frame(4,:));
[m n]=hist(frame(4,:),unique(frame(4,:)));

cur_process_pulse_index = 2;

%% extract valid data
start_time_byte = 4; 
receive_time_byte = 4; 
data_len_byte = 2;
valid_data_index = start_time_byte + receive_time_byte + data_len_byte + 1;
valid_data = frame(valid_data_index:end,sum(m(1:cur_process_pulse_index-1))+1:sum(m(1:cur_process_pulse_index)));
valid_data_serial = valid_data(:);
valid_bit_data = zeros(length(valid_data_serial)*8,1);

channel_num = 18;
valid_bit_data_channel = zeros(channel_num,floor(length(valid_bit_data)/channel_num));

for i=1:length(valid_data_serial)
    valid_bit_data((i-1)*8+1:i*8) = bitget(valid_data_serial(i),1:1:8);
end

for i=1:channel_num
    valid_bit_data_channel(i,:) = valid_bit_data(i:18:end);
    if (sum(abs(valid_bit_data_channel(i,:))))==0
        fprintf("%d channel is all 0 \n", i)
    end
    valid_bit_data_channel(i,:) = valid_bit_data_channel(i,:) - 0.5;
end

%% 1d-FFT
debug_state = 0;

fs = 4.0e6;
interfactor = 8;
N = 5e3*interfactor;
f = -fs/2:fs/N:fs/2-1;
cur_process_channel = 3;
cur_process_rx = valid_bit_data_channel(cur_process_channel,1:N);

cur_process_rx_filter = filter(filter_fmcw,cur_process_rx);  % 直接使用设计好的滤波器进行滤波，filter函数是滤波函数

if(debug_state==1)
    figure('color',[1,1,1]);
    subplot(2,2,1);
    plot(cur_process_rx);
    title('滤波前波形');
    subplot(2,2,2);
    plot(cur_process_rx_filter);
    title('滤波后波形');
    subplot(2,2,3);
    plot(f,abs(fftshift(fft(cur_process_rx))));
    title('滤波前波形频谱');
    subplot(2,2,4);
    plot(f,abs(fftshift(fft(cur_process_rx_filter))));
    title('滤波后波形频谱');
end

cur_process_rx_demodulate = cur_process_rx_filter .* tx;

cur_process_rx_demodulate_filter = filter(filter_demodulate,cur_process_rx_demodulate);  % 直接使用设计好的滤波器进行滤波，filter函数是滤波函数

figure;
plot(f,abs(fftshift(fft(cur_process_rx_demodulate_filter))));
title('解调后波形频谱');

%% 1d-FFT with zero-pad
debug_state = 0;

fs = 4.0e6;
interfactor = 8;
N = 5e3*interfactor;

pad_factor = 8;
pad_len = (pad_factor-1)*N;

N_pad = N*pad_factor;


f = -fs/2:fs/N_pad:fs/2-1;
cur_process_channel = 3;
cur_process_rx_pad = [valid_bit_data_channel(cur_process_channel,1:N) zeros(1,pad_len)];

cur_process_rx_pad_filter = filter(filter_fmcw,cur_process_rx_pad);  % 直接使用设计好的滤波器进行滤波，filter函数是滤波函数

if(debug_state==1)
    figure;
    subplot(2,2,1);
    plot(cur_process_rx_pad);
    title('滤波前波形');
    subplot(2,2,2);
    plot(cur_process_rx_pad_filter);
    title('滤波后波形');
    subplot(2,2,3);
    plot(f,abs(fftshift(fft(cur_process_rx_pad))));
    title('滤波前波形频谱');
    subplot(2,2,4);
    plot(f,abs(fftshift(fft(cur_process_rx_pad_filter))));
    title('滤波后波形频谱');
end

tx_pad = [tx zeros(1,pad_len)];

cur_process_rx_pad_demodulate = cur_process_rx_pad_filter .* tx_pad;

cur_process_rx_pad_demodulate_filter = filter(filter_demodulate,cur_process_rx_pad_demodulate);  % 直接使用设计好的滤波器进行滤波，filter函数是滤波函数

figure;
plot(f,abs(fftshift(fft(cur_process_rx_pad_demodulate_filter))));
title('解调后波形频谱');

%% 2d-FFT



























































% fs = 4.8e6;
% N = 4800;
% f = -fs/2:fs/N:fs/2-1;
% 
% fid2 = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data_send_t3.bin');
% raw = fread(fid2,'int16');
% figure;
% plot(f,abs(fftshift(fft(raw))));
% xlabel("Time (ns)");
% ylabel("Amptitue");
% title("Data(Send)");
% grid on;


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
