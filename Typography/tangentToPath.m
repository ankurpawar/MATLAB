%% Tangent to curve
function tangentToPath
% Code reads the path extracted from SVG file and draw
% tangent on each point.File used in this code contains path 
% that is taken from a SVG file made in Inkscape.  
% 
% dy=diff(y)./diff(t)
% k=220; % point number 220
% tang=(t-t(k))*dy(k)+y(k)
% y=f(a)+f'(a)(x-a) a point of tangent
% slope = (y(n+1)-y(n-1)) / (x(n+1) - x(n-1));
% y = slope * (x - x(n)) + y(n);
% is calculated

%A line is drawn passing through the current point .It is rotated by
%an angle between the current point and previous point

% Line to be used as tangent.Coordinates are converted to 
% polar.  
xx = -5:5;
yy = zeros(1,length(xx));
[phi,r] = cart2pol(xx,yy);
% open the file
fid = fopen('typo.txt','r');
count = 0;
L = [0 0];
M = [0 0];
x = zeros(1,3);
y = zeros(1,3);
% Origin in SVG coordinates is located at top left corner of screen.
% Before drawing it has to be made upside down. 
height = 750;
noOfBezierPoints = 10;

%% Start reading SVG path
while ~feof(fid)
    dat = fscanf(fid,'%c',1);
    switch dat
        case 'M' % Move the current position  
            m1 = fscanf(fid,'%g',1);
            c = fscanf(fid,'%c',1);
            m2 = fscanf(fid,'%g',1);
            M = [m1 m2];
            count = count + 1;
        case 'C' % Quadratic Bezier curve
            %Read control points of curve
            for k = 1:3
                x(k) = fscanf(fid,'%g',1);
                c = fscanf(fid,'%c',1);
                y(k) = fscanf(fid,'%g',1);
            end
            %Calculate bezier curve points
            [a,b] = bezier([M(1) x],height-[M(2) y],noOfBezierPoints);
            %find and draw the tangent to each point on curve 
            for k = 2:length(a)
                theta = atan2(b(k)-b(k-1),a(k)-a(k-1));
                [xx,yy] = pol2cart(phi+theta,r);
                line(xx+a(k),yy+b(k),'color',[0 0 0]);
            end
            %move the current position to the last control point of curve
            M = [x(3) y(3)];
        case 'L' %Straight line
            %Read points of straight line
            l1 = fscanf(fid,'%g',1);
            c = fscanf(fid,'%c',1);
            l2 = fscanf(fid,'%g',1);
            L = [l1 l2];
            line([M(1) L(1)],height-[M(2) L(2)],'color',[0 0 0]); 
            theta = atan2(M(2)-L(2),M(1)-L(1));
            [xx,yy] = pol2cart(phi+theta,r);
            line(xx+L(1),height-(yy+L(2)),'color',[0 0 0]);
            %move the current point to new position
            M = L;
        otherwise
            %do nothing
    end
end

axis equal off
fclose(fid);


%% Bezier Curve
% Function claculates 2d bezier curve points
function [bx,by] = bezier(x,y,n)
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