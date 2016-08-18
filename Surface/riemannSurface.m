%riemannSurface1
numPoint=50;
[x,y] = meshgrid(linspace(-2*pi,2*pi,numPoint));
z=(x+i*y);
z=(z);
surf(real(z),imag(z),abs(z));
axis equal