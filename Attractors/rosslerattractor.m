%Rossler attractor
numPoints = 100000;
x = zeros(1,numPoints);
y = zeros(1,numPoints);
z = zeros(1,numPoints);
x(1) = 0;%0.10001;
y(1) = 0;%-0.10001;
z(1) = 0;%0.10001;
dt = 0.02;
a = 0.2;
b = 0.2;
c = 8.0;
for n = 2:numPoints
    x(n) = x(n-1)+ dt*(-y(n-1)-z(n-1));
    y(n) = y(n-1)+ dt*(x(n-1)+a*y(n-1));
    z(n) = z(n-1)+ dt*(b+z(n-1)*(x(n-1)-c));
end

% draw connecting line
line(x,y,z,'LineWidth',0.5,'Color',[0.2 0.3 0.5]);
view(3)
axis on equal
box on

% draw only the points
figure
line(x,y,z,'Marker','.'...
          ,'Markersize',1,...
          'Linestyle','none',...
          'Color',[0.2 0.3 0.5]);
view(3)
axis on equal
box on