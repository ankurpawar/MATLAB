function pattern3b
% Alhambra tile
r=1;
t=linspace(0,2*pi,9);
for m=1:5
    for n=1:5
        [xo,yo,xi,yi,A,side]=shape1(r);
        patch(2*n*A+xo,2*m*A+yo,'r','facecolor',[0.5 0.3 0.8],'edgecolor','none');
        patch(2*n*A+xi,2*m*A+yi,'r','facecolor',[0.9 0.6 0.4],'edgecolor','none');
        [xoct,yoct]=pol2cart(t,side/2);
        len=A+side/2;
        patch(2*n*A+xoct+len*cos(pi/4),2*m*A+yoct+len*sin(pi/4),[0.5 0.7 0.8]...
            ,'edgecolor','none');
    end
end
axis equal off
end

function [xo,yo,xi,yi,A,side]=shape1(r)
side=2*r*sin(pi/8);
side2=2*side/2*sin(pi/8);
A=r*cos(pi/8);
B=side2*cos(pi/8);
C=side2*sin(pi/8);
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
[x3,y3]=pol2cart(theta-pi/4,r);
[xo, yo] = polybool('union', x, y, x3, y3);
[xi, yi] = polybool('intersection', x, y, x3, y3);
end