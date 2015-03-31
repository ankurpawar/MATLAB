phase = i*random('Uniform',0,2*pi,100,100);
% img=zeros(50,50);
% %inv_fft=ifft(fft(ran));
% 
% [X,Y] = meshgrid(-3:.25:3);
% 
% Z = rand(25).*peaks(X,Y);
% [XI,YI] = meshgrid(-1:.008:1);
% %ZI = interp2(X,Y,Z,XI,YI,'cubic');
% %mesh(X,Y,Z), hold on, mesh(XI,YI,ZI+15)
% %hold off
% %colormap jet
% pcolor(ZI)
% 
% %pcolor(zeros(size(ZI)));
% %alpha(ZI/max(max(ZI)))
% 
% shading interp
% 
% 
ran_fft=fft(ran);
[f1,f2] = freqspace(25,'meshgrid');
Hd = zeros(25,25); d = sqrt(f1.^2 + f2.^2) < 0.5;
Hd(d) = 1;
%mesh(f1,f2,Hd)
%[h, f]=freqz(bz, az, 512,Fs);
%plot(f, 20*log10(abs(h))), grid
%xlabel('Frequency (Hz)')
%ylabel('Magnitude (dB)')
y = filter2(Hd,ran_fft);
ran_ifft=ifft(y);
surf(abs(ran_ifft)),shading interp

