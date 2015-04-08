function rolling_hypotrochoid
%animation of HYPOTROCHOID
no=3; %number of rotations
n=0;
dtheta=pi/20;  %increase in angle per iteration
r1=1;          %radius of fixed circle on which smaller circle rolls
r2=0.75;        %radius of rolling circle
len=0.75;       %line connected to centre of rolling circle
roughx=[];     %variable to trace trochoid
roughy=[];     %variable to trace trochoid
upto=2*r1*pi/r2+dtheta; %rotate upto
t=linspace(0,2*pi,75);

[x,y]=pol2cart(t,r2);
h1=patch(x,y,'r');%draw rolling circle


[phil,rl]=cart2pol([-len 0],[0 0]);
h2=line(0,0);%draw line connected to centre of rolling circle

[x_fix,y_fix]=pol2cart(t,r1);
h3=line(x_fix,y_fix);%draw fixed circle,only once because it is fixed

axis equal
axis(r1*[0 20 -3 3]) %fix axis

while n<20 && ishandle(h1)
    [xl,yl]=pol2cart(phil+no*n,rl); %rotate line
    [x2,y2]=transform2d(xl,yl,r1*n,-(r1-r2)+r1,-no*n*r2/r1,0,r1-r2);
    set(h2,'xdata',x2,'ydata',y2);%draw line
    
    %[x,y]=pol2cart(t,r2); %rotate circle
    [x3,y3]=transform2d(x,y,r1*n,-(r1-r2)+r1,-no*n*r2/r1,0,r1-r2);
    set(h1,'xdata',x3,'ydata',y3);%draw rolling circle
    
    set(h3,'xdata',x_fix+r1*n,'ydata',y_fix+r1);
    line([roughx x2(1)],[roughy y2(1)]);%trace trochoid
    roughx=x2(1);
    roughy=y2(1);
    
    pause(0.025)
    n=n+dtheta;
end

function [xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
%2d transformation without scaling
%[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;