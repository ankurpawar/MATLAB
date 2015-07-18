%% test quadratic bezier curve
x = [0 0.5 1];
y = [0 0.5 0];
%number of points
n = 10;
t = linspace(0,1,n);
%1d interpolate
tic
p1x = x(1) + (x(2)-x(1))*t;
p1y = y(1) + (y(2)-y(1))*t;

p2x = x(2) + (x(3)-x(2))*t;
p2y = y(2) + (y(3)-y(2))*t;

p3x = p1x + (p2x-p1x).*t;
p3y = p1y + (p2y-p1y).*t;
toc

tic
[bx,by] = bezier2(x,y,n);
toc
plot(p3x,p3y,'b',bx,by+0.1,'r')
%plot(bx,by);

% Input: array P[0:n] of n+1 points and real number u in [0,1] 
% Output: point on curve, C(u) 
% Working: point array Q[0:n] 
% 
% for i := 0 to n do 
% Q[i] := P[i]; // save input 
% for k := 1 to n do 
% for i := 0 to n - k do 
% Q[i] := (1 - u)Q[i] + u Q[i + 1];
% return Q[0];
x = [40,80,150];
y = [100,20,180];
t = linspace(0,1,1000);
N = length(x);
qx = zeros(N,1000);
qy = zeros(N,1000);
tic
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
toc
line(qx(1,:),qy(1,:)-0.1)