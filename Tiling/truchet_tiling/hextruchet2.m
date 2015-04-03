function hextruchet2
gapx1=2*cos(pi/6);
gapy2=1+sin(pi/6);
gapx2=cos(pi/6);
total=10;
rough=-gapx2/2;
totaly=10;
totalx=16;

t=0:pi/3:5*pi/3;
r=1;
[px,py]=pol2cart(t,r);
cmap=pink(5);

for ky=1:totaly
    rough=-rough;
    for kx=1:totalx
        [x,y]=transform2d(px,py,0,0,pi/6-2*pi/3,0,0);
        patch(x+kx*gapx1+rough,y+ky*gapy2,'k','facecolor','none','edgecolor',[0.6 0.6 0.6],'linewidth',2);
        %patch(x+kx*gapx1+rough,y+ky*gapy2,[0.4 0.5 0.7],'edgecolor',[0.4 0.5 0.7]);
    end
end

for ky=1:totaly
    rough=-rough;
    for kx=1:totalx
        
        ran=rand;
        if ran>0.66
            [x,y]=truchet(3);
        elseif ran>0.33
            [x,y]=truchet(2);
        else
            [x,y]=truchet(1);
        end
        %patch(x+kx*gapx1+rough,y+ky*gapy2,[0.4 0.5 0.7],'edgecolor',[0.4 0.5 0.7]);
        colors=cmap(randi(4),:);
        patch(x+kx*gapx1+rough,y+ky*gapy2,colors,'edgecolor','k');
    end
end


axis equal off


function [x,y]=truchet(choice)
t=0:pi/3:5*pi/3;

r=1;
[px,py]=pol2cart(t,r);

a2=linspace(-pi/3,pi/3,15);

a1=linspace(4*pi/3,2*pi/3,15);

[a1x,a1y]=pol2cart(a1,sin(pi/6)*r);
[a2x,a2y]=pol2cart(a2,sin(pi/6)*r);
perp=r*sin(pi/6);
bas=r*cos(pi/6);
x=[a1x+px(1) px(2) px(2)-perp px(2)-perp   px(6);
    a2x+px(4) px(4) px(4) px(4) px(4)]';

y=[a1y+py(1) py(2) py(2)      py(2)-2*bas  py(6);
    a2y+py(4) py(4) py(4) py(4) py(4)]';

if choice == 3
    [x,y]=transform2d(x,y,0,0,pi/6,0,0);
elseif choice == 2
    [x,y]=transform2d(x,y,0,0,pi/6+2*pi/3,0,0);
else
    [x,y]=transform2d(x,y,0,0,pi/6-2*pi/3,0,0);
end
