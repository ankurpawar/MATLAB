function Swastik
% Function to generate and draw Swastik using bezier curve and 2d rotation.

%control points
cpx = [-0.02 -0.02 0.05  1  1.1 1.25;
    0.02  0.02 0.05  1  1.1 1.25];
cpy = [0 1 1    1     1     1.25;
    0 1 0.95 0.965 0.965 1.25];

%number of points in the bezier curve. Keeping number of points more than
%the control points.
nPoints = size(cpx,1)+100;
bx = zeros(2, nPoints);
by = bx;

%get bezier curve
[bx(1,:), by(1,:)] = bezier(cpx(1,:),cpy(1,:), nPoints);
[bx(2,:), by(2,:)] = bezier(cpx(2,:),cpy(2,:), nPoints);

%curve is generated once and then rotated four times.
t = [pi/2 pi 3*pi/2 2*pi];

for k = 1:length(t)
    %rotate curve
    [tx1,ty1] = transform2d(bx(1,:),by(1,:),0,0,t(k),0,0);
    [tx2,ty2] = transform2d(bx(2,:),by(2,:),0,0,t(k),0,0);
    
    %fliplr is required to maintain the continuity of
    %points.
    patch([tx1 fliplr(tx2)],[ty1 fliplr(ty2)],'r','edgecolor','none');
end

% four dots
hold on
h = scatter([0.5 ;-0.5; -0.5; 0.5],...
    [0.5 ;0.5 ;-0.5; -0.5],...
    [50 50 50 50],...
    [1 1 0]);
set(h,'MarkerEdgeColor','none','MarkerFaceColor',[1 0 0]);

axis([-1.5 1.5 -1.5 1.5]);
axis equal
box on

end %Swastik function end