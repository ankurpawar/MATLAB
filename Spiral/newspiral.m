%newspiral

t  = -1:0.01:1.5*pi;
len= length(t);
x = zeros(1,len);
y = zeros(1,len);
s1 = inline(['sin(0.5*pi*t.^2-t)']);
s2 = inline(['cos(0.5*pi*t.^2-t)']);
for n = 2:len
    x(n) = x(n-1)+quad(s1,t(n-1),t(n));   %evaluation of fresnel integral
    y(n) = y(n-1)+quad(s2,t(n-1),t(n));   %evaluation of fresnel integral
    
end

%x=r.*cos(t);
%y=r.*sin(t);
%plot(x,y),hold on
[theta,r]=cart2pol(x,y);
cont=17;
colmap=hsv(cont);
for k=1:cont
    [x,y]=pol2cart(theta-2*pi*k/cont,r);
    %y=pol2cart(r,theta-0.25*k*pi)
    plot(x,y,'linewidth',2,'color',colmap(k,:)),hold on
end
plot(0,0,'.','markersize',15,'color',[1 1 1]),hold off

%axis([min(x)-10 max(x)+10 min(y)-10 max(y)+10])
%axis([min(x)-1 max(x)+1 min(y)-1 max(y)+1])
axis off square
