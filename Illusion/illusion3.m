%% Optical Illusion
% Script to make simple optical illusion using straight lines

t = linspace(0,2*pi,150);
r = 10;
[x,y] = pol2cart(t,r);
%Draw radial lines
plot([zeros(1,length(x));x],[zeros(1,length(y));y],'color',[0 0 0]),hold on

% Draw lines running parallel to x and y axis
x2 = [-2.5 2.5];
y2 = [-11 -11];
line([x2;x2],[-y2;y2],'color',[1 0 0])
line([y2;-y2],[x2;x2],'color',[1 0 0])
plot(0,0,'.','markersize',150,'color',[1 1 1])

axis([-11 11 -11 11])
axis equal off