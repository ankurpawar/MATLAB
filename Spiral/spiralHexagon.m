function spiralHexagon
%spiral hexagon
t=linspace(0,2*pi,7); %points for hexagon
len=1;
[x,y]=pol2cart(t,1);
% rotation of inner hexagon, less value better the spiral effect.
theta=pi/50;
% angle between sides of hexagon
phi=pi*30/180;
% number of inner hexagon.
nHexagon=100;
colormap=makeColorMap(rand(1,3),[1 1 1],rand(1,3),nHexagon);

for n=1:nHexagon
    patch(len*x,len*y,'r','facecolor',colormap(n,:)...
        ,'edgecolor','none');
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end
axis equal off
end

function [xx,yy]=trans2d(x,y,tx,ty,phi)
xx=x.*cos(phi)-y.*sin(phi)+tx;
yy=x.*sin(phi)+y.*cos(phi)+ty;
end