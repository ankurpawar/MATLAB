%spiral hexagon
function spiralHexagon
t=linspace(0,2*pi,7); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
theta=pi/30;
phi=pi*30/180;  

numSquare=40;
colormap=hot(numSquare);

for n=1:numSquare
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor',[1 1 1]);
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end

axis([-1.2 1.2 -1.2 1.2])
axis equal off

function [xx,yy]=trans2d(x,y,tx,ty,phi)
   xx=x.*cos(phi)-y.*sin(phi)+tx;
   yy=x.*sin(phi)+y.*cos(phi)+ty;
return