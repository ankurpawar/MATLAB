%Butterworth digital high pass filter
function filter_1
Fs=8000;
t=(-0.5*pi:1/Fs:0.5*pi);
y=sin(2*200*pi*t)+sin(2*4000*pi*t)+sin(1000*pi*t);%.*sin(8000*pi*t);
n = length(y);
p = abs(fft(y));
f = (0:n-1)*(Fs/n);
subplot(2,2,1);
plot(f,p/max(p));

rp=0.15;
rs=60;
wp=2000;
ws=1000;
w1=2*wp/Fs;w2=2*ws/Fs;
%[n,Wn] = buttord(Wp,Ws,Rp,Rs);
[nn,wn] = buttord(w1,w2,rp,rs);
[b,a]=butter(nn,wn,'high');

subplot(2,2,2)
zplane(b,a)

w=0:0.01:pi;
[h,om]=freqz(b,a,w);
m=20*log10(abs(h));
subplot(2,2,4)
plot(om/pi,m);

y2=filter(b,a,y);
p2=abs(fft(y2));

subplot(2,2,3)
plot(f,p2/max(p2))

fvtool(b,a)
