clc;
clear all;

T=1e-5;                                  %调频周期
B=1e9;                                   %调频带宽 1GHz 
K=B/T;                                   %调频斜率 
Fs=2e10;                                  %采样频率 200Mhz
Ts=1/Fs;                                 %采样频率 5ns
N=T/Ts;                                  %一个周期内共有多少个点


phi0 = 0;                                %初始相位大小
f0 = 1e6;                                %起始频率 1Mhz
t=linspace(0,T,N);                       %调频连续波时间信号
st = sin(2*pi*(f0*t+0.5*K*t.^2+phi0));   %雷达发射波形
figure(2)
subplot(3,2,1)
plot(t(1:20000+26666),st(1:20000+26666));
grid on
xlabel('时间--us');
ylabel('信号幅值');
title('雷达发射波形');
c=3e8;                 %光速
%mm=[30,60,90];        %三个目标的距离
mm = 20;               %单个目标距离
v = 10;                %单个目标速度
rho = 1550e-9;         % 光的波长, 单位(m)
tao=2.*mm./c;          %时间延迟
buchong = zeros(1,floor(tao/Ts));
delta_f = 2 * v / rho; %多普勒频移
tr = linspace(0,T+tao,N);
sr1 = sin(2*pi*((f0)*t+0.5*K*t.^2));  %雷达回波信号，由于距离产生tao时间延时
sr = [buchong,sr1];

subplot(3,2,2)
plot(tr(1:20000+26666),sr(1:20000+26666));
grid on
xlabel('时间--us');
ylabel('信号幅值');
title('雷达接收波形');

st1 = [st,buchong];
y = st1.*sr;           %发射信号和回波信号混频

subplot(3,2,3)
plot(t(1:20000+26666),y(1:20000+26666));
grid on
xlabel('时间--us');
ylabel('信号幅值');
title('雷达混频波形');
% fs=2e8;
Nt = 102400;
n = 1:1:Nt;
fx = Fs/Nt.*n;
fft_y = abs(fft(y,Nt));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%低通滤波器设 定
Hd = Fliter_130M;
output = filter(Hd,y);

len = N-length(buchong);
t_all = [t,tr(len:N-1)];
subplot(3,2,4)
plot(t_all,output);
grid on
title('雷达混频信号时域输出');
xlabel('时间--us');
ylabel('信号幅值');

fft_out = abs(fft(output,Nt));
% subplot(4,2,5)
% plot(fx(1:Nt/2),fft_out(1:Nt/2));
% grid on
% title('雷达混频信号频域输出');
% xlabel('频率--Mhz');
% ylabel('信号频谱');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 对中频信号重新采样
%原本信号为20Ghz采样率，需要降低到200Mhz.也就是原来的1/100
k = 0;
for i=1:100:length(output)
    k=k+1;
    Max_out(k) = output(i);
end
tt = 1:1:length(Max_out);
tm = tt.*5e-9;
subplot(3,2,5)
plot(tm,Max_out);

grid on
xlabel('时间--us');
ylabel('信号幅值');
title('混频后输出');

%对混频后输出信号重新做FFT
fs = 2e8;
Ns = 10240;
ns = 1:1:Ns;
fxs = fs/Ns.*ns;
fft_m = abs(fft(Max_out,Ns));


subplot(3,2,6)
plot(fxs,fft_m);
grid on
xlabel('频率--Mhz');
ylabel('信号频谱');
title('重采样后频谱输出');