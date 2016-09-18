function pyTreeSquare = pythGeneral(n,alpha,beta,flip)
% Fuction return all the squares of a pythagoras tree upto n level.
% alpha and beta are the angle for the next level of suqare.
% flip is boolean, if it is true then the tree is flipped on each level.
% pyTreeSquare is array of structures, in which every element has four
% point with x and y coodinates of squares.
% Based on the code
% matlabdb-AT-mathematik.uni-stuttgart.de
% http://matlabdb.mathematik.uni-stuttgart.de/download.jsp?MC_ID=5&SC_ID=13&MP_ID=289
%
%         C
%         /`.
%  	     / | `.
% 	    /  |   `.
% 	   /   |     `.
%     /    |       `.
%    /al   |       be`.
%  A ------------------` B
%          D
%
% al = alpha
% be = beta
% angle ACB = pi/2
% AC = AB*cos(al)
% BC = AB*sin(al)
% CD = AC*sin(al) = AB*cos(al)*sin(al)
% AD = AC*cos(al) = AB*cos(al)*cos(al)
% Starting with AB = 1 so scaling factor becomes
% sX = cos(al)*sin(al), sY = cos(al)*cos(al)
% Scaling factor. This will be applied to size of sqaure for the next level
scaleX = cos(alpha)*cos(alpha);
scaleY = cos(alpha)*sin(alpha);
% base points
A = struct('x',0,'y',0);
B = struct('x',1,'y',0);
pyTreeSquare = ptree(n,A,B,scaleX,scaleY,flip);
end

function pyTreeSquare = ptree(n,A,B,scaleX,scaleY,flip)
% This function find the all the squares of pythagoras tree upto n level.
% A,B are the points of base of square. 
% scaleX,scaleY are the x and y scaling factor
% flip is boolean, if it is true then tree will be flipped on each level. 
%       E
%      / \
%     /   \
%    /     \
%   /       \
%  D---------C
%  |         |
%  |         |
%  |         |
%  A---------B
C = struct('x',0,'y',0);
D = struct('x',0,'y',0);

% Perpendicular vector to AB. Clock wise perpendicular vector for (x,y) is
% (-y,x)
hx = -(B.y - A.y);
hy = B.x - A.x;
% Calculate the other points of square
C.x = B.x+hx;
C.y = B.y+hy;
D.x = A.x+hx;
D.y = A.y+hy;

pyTreeSquare = struct('points',[A B C D]);

if n > 0
    % Find the point for next level
    E = pointNextLevel(C,D,scaleX,scaleY,flip,n);
    % find the left and right square
    leftSquare = ptree(n-1,D,E,scaleX,scaleY,flip);
    rightSquare = ptree(n-1,E,C,scaleX,scaleY,flip);
    pyTreeSquare = [pyTreeSquare; leftSquare; rightSquare];
end
end

function E = pointNextLevel(C,D,scaleX,scaleY,flip,depth)
%
%       E
%       |
%       | 
%       |
%       |
% D-------------------C
%
E = struct('x',0,'y',0);
if (flip & ~(mod(depth,2) == 0)) % turn the triangle every second time
    E.x = D.x + (1-scaleX)*(C.x-D.x) + scaleY*(D.y-C.y);
    E.y = D.y + (1-scaleX)*(C.y-D.y) + scaleY*(C.x-D.x);
else
    E.x = D.x + scaleX*(C.x-D.x) + scaleY*(D.y-C.y);
    E.y = D.y + scaleX*(C.y-D.y) + scaleY*(C.x-D.x);
end
end