%circlesquareanim
total=150;
he=8;
x = linspace(-he,he,total);
y = linspace(-he,he,total);
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

m  =  1;
n  =  lenx*leny;
a=real(c);b=imag(c);


%zval(m)=cos(a*b^2);
%zval(m)=cos(a)^2+cos(b)^2;
%zval(m)= abs((sin(2*(a^2+b^2))));%-100:1:.100;
%zval(m)= cos(a^3+b^3);% -10:0.1:10;
%zval(m)= sin(sin(a)*cos(b)*b+cos(b)*sin(a)*a);
%zval(m)= sin(cos(b^2)+sin(b)-b^2+sin(a^2)-cos(a)+a^2);
%zval(m)= sin(cos(b^2)+sin(b)-b+sin(a^2)-cos(a)+a);
%zval(m)= sin(sin(b^2+a^2)-b^2+sin(a^2+b^2)+a^2);

cmap=colormap(makeColorMap([1 1 1],[0.2 0.5 0.4],[1 0.9 0.5],64));
% cmap=colormap(makeColorMap([1 1 1],[0.2 0.5 0.4],[0.8 0.6 0.9],64));

%M = moviein(150);
for n=1:100
    %zval=sin(a.*b-0.05*pi*n);
    %zval= sin(cos(b.^2-0.05*pi*n)-a+cos(a.^2-b.^2)-0.05*pi*n);
    %zval= sin(sin(a-0.01*pi*n).*cos(b).*b+cos(b-0.01*pi*n).*sin(a).*a-0.01*pi*n);
    
    pcolor(zval),shading interp
    axis square off
    drawnow
    %M(:,n)=getframe;
end

%movie2avi(M,'logspir8.avi','quality',100,'compression','Indeo5')