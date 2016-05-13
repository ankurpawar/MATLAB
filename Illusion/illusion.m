%% Optical Illusion
% Script to make simple optical illusion using polygon set
% operations.

%% Calculate the polygon points
% This polygon is made by intersection of two circles.
% Then the resulting polygon is translated and scaled.
% Two different colors are chosen to color the boundary.
% Half of the boundary of polygon will colored with black
% and remaining half with white.
num_points = 100;
t = 0 : 2*pi/num_points : 2*pi;
x = sin(t);
y = cos(t);
[x, y] = polybool('intersection', x, y+1, x+1, y);
x = (x-0.5)*0.65;
y = (y-0.5)*0.65;

len_x = length(x);
num1 = floor(len_x/2);
num2 = len_x - num1;
[theta,r] = cart2pol(x,y);
colmap = [zeros(num1,3) ; ones(num2,3)]; %colormap for edges
num_row = 20; %number of rows
num_col = 20; %number of column

%% Draw the polygons
% Two loops ,one for row and other for column
% In each iteration of inner loop the polygon is rotated
% by a small angle. Outer loop gives a rotation which is
% constant for one itration of inner loop.
k = 2*0.1*pi;
for i = 1:num_row
    for j = 1:num_col
        [x,y] = pol2cart(theta+j*k+i*k , r);
        x = x+i;
        y = y+j;
        patch(x,y,[0.7 0.2 0.9],'edgecolor','flat'...
                               ,'linewidth',1.5...
                               ,'FaceVertexCData',colmap);
    end
end
set(gcf,'color',[0.4 0.6 0.7]);
axis off equal
% export_fig function is available then save figure as png file
if exist('export_fig') > 0
    export_fig('png','illusion');
end