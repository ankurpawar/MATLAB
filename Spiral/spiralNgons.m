%spiral Ngons
function spiralNgons
N=3; %number of sides of polygon
t=linspace(0,2*pi,N+1); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
theta=pi/30;
phi=pi/N;  

numPoly=15;
colormap=1-bone(numPoly);

for n=1:numPoly
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor','none');
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end

axis([-1.2 1.2 -1.2 1.2])
axis equal off

function [xx,yy]=trans2d(x,y,tx,ty,phi)
   xx=x.*cos(phi)-y.*sin(phi)+tx;
   yy=x.*sin(phi)+y.*cos(phi)+ty;
return