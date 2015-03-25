%% Optical Illusion
% Script to make simple optical illusion using sqaures and
% cirlces.

%Draw the circles
num_points = 250;
t = 0 : 2*pi/num_points : 2*pi;
r = 10; %radius
[x,y] = pol2cart(t,r);
for k = 1:0.2:10
    [x,y] = pol2cart(t,k);
    patch(x,y,'r','facecolor','none','edgecolor',[0 0 0]);
end

%Draw the squares
x2 = [-1 1 1 -1];
y2 = [-1 -1 1 1];
for k = 1:7
    patch(k*x2,k*y2,'r','facecolor','none','edgecolor',[1 0 0]);
end
axis equal off