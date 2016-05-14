function spiraltriangle2
%spiral triangle 2
level=50;
pitch=0.05;
size=8;
x=[6 6+size     6+size*0.5          6];
y=[2   2    3.0+size*0.5*sqrt(3.0)  2];
x1 = 6.0;
y1 = 2.0;
x2 = x1+size;
y2 = 2.0;
x3 = x1+size*0.5;
y3 = 3.0+size*0.5*sqrt(3.0);

colmap=(1-copper(50));
triangle(x,y,colmap);

x4 = x(3)+size;
y4 = y(3);
triangle([x2 x4 x3 x2],[y2 y4 y3 y2],colmap);

x5 = x2;
y5 = y3+size*0.5*sqrt(3.0);
triangle([x4 x5 x3 x4],[y4 y5 y3 y4],colmap);

x6 = x1;
y6 = y5;
triangle([x5 x6 x3 x5],[y5 y6 y3 y5],colmap);

x7 = x3-size;
y7 = y3;
triangle([x6 x7 x3 x6],[y6 y7 y3 y6],colmap);
triangle([x7 x1 x3 x7],[y7 y1 y3 y7],colmap);

axis equal off
end

function triangle(x,y,colmap)
pitch=0.1;total=50;
for t=1:total
    patch(x,y,'r','edgecolor','none','facecolor',colmap(total-t+1,:),'linewidth',1);
    %patch(x,y,'r','edgecolor','none','facecolor',colmap(total-t+1,:),'linewidth',1);
    x(4) = pitch*x(2) + (1-pitch)*x(3);
    y(4) = pitch*y(2) + (1-pitch)*y(3);
    x(3)=x(2);  y(3)=y(2);
    x(2)=x(1);  y(2)=y(1);
    x(1)=x(4);  y(1)=y(4);
    
    %patch(x,y,'r','edgecolor','none','FaceVertexCData',colmap,'facecolor','interp');
end
end