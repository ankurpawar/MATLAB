function recursion10
%Recursion of simple square
global COLORMAP
n=7; %level of recursion
COLORMAP=copper(n);
rect(0,0,1,1,n);
rect(1,0,1,1,n);
axis([-1.5 1.5 -1 2]);
axis equal off
end

function rect(x,y,wide,high,n)
global COLORMAP
if n>0
    xx=[x-wide/2 x+wide/2 x+wide/2  x-wide/2];
    yy=[y-high/2 y-high/2 y+high/2  y+high/2];
    patch(xx,yy,'k',...
        'facecolor',1-COLORMAP(n,:),...
        'edgecolor',COLORMAP(n,:),'linewidth',1);
    rect(x-wide/4,y-high/4+high,wide/2,high/2,n-1);
    rect(x+wide/4,y-high/4+high,wide/2,high/2,n-1);
end
end