% script to test function SphericalHarmonics1
shDegree = 3;
shOrder = 2;
meshSize = 100;

figure
[x,y,z,r] = SphericalHarmonics1(shDegree,shOrder,'imag',meshSize);
surf(x,y,z,r,'edgecolor','none');
shading interp
colormap(summer)
view(3)
axis equal
set(gcf,'color',[1 1 1]);

figure
[x,y,z,r] = SphericalHarmonics1(shDegree,shOrder,'real',meshSize);
surf(x,y,z,r,'edgecolor','none');
shading interp
colormap(summer)
view(3)
axis equal
set(gcf,'color',[1 1 1]);

figure
[x,y,z,r] = SphericalHarmonics1(shDegree,shOrder,'abs',meshSize);
surf(x,y,z,r,'edgecolor','none');
shading interp
colormap(summer)
view(3)
axis equal
set(gcf,'color',[1 1 1]);