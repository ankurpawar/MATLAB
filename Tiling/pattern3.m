%pattern32*4/sqrt(2)
function pattern3
r=1;
t=linspace(0,2*pi,9);
for m=1:3
for n=1:3
    [x,y,A,side]=shape1(r);
    patch(2*n*A+x,2*m*A+y,'r','facecolor','none');
    [xoct,yoct]=pol2cart(t,side/2);
    len=A+side/2;
    patch(2*n*A+xoct+len*cos(pi/4),2*m*A+yoct+len*sin(pi/4),'b');   
end
end
axis equal



function [x,y,A,side]=shape1(r)
 side=2*r*sin(pi/8);
 side2=2*side/2*sin(pi/8);
 A=r*cos(pi/8);B=side2*cos(pi/8);C=side2*sin(pi/8);
 coords=[0    A;
         B  A-C;
         B    B;
         A-C  B;
         A    0;
         A-C -B;
         B   -B;
         B -A+C;
         0   -A;
        -B -A+C;
        -B   -B;
        -A+C -B;
        -A    0;
        -A+C  B;
        -B    B;
        -B  A-C];
  x=coords(:,1);
  y=coords(:,2);
  [theta,r]=cart2pol(x,y);
  %[x2,y2]=pol2cart(theta-pi/8,r);
  [x3,y3]=pol2cart(theta-pi/4,r);
  %[x4,y4]=pol2cart(theta+pi/8,r);
  %x=[x x2 x3 x4];
  %[x, y] = polybool('union', x, y, x3, y3);
  %y=[y y2 y3 y4];
  x=[x x3];y=[y y3];
