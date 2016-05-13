%% Optical Illusion
% Script to make simple optical illusion with lines and sqaures
function illusion6
leftLim = 0;
bottomLim = 0;
rightLim = 1;
topLim = 1;

for m = 0:2
    for n = 0:2
        rectangle('Position',[n,m+0,1,1],'facecolor',[1 1 1],'edgecolor','none');
        [x,y] = slantLine(1,leftLim,bottomLim,rightLim,topLim);
        line(n+x,m+y,'color','k');
        
        rectangle('Position',[n+0.1,m+0.1,1-0.2,1-0.2],'facecolor',[1 1 1],'edgecolor','none');
        [x,y] = slantLine(2,leftLim+0.1,bottomLim+0.1,rightLim-0.1,topLim-0.1);
        line(n+x,m+y,'color','k');
        
        rectangle('Position',[n+0.2,m+0.2,1-0.4,1-0.4],'facecolor',[1 1 1],'edgecolor','none');
        [x,y] = slantLine(1,leftLim+0.2,bottomLim+0.2,rightLim-0.2,topLim-0.2);
        line(n+x,m+y,'color','k');
        
        rectangle('Position',[n+0.3,m+0.3,1-0.6,1-0.6],'facecolor',[1 1 1],'edgecolor','none');
        [x,y] = slantLine(2,leftLim+0.3,bottomLim+0.3,rightLim-0.3,topLim-0.3);
        line(n+x,m+y,'color','k');
    end
end
m=1;
n=1;
% Inner squares
rectangle('Position',[n+0.05,m+0.05,1-0.1,1-0.1],'facecolor','none','edgecolor',[1 0 0]);
rectangle('Position',[n+0.15,m+0.15,1-0.3,1-0.3],'facecolor','none','edgecolor',[1 0 0]);
rectangle('Position',[n+0.25,m+0.25,1-0.5,1-0.5],'facecolor','none','edgecolor',[1 0 0]);
axis equal off


function [x,y] = slantLine(choice,leftLim,bottomLim,rightLim,topLim);
% This function return x,y coordinates of slanted lines on
% the basis of choice.The function doesnt draws lines.
% choice = 1 will give lines slanted on right hand direction
% all the bottom points connected to rightmost points and leftmost
% points connected to topmost points
% choice = 2 will give lines slanted on left hand direction
% all the bottom points connected to leftmost points and rightmost
% points connected to topmost points
num_points = 20;
x = leftLim : 0.05 : rightLim;
y = topLim  : -0.05 : bottomLim;
y2 = bottomLim : 0.05 : topLim;
lenx = length(x);
bottom_points = bottomLim * ones(1,lenx);
right_points = rightLim * ones(1,lenx);
top_points = topLim * ones(1,lenx);
left_points = leftLim * ones(1,lenx);
switch choice
    case 1
        x = [x right_points;left_points x];
        y = [top_points y;y bottom_points];
    case 2
        x = [x left_points;right_points x];
        y = [top_points y2;y2 bottom_points];
end