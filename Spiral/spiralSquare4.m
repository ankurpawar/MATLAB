function spiralSquare4
%spiral square
t=linspace(0,2*pi,5); %points for triangle
len=1;
[x,y]=pol2cart(t,1);

theta=pi/70;
numSquare=70;
phi=pi/4;
colormap=makeColorMap(rand(1,3),[1 1 1],rand(1,3),numSquare);

for n=1:numSquare
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor','none');
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end
axis equal off
end

function [xx,yy]=trans2d(x,y,tx,ty,phi)
xx=x.*cos(phi)-y.*sin(phi)+tx;
yy=x.*sin(phi)+y.*cos(phi)+ty;
end