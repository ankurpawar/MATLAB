%spiral triangle
 ee = 0.08;
 x=[0 2 1 0];
 y=[0 0 1 0];
axis off square
total=100;
colmap=fliplr(1-pink(total));
%colmap=fliplr(hsv(total));
 
    for t=1:total
             x(4) = ee*x(2) + (1-ee)*x(3);
             y(4) = ee*y(2) + (1-ee)*y(3);
             x(3)=x(2);  y(3)=y(2);
             x(2)=x(1);  y(2)=y(1);
             x(1)=x(4);  y(1)=y(4);
             %patch(x,y,'r','edgecolor','none','facecolor',colmap(t,:),'linewidth',1);
             h=patch(x,y,'r','edgecolor',colmap(total-t+1,:),'facecolor',colmap(t,:),'linewidth',2);
             %pause(0.2)
    end
%colmap=jet(length(x));
%patch(x,y,'r','edgecolor','none','FaceVertexCData',colmap,'facecolor','interp');
%axis off
%get(h)