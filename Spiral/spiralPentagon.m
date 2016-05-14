function spiralPentagon
%spiral pentagon
t=linspace(0,2*pi,6); %points for pentagon
len=1;
[x,y]=pol2cart(t,1);
% rotation of inner pentagon, less value better the spiral effect.
theta=pi/30;
% angle between sides of pentagon
phi=pi*36/180;
nPentagon=40;
colormap=jet(nPentagon);

for n=1:nPentagon
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor',[1 1 1]);
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end
axis equal off
end

function [xx,yy]=trans2d(x,y,tx,ty,phi)
xx=x.*cos(phi)-y.*sin(phi)+tx;
yy=x.*sin(phi)+y.*cos(phi)+ty;
end