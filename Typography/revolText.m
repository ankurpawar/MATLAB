%% Text revolution
% This script generate surface of revolution from SVG path.
% Code will parse only absolute path in the file.
function revolText
fid = fopen('pi.txt','r');
M = [0 0]; %current point
L = [0 0]; %end point of line
x = zeros(1,3);
y = zeros(1,3);
% Origin in SVG coordinate system lies at top left corner.
% On the other hand origin in MATLAB lies at bottom left.
% This makes the SVG y-axis inverted in MATLAB.So we can subtract
% a large value from SVG y-coorinate to make it suitable for MATLAB
height = 150;

% These blank arrays will be filled while parsing the file.x and y
% coordinates of curve and lines will be kept in these arrays.When
% an new path is encountered all the elements in these arrays are
% removed.
xcord = [];
ycord = [];

% Counter to store total number of path in file.
countM = 0;
rough = ' '; %character to store space between points
cmap = hsv(128);

%% Parse file
while ~feof(fid)
    dat=fscanf(fid,'%c',1);
    switch dat
        case 'M' %move to a new point
            % A new path is starting at this point.save the previously
            % stored point and start collecting new points.
            m1 = fscanf(fid,'%g',1);
            rough = fscanf(fid,'%c',1);
            m2 = fscanf(fid,'%g',1);
            M = [m1 m2];
            % Rotate the path that was completed in previous steps
            if ~isempty(xcord)
                n = 10;
                t = linspace(0,-pi/2,n);
                theta = repmat(t,length(xcord),1);
                % All the x coordinates will remain unchanged
                % Duplicate x and y coordinates.Previously x and y were
                % lying on the plane now z will be added to make 3d.
                xpos = repmat(xcord,1,n);
                ypos = repmat(ycord,1,n);
                X = xpos;
                %Size of z is same as x
                Z = zeros(size(xpos));
                %Rotate y and z coordinate by angle theta
                [Z,Y] = transform2d(Z,ypos,0,0,theta,0,0);
                %Convert to face and vertices
                [faces,vertices,colmap]=surf2patch(X,Y,Z);
                patch('faces',faces,'vertices',vertices,'facecolor',cmap(countM,:));
            end
            % ready to store new path
            xcord = [];
            ycord = [];
            countM = countM+1;
            xcord = [xcord;m1];
            ycord = [ycord;height-m2];%make y upside down.
        case 'C'  %bezier curve
            % Read 3 pair of numbers from file.
            for k = 1:3
                x(k) = fscanf(fid,'%g',1);
                rough = fscanf(fid,'%c',1);
                y(k) = fscanf(fid,'%g',1);
            end
            % calculate the bezier curve
            [a,b]=bezierQuad([M(1) x],height-[M(2) y],20);%make y upside down.
            % Last point in bezier curve is the new current point
            M=[x(3) y(3)];
            xcord=[xcord;a'];
            ycord=[ycord;b'];
        case 'L'  %line
            % Read two numbers from file.
            l1 = fscanf(fid,'%g',1);
            rough = fscanf(fid,'%c',1);
            l2 = fscanf(fid,'%g',1);
            L = [l1 l2];
            xcord = [xcord;l1];
            ycord = [ycord;height-l2]; %make y upside down.
            % These two points will be the current point.
            M = L;
        otherwise
            %do nothing
    end
end


%% Draw the last path
% M moveto will not be the last.When file ends the last path
% has completed.
n = 10;
t = linspace(0,-pi/2,n);
theta = repmat(t,length(xcord),1);
xpos = repmat(xcord,1,n);
ypos = repmat(ycord,1,n);
X = xpos;
Z = zeros(size(xpos));
[Z,Y] = transform2d(Z,ypos,0,0,theta,0,0);
[faces,vertices,colmap] = surf2patch(X,Y,Z);
patch('faces',faces,'vertices',vertices,'facecolor',cmap(countM,:)...
    ,'edgecolor','none');

axis equal
camlight left
view(3)
%Close the file
fclose(fid);
return %revolText end here

%% 2D Tranformation
% Function to perform transformation in 2d plane.
function [xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
%tx,ty a scalar value .Point of translation
%phi a scalar value.Angle of rotation
%xr,yr a scalar value.radius of rotation
xd = x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd = x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;
return

%% Bezier Curve
% Function claculates 2d bezier curve points
function [bx,by] = bezierQuad(x,y,n)
%Function to calculate bezier curve points using DeCasteljau Algorithm
%Taken from http://cubic.org/docs/bezier.htm
%n = no of points in bezier curve
%x = x coordinates of control point
%y = y coordinates of control point
t = linspace(0,1,n);
N = length(x);
qx = zeros(N,n);
qy = zeros(N,n);
bx = qx(1,:);
by = qy(1,:);
for k = 1:N-1
    if k == 1
        for i = 1:N-1
            qx(i,:) = x(i)+(x(i+1)-x(i)).*t;
            qy(i,:) = y(i)+(y(i+1)-y(i)).*t;
        end
    else
        for i = 1:N-k+1
            qx(i,:) = qx(i,:)+(qx(i+1,:)-qx(i,:)).*t;
            qy(i,:) = qy(i,:)+(qy(i+1,:)-qy(i,:)).*t;
        end
    end
end
bx = qx(1,:);
by = qy(1,:);
return