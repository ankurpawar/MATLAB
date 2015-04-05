%spiral square tile
function spiralSquareTile
N=4; %4 for square
phi=pi/N;
t=linspace(0+phi,2*pi+phi,N+1); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
theta=pi/100;


numPoly=50;
colormap=1-bone(numPoly);

for row=1:6
    for col=1:4
        xoff=row*1.414;
        yoff=col*1.414;
        len=1;
        [x,y]=pol2cart(t,1);
        for n=1:numPoly
            patch(len*x+xoff,len*y+yoff,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
            len=len*cos(phi)/cos(phi-theta);
            [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
        end

    end
end

%axis([-1.2 1.2 -1.2 1.2])
axis equal off

function [xx,yy]=trans2d(x,y,tx,ty,phi)
   xx=x.*cos(phi)-y.*sin(phi)+tx;
   yy=x.*sin(phi)+y.*cos(phi)+ty;
return