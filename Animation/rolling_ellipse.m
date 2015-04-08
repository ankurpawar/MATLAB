function rolling_ellipse
t=0:0.1:2*pi;
n=1;
rx=2;
ry=1;
x=rx*sign(cos(t)).*abs(cos(t)).^n;
y=ry*sign(sin(t)).*abs(sin(t)).^n;
[val,ind]=max(x);
h=patch(x,y,'m');
[theta,r]=cart2pol(x,y);
axis equal
axis([-1 10 0 6])
for n=1:pi/16:3*pi
    [x,y]=pol2cart(theta-n,r);
    set(h,'xdata',x+n,'ydata',y-min(y));
    line(x(1)+n,y(1)-min(y),'marker','o');
    pause(0.1)
end


function [xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
%2d transformation without scaling
%[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;