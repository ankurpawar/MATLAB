%FIR filter

fc=2000;
fs=32000;
nf=fs/2;
ncf=fc/nf;
ord=127;

win=window(@hamming,ord);

b=fir1(ord-1,ncf,'low',win);

figure
impz(b,1);
figure
freqz(b,1);


amp=10;
f0=ncf*nf;
D=1000/f0;
ts=1/fs;
t=0:ts:D-ts;
x=amp*sin(2*pi*f0*t);
% 
y=filter(b,1,x);
%figure 
%plot(t,y,t,x);
% 
N=fix(10*fs/f0);
l=fix(990*fs/f0);
% 
figure
subplot(2,1,1)
plot(t(l+1:end),x(l+1:end));
% 
subplot(2,1,2)
plot(t(l+1:end),y(l+1:end));
% 
figure 
plot(t(l+1:end),x(l+1:end),t(l+1:end),y(l+1:end));

ipPowT=sum(abs(x(l+1:end)).^2)/N;
opPowT=sum(abs(y(l+1:end)).^2)/N;
% 
% 
X=fft(x(l+1:end),N);
Y=fft(y(l+1:end),N);
% 
ipPowF=sum(abs(X).*abs(X))/N^2;
opPowF=sum(abs(Y).*abs(Y))/N^2;
% 
disp(ipPowT);
disp(opPowT);
disp(ipPowF);
disp(opPowF);
% 
%fix(a*2^13)
%fix(b^2^15)
%OPAMP*2^15
%find OPAMPlitude from CCS then find attenuation
%at ncf from freqz figure 10^(att/20)
%0.9*att=opamp
%OPAMP will match opamp
% ncf = 0.1250
% att=-6.013
% att=10^(att/20)
% att=0.5004
% 0.9*att
% ans = 0.4504
% 14763/2^15
% ans = 0.4505

%write coefficients to a header file
bfix=fix(b*2^15);
fid=fopen('fir.h','w');
fprintf(fid,'#ifndef\t __FIR_H_ \n');
fprintf(fid,'#define\t __FIR_H_ \n\n');
fprintf(fid,'#define\t ORDER\t %d\n',ord);
fprintf(fid,'int \t b_2k[ORDER]={');


fprintf(fid,'%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,',bfix);
%fprintf(fid,'%d,',bfix(1:));
%fprintf(fid,'%d',bfix(12));
fseek(fid,-1,0);
fprintf(fid,'};\n\n');
fprintf(fid,'#endif\n');
fclose(fid);