function [bx,by] = bezier(x,y,n)
%% Bezier Curve
% Function claculates 2d bezier curve points using DeCasteljau Algorithm
% Taken from http://cubic.org/docs/bezier.htm
% n = no of points in bezier curve
% x = x coordinates of control point
% y = y coordinates of control point
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
end %bezier function end