%IIR filter

fpass=1000;
rp=1;
fstop=10000;
rs=80;

nf=16000;
fs=nf*2;
ts=1/fs;

nfpass=fpass/nf;
nfstop=fstop/nf;

[N,ncf]=buttord(nfpass,nfstop,rp,rs);
[b,a]=butter(N,ncf,'low');

impz(b,a);
figure
freqz(b,a);





amp=10;
f0=ncf*nf;
D=1000/f0;
t=0:ts:D-ts;
x=amp*sin(2*pi*f0*t);

y=filter(b,a,x);
%figure 
%plot(t,y,t,x);

N=fix(10*fs/f0);

l=fix(990*fs/f0);
m=fix(1000*fs/f0);

figure
subplot(2,1,1)
plot(t(l+1:end),x(l+1:end));

subplot(2,1,2)
plot(t(l+1:end),y(l+1:end));

ipPowT=sum(abs(x(l+1:end)).^2)/N;
opPowT=sum(abs(y(l+1:end)).^2)/N;
%

X=fft(x(l+1:end),N);
Y=fft(y(l+1:end),N);

ipPowF=sum(abs(X).^2)/N^2;
opPowF=sum(abs(Y).^2)/N^2;

disp(ipPowT);
disp(opPowT);
disp(ipPowF);
disp(opPowF);

%fix(a*2^13)
%fix(b^2^15)