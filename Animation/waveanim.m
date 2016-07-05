function waveanim
% Animation of wave using sinc function.
% The animation is not accurate.
x = linspace(-20,20,80);
y = x;
[X,Y] = meshgrid(x,y);
r = sqrt((X).^2+(Y).^2);
r1 = sqrt((-5+X).^2+(-20+Y).^2);
r2 = sqrt((20+X).^2+(-20+Y).^2);
r3 = sqrt((20+X).^2+(20+Y).^2);
r4 = sqrt((20+X).^2+(-5+Y).^2);

z = sinc(0.2*r);

h = surf(X,Y,z,r,'facecolor',[0.2 0.2 0.3],'edgecolor',[0.6 0.9 0.8]);
axis([-20 20 -20 20 -5 5])
view(17,117);
camlight headlight
axis off
set(gcf,'color',[1 1 1])
shading interp
colormap spring
set(gcf,'Renderer','zbuffer')
set(findobj(gca,'type','surface'),...
    'FaceLighting','phong',...
    'AmbientStrength',.3,'DiffuseStrength',.8,...
    'SpecularStrength',.9,'SpecularExponent',25,...
    'BackFaceLighting','unlit')
z1=[];
for n = 0:100
    z1 = 0.3*sinc(r1-0.09*n*pi-pi);
    z2 = 0.3*sinc(r2-0.15*(n-30)*pi);
    z3 = 0.3*sinc(r3-0.15*n*pi);
    z4 = 0.3*sinc(r4-0.15*(n-12)*pi);
    z = z1+z2+z3+z4;
    set(h,'zdata',z);
    pause(0.01);
end
end