clc

fpass=300;
rp=1;
fstop=1000;
rs=60;

nf=5000;
fs=nf*2;
ts=1/fs;

nfpass=fpass/nf;
nfstop=fstop/nf;

[N,ncf]=buttord(nfpass,nfstop,rp,rs);
[b,a]=butter(N,ncf);

impz(b,a);
figure
freqz(b,a);

