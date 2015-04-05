%spiral triangle tile
function spiralTriangleTile
N=3; %number of sides of polygon
phi=pi/N;
t=linspace(0+phi/2,2*pi+phi/2,N+1); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
theta=pi/100;


numPoly=30;
colormap=1-bone(numPoly);
x2=x;y2=y;

%patch([-10 10 10 -10],[-10 -10 10 10],[0.75 0.75 0.75]);

rot=theta;
for n=1:numPoly
    patch(len*x2,len*y2+2,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    patch(-len*x2,-len*y2,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    patch(-len*x2+0.866,-len*y2+1.5,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    
    patch(len*x2-0.866,len*y2+0.5,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    patch(len*x2+0.866,len*y2+0.5,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    patch(-len*x2-0.866,-len*y2+1.5,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    len=len*cos(phi)/cos(phi-theta);
    [x2,y2]=trans2d(x,y,0,0,rot,0,0); %rotate by theta
    rot=theta+rot;
end



axis([-1 3 -1 3])
axis equal off

function [xd,yd]=trans2d(x,y,tx,ty,phi,xr,yr)
%[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;