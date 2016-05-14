function spiralSquareTile
%spiral square tile
N=4; %4 for square
phi=pi/N;
t=linspace(0+phi,2*pi+phi,N+1);
len=1;
[x,y]=pol2cart(t,1);
theta=pi/100;
numPoly=60;
colormap=1-bone(numPoly);
% number of row's and column's in tile
nRow = 6;
nCol = 4;

for row=1:nRow
    for col=1:nCol;
        xoff=row*1.414;
        yoff=col*1.414;
        len=1;
        [x,y]=pol2cart(t,1);
        for n=1:numPoly
            patch(len*x+xoff,len*y+yoff,'r'...
                ,'facecolor',colormap(n,:),'edgecolor',colormap(n,:));
            len=len*cos(phi)/cos(phi-theta);
            [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
        end
    end
end
axis equal off
end

function [xx,yy]=trans2d(x,y,tx,ty,phi)
xx=x.*cos(phi)-y.*sin(phi)+tx;
yy=x.*sin(phi)+y.*cos(phi)+ty;
end