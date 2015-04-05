%recursion5
function recursion5
global COLORMAP
n=6; %level of recursion
COLORMAP=1-pink(n);
rect(0,0,1,1,n);
axis([-0.6 0.6 -0.6 0.6]);
axis equal off


function rect(x,y,wide,high,n)
global COLORMAP
if n>0
    xx=[x-wide/2 x+wide/2 x+wide/2  x-wide/2];
    yy=[y-high/2 y-high/2 y+high/2  y+high/2];
    patch(xx,yy,-n+zeros(size(yy)),'k',...
         'facecolor','none','edgecolor',COLORMAP(n,:),'linewidth',n);
 
    rect(x-wide/4,y-high/4,wide/2,high/2,n-1);
    rect(x-wide/4,y+high/4,wide/2,high/2,n-1);
    rect(x+wide/4,y-high/4,wide/2,high/2,n-1);
    rect(x+wide/4,y+high/4,wide/2,high/2,n-1);
end
return

