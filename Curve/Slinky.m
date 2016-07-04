% Slinky
nPoint = 3000;
t = linspace(0,pi,nPoint);
x=(16+2*cos(35*pi*2*t)).*cos(2*pi*t);
y=(16+2*cos(35*2*pi*t)).*sin(2*pi*t);
z=10*t+2*sin(35*2*pi*t);

figure
line(x,y,z);
axis equal
view(3)

figure
verts = {[x' y' z']};
twistangle = {t/100000};
daspect([1 1 1]);
h=streamribbon(verts,twistangle);
shading interp
colormap cool
alpha(0.5);
axis equal
view(3);

figure
verts  = {[y' x' z']};
tubeWidth = 1;
h1 = streamtube(verts, tubeWidth);  
shading interp
alpha(0.5)
axis equal
view(3);