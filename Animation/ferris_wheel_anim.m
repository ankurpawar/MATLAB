function ferris_wheel_anim

n=0;
dtheta=pi/20;  %increase in angle per iteration
r1=1;          %radius of fixed circle on which smaller circle rolls
r2=0.2;        %radius of rolling circle
r3=0.2;
len=0.2;       %line connected to centre of rolling circle
roughx=[];     %variable to trace trochoid
roughy=[];     %variable to trace trochoid
upto=2*pi*r1/r2+dtheta; %rotate upto
t=linspace(0,2*pi,75);

[phil1,rl1]=cart2pol([-(r1+r2) 0],[0 0]);
l1=line(0,0);%draw rolling circle

[phil2,rl2]=cart2pol([-(r2+r3) 0],[0 0]);
l2=line(0,0);%draw rolling circle

[phil3,rl3]=cart2pol([-(r3+len) 0],[0 0]);
l3=line(0,0);%draw line connected to centre of rolling circle

[x_fix,y_fix]=pol2cart(t,r1);
line(x_fix,y_fix);%draw fixed circle,only once because it is fixed

axis equal
axis(r1*[-2 2 -2 2]) %fix axis

while n<upto && ishandle(l3)
    [xl,yl]=pol2cart(phil1-n*r2/r1,rl1); %rotate line
    %[x3,y3]=transform2d(xl,yl,0,-(r1+r2),-n*r2/r1,0,r1+r2);
    set(l1,'xdata',xl,'ydata',yl);%draw line
    
    [xl2,yl2]=pol2cart(phil2-n*r3/r2,rl2); %rotate line
    %[x3,y3]=transform2d(xl,yl,0,-(r3+r2),-n*r3/r2,0,r3+r2);
    xl2=xl2+xl(1);
    yl2=yl2+yl(1);
    set(l2,'xdata',xl2,'ydata',yl2);%draw line
    
    [xl3,yl3]=pol2cart(phil3+2*n*r3,rl3); %rotate line
    %[x3,y3]=transform2d(xl3,yl3,0,-(r3+r2),-n*r3/r2,0,r3+r2);
    xl3=xl3+xl2(1);
    yl3=yl3+yl2(1);
    set(l3,'xdata',xl3,'ydata',yl3);%draw line
    
    
    
    line([roughx xl3(1)],[roughy yl3(1)]);%trace trochoid
    roughx=xl3(1);
    roughy=yl3(1);
    
    pause(0.05)
    n=n+dtheta;
end


function [xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
%2d transformation without scaling
%[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;