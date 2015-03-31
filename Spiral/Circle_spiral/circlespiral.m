%% Circle Spiral
% Create a Spiral of Circles.The spiral is made of many
% cicles with increasing radius and placed at some angular offset.

%% Make the first circle
% Make a cicle in polar coordinates and convert
% to cartesian.Place the circle on y-axis at some offset
t = linspace(0,2*pi,200); 
r = 1;
[x,y] = pol2cart(t,r);
y = y-min(y); %place the cicle on +ve side of y-axis
[t,r] = cart2pol(x,y);

%% Draw the spiral
% Draw many cicles starting from the first one and gradually
% increase the radius.Also add a small angle to rotate circle
% about the origin.
for k = 1:1/(4*pi):2*pi
    r = 1.025*r; %increase the radius of circle
    [x,y] = pol2cart(t+k,r); 
    patch(x,y,'r','facecolor','none','edgecolor',[1/k 1-1/k 1-1/k]);
end
axis equal 
box on