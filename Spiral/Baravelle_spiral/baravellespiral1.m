%% Baravelle Spiral
% This spiral is made from four square.On each step
% all squares are rotated at pi/4 and scaled down
% by 1/sqrt(2).

%% Four Squares
% Length is taken as 1.All the vertices and faces of the squares,
% are kept together.Coordinates are rotated in polar coordinates
% and drawn in cartesian.This makes the rotation easier.
l = 1; 
vertices = [0  0;l  0;l  l;0  l;-l  l;-l  0;-l -l;0 -l;l -l];
faces = [1 2 3 4;
         1 4 5 6;
         1 6 7 8;
         1 8 9 2];
vert = vertices; 
[theta,r] = cart2pol(vertices(:,1),vertices(:,2));

%% Draw the Spiral
% On each step ,all the squares are rotated by pi/4
for k = 0:pi/4:4*pi
    [vert(:,1),vert(:,2)] = pol2cart(theta-k,r);
    patch('Vertices',vert,'Faces',faces,...
          'facecolor','flat','edgecolor','none',...
          'FaceVertexCData',[1 2 3 4]');
    r = r/sqrt(2);  
end
axis equal off