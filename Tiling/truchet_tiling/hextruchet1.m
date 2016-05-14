function hextruchet1
gapx1=2*cos(pi/6);
gapy2=1+sin(pi/6);
gapx2=cos(pi/6);
total=10;
rough=-gapx2/2;
totalx=16;
totaly=10;
t=0:pi/3:5*pi/3;
r=1;
[px,py]=pol2cart(t,r);
for ky=1:totaly
    rough=-rough;
    for kx=1:totalx
        
        ran=rand;
        if ran>0.5
            [x,y]=truchet(1);
        else
            [x,y]=truchet(0);
        end    
        patch(x+kx*gapx1+rough,y+ky*gapy2,[0.4 0.5 0.7]...
            ,'edgecolor',[0.4 0.5 0.7]);
    end
end

for ky=1:totaly
    rough=-rough;
    for kx=1:totalx
        [x,y]=transform2d(px,py,0,0,pi/6-2*pi/3,0,0);
        patch(x+kx*gapx1+rough,y+ky*gapy2,'k'...
            ,'facecolor','none','edgecolor',[0.6 0.6 0.6]);
    end
end
axis equal off
end

function [x,y]=truchet(choice)
t=0:pi/3:5*pi/3;
r=1;
[px,py]=pol2cart(t,r);
if choice
    a1=linspace(pi,5*pi/3,15);
    a2=linspace(-pi/3,pi/3,15);
    a3=linspace(pi/3,pi,15);
    [a1x,a1y]=pol2cart(a1,sin(pi/6)*r);
    [a2x,a2y]=pol2cart(a2,sin(pi/6)*r);
    [a3x,a3y]=pol2cart(a3,sin(pi/6)*r);
    x1=px(2)+[a1x 0];
    y1=py(2)+[a1y 0];
    x2=px(4)+[a2x 0];
    y2=py(4)+[a2y 0];
    x3=px(6)+[a3x 0];
    y3=py(6)+[a3y 0];
    x=[x1;x2;x3]';
    y=[y1;y2;y3]';
    [x,y]=transform2d(x,y,0,0,pi/6,0,0);
else
    a1=linspace(4*pi/3,2*pi/3,15);
    a2=linspace(0,-2*pi/3,15);
    a3=linspace(2*pi/3,0,15);
    [a1x,a1y]=pol2cart(a1,sin(pi/6)*r);
    [a2x,a2y]=pol2cart(a2,sin(pi/6)*r);
    [a3x,a3y]=pol2cart(a3,sin(pi/6)*r);
    
    x=[a1x+px(1) px(2) a2x+px(3) px(4) a3x+px(5) px(6)];
    y=[a1y+py(1) py(2) a2y+py(3) py(4) a3y+py(5) py(6)];
    [x,y]=transform2d(x,y,0,0,pi/6,0,0);
end
end