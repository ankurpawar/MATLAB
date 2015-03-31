%% Baravelle Spiral
% This spiral is made from three triangle.On each step
% all triangles are rotated at an angle pi/3 and scaled down
% by 1/2.

%% Three equilateral Traingles
% Length is taken as 1.Vertices represent an equilateral triangle.
% Vertices consist of 7 points. O is the centre of the triangle, 
% A,B,C are the vertex and D,E,F are the centre of edges. 
% D,E,F are connected to the O.Coordinates are rotated in polar 
% coordinates and converted to cartesian before they are drawn.
l = 1; 
vertices = [0                0;                           %O
            0                l/(2*sin(pi/3));             %A
           -l/2             -l/2*tan(pi/6);               %B
            l/2             -l/2*tan(pi/6);               %C
           -l/2*cos(pi/3)    l/(2*sin(pi/3))*cos(pi/3)^2; %D
            0               -l/2*tan(pi/6);               %E 
            l/2*cos(pi/3)    l/(2*sin(pi/3))*cos(pi/3)^2];%F
faces = [1 5 2 7;1 6 3 5;1 6 4 7];
vert = vertices;
[theta,r] = cart2pol(vertices(:,1),vertices(:,2));

%% Draw the Spiral
% On each step , rotate each triangle by pi/3
for k = 0:pi/3:3*pi
    [vert(:,1),vert(:,2)] = pol2cart(theta-k,r);
    patch('Vertices',vert,'Faces',faces,...
          'facecolor','flat','edgecolor','none',...
          'FaceVertexCData',[1 2 3]');
    r = r/2;  
end
axis equal off

