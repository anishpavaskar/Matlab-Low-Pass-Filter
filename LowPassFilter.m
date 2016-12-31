%Low Pass Filter Matlab
%Anish Pavaskar 2016

%clears project
clc 
clear all

Fs=200e3;
Ts=1/Fs;
dt=0:Ts:5e-3-Ts;
f1=1e3;
f2=20e3;
f3=30e3;
%create noise domain 
y=5*sin(2*pi*f1*dt)+15*sin(2*pi*f2*dt)+3*sin(2*pi*f3*dt);

%plot(dt,y);

nfft=length(y);
nfft2=2^nextpow2(nfft);
fy=fft(y,nfft2);

fy=fy(1:nfft2/2);

xfft=Fs.*(0:nfft2/2-1)/nfft2;





%establishes cutoff frequency

cut_off=1.5e3/Fs/2;
order=32;

h=fir1(order,cut_off);

fh=fft(h,nfft2);
fh=fh(1:nfft2/2);

mul=fh.*fy;


%plots the initial signal,the filter,and the result respectively
subplot(3,1,1);
plot(abs(fy/max(fy)));
subplot(3,1,2);
plot(abs(fh/max(fh)));
subplot(3,1,3);
plot(abs(mul));










