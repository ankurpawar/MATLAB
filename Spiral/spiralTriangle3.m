function spiralTriangle3
%spiral triangle
t=linspace(0,2*pi,4); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
% rotation of inner triangle, less value better the spiral effect.
theta=pi/40;
% angle between sides of triangle
phi=pi/3;
nSquare=35;
colormap = flipud(bone(nSquare));

for n=1:nSquare
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