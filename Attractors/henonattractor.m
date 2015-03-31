%henon attractor
% equation   
% x(n+1)=y(n)+1-1.4*x(n)^2  
% y(n+1)=0.3*x(n);
numPoints = 15000; % number of points in attrcator
x = zeros(1,numPoints);
y = zeros(1,numPoints);
x(1) = 0; %starting x point
y(1) = 0; %starting y point
a = 1.4;
b = 0.3;
for n = 2:numPoints
    x(n) = y(n-1)+1-a*x(n-1)^2;
    y(n) = b*x(n-1);
end

plot(x,y,'.','MarkerSize',1);

scatter(x,y,1,x);
colormap hsv
axis on 

