%spiral art
function spiral1
theta=0.4*pi;
upto=2.5;
rot=1;
[x,y]=shape1(upto,1,0);
patch(x,y,'k');

[x,y]=shape1(upto,1,pi/4);
patch(x+1,y+1.6,'k');

[x,y]=shape1(upto,1,0.25*pi);
patch(-x+0.75,y+1.6,'k');

[x,y]=shape1(3,1,-pi/3);
patch(-x-1,-y+1,'k');

%axis([-40 40 -40 40])
axis equal off


function [x2,y2]=shape1(upto,rot,theta)
t=0:0.01:2*upto*pi;
[x,y]=pol2cart(t+theta,t);
[x2,y2]=pol2cart(t-0.05*pi+theta,1.05*t);
x2=rot*([x fliplr(x2)]-min(x))/(2*upto*pi);
y2=rot*([y fliplr(y2)])/(2*upto*pi);



