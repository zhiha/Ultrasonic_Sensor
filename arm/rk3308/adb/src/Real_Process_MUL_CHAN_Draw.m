clear all;
clc;
%% read file
rx = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data_recv_1031_RealTest.bin');
tx = fopen('C:\\Users\\zhiha\\Desktop\\rk3308\\adb\\data_send_1031_RealTest.bin');
rx_raw = fread(rx,'uint8');
tx_raw = fread(tx,'int16');
%% process raw data 
frame_size = 1495;
frame_num = floor(length(rx_raw)/frame_size);
frame = zeros(frame_size,frame_num);
raw_cut = rx_raw(1:frame_num*frame_size);
frame = reshape(raw_cut,[frame_size,frame_num]);
%% extract valid data
start_time_byte = 4; 
receive_time_byte = 4; 
data_len_byte = 2;
valid_data_index = start_time_byte + receive_time_byte + data_len_byte + 1;
valid_data = frame(valid_data_index:end,:);
valid_data_serial = valid_data(:);
valid_bit_data = zeros(length(valid_data_serial)*8,1);

channel_num = 18;
valid_bit_data_channel = zeros(channel_num,floor(length(valid_bit_data)/channel_num));

for i=1:length(valid_data_serial)
    valid_bit_data((i-1)*8+1:i*8) = bitget(valid_data_serial(i),1:1:8);
end

for i=1:channel_num
    valid_bit_data_channel(i,:) = valid_bit_data(i:18:end);
end

for i=1:channel_num
    sum(abs(valid_bit_data_channel(i,:)))
    if (sum(abs(valid_bit_data_channel(i,:))))==0
        fprintf("%d channel is all 0 \n", i)

    end
end

for i=1:channel_num
    valid_bit_data_channel(i,:) = valid_bit_data_channel(i,:) - 0.5;
end

%% time draw
N_time = 5000*8*4;
figure;
plot(valid_bit_data_channel(1,1:N_time));
grid on;

%% dram the recv data spectrum
fs = 4.0e6;
N = 5e3*8;
N = floor(length(valid_bit_data_channel(1,1:N))/N)*N;
f = -fs/2:fs/N:fs/2-1;

figure;
plot(f,20*log10(abs(fftshift(fft([valid_bit_data_channel(1,1:N) zeros(1,N-length(valid_bit_data_channel(1,1:N)))])))));
grid on;
%%
ch_index = 2;
N = floor(length(valid_bit_data_channel(ch_index,1:N))/N)*N;
f = -fs/2:fs/N:fs/2-1;

figure;
plot(f,20*log10(abs(fftshift(fft([valid_bit_data_channel(ch_index,1:N) zeros(1,N-length(valid_bit_data_channel(ch_index,1:N)))])))));
grid on;

%%
N = length(tx_raw);
f = -fs/2:fs/N:fs/2-1;

figure;
plot(f,abs(fftshift(fft(tx_raw))));
grid on;


%% 1d-FFT
tx_1d = tx_raw';
rx_1d = valid_bit_data_channel(ch_index,1:N_process);

demodulate_signal = tx_1d .* rx_1d;

fs = 4.0e6;
N = length(tx_raw);
f = -fs/2:fs/N:fs/2-1;

figure;
plot(f,abs(fftshift(fft(demodulate_signal))));
grid on;



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
