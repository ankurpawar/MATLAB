function rolling_shape
t=0:0.01:2*pi;
a =1;
b =1;
m =(3);
n1=1;
n2=1;
n3=1;


r=1./( (abs(1/a*cos(0.25*m*t)).^n2 +...
    abs(1/b*sin(0.25*m*t)).^n3  ).^(1/n1) );

x=r.*cos(t);
y=r.*sin(t);
h=patch(x,y,[0.5 0.3 0.9]);
axis equal
axis([0 15 -1 5]);
set(gca,'position',[0.01 0.01 0.98 0.98])
set(gcf,'position',[10 40 1200 500])

line([0 5*pi],[0 0],'color',[0 0 0]);
roughx=[];
roughy=[];
for n=0:pi/16:5*pi
    [x2,y2]=transform2d(x,y,n,0,-n,0,0);
    line([roughx x2(1)],[roughy y2(1)-min(y2)])
    roughx=x2(1);
    roughy=y2(1)-min(y2);
    set(h,'xdata',x2,'ydata',y2-min(y2));
    pause(0.1)
end

function [xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
%2d transformation without scaling
%[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;
