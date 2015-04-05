%spiral Star
function spiralStar
N=3; %number of sides of polygon
t=linspace(0,2*pi,N+1); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
theta=pi/100;
phi=pi/N;  

numPoly=100;
%colormap=1-bone(numPoly);
%colormap=makeColorMap([1 1 1], [0.1 0.9 0.3], [0.3 0.2 0.0],numPoly);
colormap=makeColorMap([1 1 1], [0.4 0.2 0.0],numPoly);
%colormap=repmat([1 1 1;0.7 0.4 0.8],numPoly/2,1);
%patch([-10 10 10 -10],[-10 -10 10 10],[0.75 0.75 0.75]);

for n=1:numPoly
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    %patch(len*x,-len*y,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end

axis([-1.2 1.2 -1.2 1.2])
axis equal off

function [xx,yy]=trans2d(x,y,tx,ty,phi)
   xx=x.*cos(phi)-y.*sin(phi)+tx;
   yy=x.*sin(phi)+y.*cos(phi)+ty;
return