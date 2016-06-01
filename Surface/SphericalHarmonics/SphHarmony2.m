% script to test function SphericalHarmonics2
shDegree = 3;
shOrder = 2;
meshSize = 100;
shRef = 1;
shScale = 0.5;

figure
[x,y,z,r] = SphericalHarmonics2(shDegree,shOrder,shRef,shScale...
    ,'abs',meshSize);
surf(x,y,z,r,'edgecolor','none');
shading interp
colormap(1-copper)
view(3)
axis equal
set(gcf,'color',[1 1 1]);

figure
[x,y,z,r] = SphericalHarmonics2(shDegree,shOrder,shRef,shScale...
    ,'imag',meshSize);
surf(x,y,z,r,'edgecolor','none');
shading interp
colormap(1-copper)
view(3)
axis equal
set(gcf,'color',[1 1 1]);

figure
[x,y,z,r] = SphericalHarmonics2(shDegree,shOrder,shRef,shScale...
    ,'real',meshSize);
surf(x,y,z,r,'edgecolor','none');
shading interp
colormap(1-copper)
view(3)
axis equal
set(gcf,'color',[1 1 1]);