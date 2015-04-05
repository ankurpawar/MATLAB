%newspiral4

t  = 1*pi:0.01:10*pi;
len= length(t);
 x = zeros(1,len);
 y = zeros(1,len);

%x=r.*cos(t);
%y=r.*sin(t);
%plot(x,y),hold on
[theta,r]=cart2pol(x,y);
theta=t;r=1./(t);

[x,y]=pol2cart(theta,r);
x_min=x(1);
y_min=y(1);

x=x-x_min;
y=y-y_min;

[theta,r]=cart2pol(x,y);
%theta=t;r=t;

cont=12;
rough=1/cont;
colmap=hsv(cont);
for k=1:cont
[x,y]=pol2cart(theta-2*pi*k*rough,r);
%y=pol2cart(r,theta-0.25*k*pi)
plot(x,y,'linewidth',2,'color',colmap(k,:)),hold on
end
plot(0,0,'.','markersize',15,'color',[1 1 1]),hold off

%axis([min(x)-10 max(x)+10 min(y)-10 max(y)+10])
%axis([min(x)-1 max(x)+1 min(y)-1 max(y)+1])
axis off square
