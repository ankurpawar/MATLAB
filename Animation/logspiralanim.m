total=150;
lim=2*pi;
x = linspace(-lim,lim,total);
y = linspace(-lim,lim,total);
c = zeros(length(y),length(x));
a=0;
b=0;
lenx = length(x);
leny = length(y);
const = 100;
for n = 1:lenx
    c(n,:) = x(n)+i*y(:);
end
zval = zeros(lenx,leny);
k=1;
%cmap=colormap(makeColorMap([1 1 1],[0.2 0.5 0.4],[1 0.9 0.5],64));
colormap gray(128)
% cmap=colormap(makeColorMap([1 1 1],[0.2 0.5 0.4],[0.8 0.6 0.9],64));
tt=angle(c);
r=abs(c);
%M = moviein(150);
n=1;
for n=1:150
    zval=(sin(6*cos(r-0.04*n*pi)+k*tt));%.*(sin(6*cos(r+0.03*n*pi)-k*tt));
    
    %zval=(sin(5*(r)+k*tt-0.11*pi*n));%.*(sin(5*(r)+k*tt+pi*0.01*n));
    %zval=(sin(-2.5*log(r)+k*tt+0.1*pi*n));
    %zval=(sin(10*r.^2+k*tt-0.11*pi*n));%.*(sin(5*(r)+k*tt+pi*0.01*n));
    %zval=sin(3.1*(r)+(k*tt-0.11*pi*n));
    pcolor(zval),shading interp
    axis square off
    drawnow
    %n=n+1;
    %M(:,n)=getframe;
end

%movie2avi(M,'spiralanim10.avi','quality',100,'compression','Indeo5')