% Chrysanthemum
% Formula taken from Paul Bourke's website 
u = linspace(0,21*pi,2000);
r = 5*(1+sin(11*u/5))-4*sin(17*u/3).^4.*sin(2*cos(3*u)-28*u).^8;
x = r.*cos(u);
y = r.*sin(u);
z = (r/20+0.2).*sin(r*2*pi/7);

figure
line(x,y,z);
axis equal off
view(3)

figure
verts = {[x' y' z']};
h = streamtube(verts,0.15);
shading interp,colormap(cool)
axis off equal
view(3)