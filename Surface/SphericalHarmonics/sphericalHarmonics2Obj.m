meshSize = 100;
shRef = 1;
shScale = 0.5;
deg = 10;
ord = 2;

% draw the surface
[x,y,z,r] = SphericalHarmonics2(deg,ord,shRef,shScale,'real',meshSize);
surf(x,y,z,r);
colormap(cool(256));
view(3)
shading interp
axis on equal
set(gcf,'color',[1 1 1]);
set(gca,'color',[1 1 1]);

%export to obj file
surf2OBJ(x,y,z,['sphericalharm_deg' num2str(deg) '_ord' num2str(ord)]);