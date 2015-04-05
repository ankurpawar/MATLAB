%Pythagoras tree using recursion

function pytree2
global PHI COLORMAP

n=5;
COLORMAP=hsv(n);
x=[0 1 1 0];
y=[0 0 1 1];
theta=pi/4;
sca1=sin(theta);
sca2=cos(theta);
PHI=theta;
tree(0,0,theta,sca1,sca2,[0 1],1,n);

axis([-3 3 0 4]);
axis equal on

return

function tree(x,y,theta,sca1,sca2,points,len,n)
global PHI COLORMAP
if n>0
    
    line([x x+points(1)],[y y+points(2)],'color',COLORMAP(n,:));
    line(x(1),y(1),'marker','.','color',COLORMAP(n,:));
    
    [xc yc]=pol2cart(theta,len*sca1);
    tree(x+points(1),y+points(2),theta-PHI,sca1,sca2,[xc yc],len*sca1,n-1);
    
    
    [xc yc]=pol2cart(pi/2+theta,len*sca2);
    tree(x+points(1),y+points(2),theta+PHI,sca1,sca2,[xc yc],len*sca2,n-1);
    
end
return

function [xx,yy]=trans2d(x,y,tx,ty,phi,xr,yr)
 %[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
  %[theta,rad]=cart2pol(x,y);
  %xx=rad.*cos(theta+phi)+tx;
  %yy=rad.*sin(theta+phi)+ty;
  
  xx=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
  yy=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;
return

