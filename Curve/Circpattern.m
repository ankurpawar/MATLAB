%Spiral similar to Spherical Helix.
r = 1;
theta = linspace(-10*pi,10*pi,1000);
phi = linspace(-0.5*pi,0.5*pi,1000);
[x,y,z] = sph2cart(theta,phi,r);
line(x,y,z);
view(3),axis equal on