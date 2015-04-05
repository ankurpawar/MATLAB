%% Spiral Square
% A simple script to draw polygons giving illusion
% of spiraling square in itself.First a square is drawn.
% After square is drawn the length of the first side is 
% reduced.In the next iteration assign value of current to next.
% x4 = x3,x3 = x2,x2 = x1,x1 = x5.same for y coordinates.
% There is no trignometric function invloved in this process.
scale = 0.04; 
x=[0 1 1 0 0];
y=[0 0 1 1 0];

total=256; %number of squares
colmap=1-copper(total); %colormap
 
%% Draw the Squares  
% 
for t=1:total
    h=patch(x,y,'r','edgecolor','none','facecolor',colmap(t,:),'linewidth',2);
    x(5) = scale*x(3) + (1-scale)*x(4);
    y(5) = scale*y(3) + (1-scale)*y(4);
    x = circshift(x ,[1 1]);
    y = circshift(y,[1 1]);
end
axis equal
