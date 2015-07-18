%slinky
t=0:0.002:3;
x=(16+2*cos(25*pi*2*t)).*cos(2*pi*t);
y=(16+2*cos(25*2*pi*t)).*sin(2*pi*t);
z=10*t+2*sin(25*2*pi*t);

verts = {[x' y' z']};
twistangle = {t/100000};
daspect([1 1 1]);
%h=streamribbon(verts,twistangle);
h=streamtube(verts,1.5);

title('slinky,t=0:0.001:3');
xlabel('x=(16+2*cos(25*pi*2*t)).*cos(2*pi*t)');
ylabel('y=(16+2*cos(25*2*pi*t)).*sin(2*pi*t)')
zlabel('z=10*t+2*sin(25*2*pi*t);');

view(3);
[sx]=get(h,'xdata');
[sy]=get(h,'ydata');
[sz]=get(h,'zdata');
%get(h)
surf2OBJ(sx,sy,sz,'slinky');