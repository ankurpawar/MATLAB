%spiral square
ee = 0.08;
x=[0 1  1  0 0];
y=[0 0  1  1 0];
x1=0;  y1=0;
x2=10;  y2=0;
x3=5;  y3=5*sqrt(3);
axis off square
total=90;
colmap=fliplr(hsv(total));
%colmap=fliplr(summer(80));
%h=patch(x,y,'r','edgecolor',colmap(total-1,:),'facecolor',colmap(1,:),'facealpha',0.25,'linewidth',2);
for t=1:total
    h=patch(x,y,'r','edgecolor',colmap(total+1-t,:),'facecolor',colmap(t,:),'linewidth',2,'facealpha',0.25);
    x(5) = ee*x(3) + (1-ee)*x(4);
    y(5) = ee*y(3) + (1-ee)*y(4);
    x(4)=x(3);  y(4)=y(3);
    x(3)=x(2);  y(3)=y(2);
    x(2)=x(1);  y(2)=y(1);
    x(1)=x(5);  y(1)=y(5);
    %h=patch(x,y,'r','edgecolor',colmap(total+1-t,:),'facecolor',colmap(t,:),'linewidth',2);
    %h=patch(x,y,'r','edgecolor','none','facecolor',colmap(t,:),'facealpha',0.25,'linewidth',2);
    %pause(0.2)
end
%colmap=jet(length(x));
%patch(x,y,'r','edgecolor','none','FaceVertexCData',colmap,'facecolor','interp');
%axis off
%get(h)