function rolling_square
%not sure this is accurate 
r=1;
t=linspace(0,2*pi,5);
[x,y]=pol2cart(t,r);
h=patch(x,y,'r');
%axis([-2 2 -2 2])
axis equal
axis([0 10 -1 4])
line([-2 10],[0 0])
roughx=[];
roughy=[];
for n=1:pi/25:3*pi
    [x2,y2]=transform2d(x,y,n,0,-n,0,0);
    set(h,'xdata',x2,'ydata',y2-min(y2));
    line([roughx x2(1)],[roughy y2(1)-min(y2)])
    roughx=x2(1);
    roughy=y2(1)-min(y2);
    pause(0.1)
end


function [xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
%2d transformation without scaling
%[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;