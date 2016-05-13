function pytree2
% Pythagoras tree using recursion.
global COLORMAP
n = 8;
COLORMAP = hsv(n);
theta = pi/4;
sca1=sin(theta);
sca2=cos(theta);
tree(0,0,theta,sca1,sca2,[0 1],1,n);
axis equal off 
set(gcf,'color',[1 1 1]);
return

function tree(x,y,theta,sca1,sca2,points,len,n)
global COLORMAP
if n > 0
    line([x x+points(1)],[y y+points(2)],'color',COLORMAP(n,:));
    line(x(1),y(1),'marker','.','color',COLORMAP(n,:));
    
    [xc yc] = pol2cart(theta,len*sca1);
    tree(x+points(1),y+points(2),theta-pi/4,sca1,sca2,[xc yc],len*sca1,n-1);
    
    [xc yc] = pol2cart(pi/2+theta,len*sca2);
    tree(x+points(1),y+points(2),theta+pi/4,sca1,sca2,[xc yc],len*sca2,n-1);
end
return

function [xx,yy]=trans2d(x,y,tx,ty,phi,xr,yr)
% 2d transformation
% [xd,yd] = transform2d(x,y,tx,ty,phi,xr,yr)
xx = x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yy = x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;
return