function torusSurf
% torus surface
u = linspace(-2*pi,2*pi,150);
v = u;
[U,V] = meshgrid(u,v);
x = (7+3*cos(V)).*cos(U);
y = (7+3*cos(V)).*sin(U);
z = 3*sin(V);
h1 = surf(x,y,z,'facelighting','phong'...
    ,'edgecolor','none','facecolor',[0.5 0.8 0.8]);
material([0.2259    0.5798    0.24]);
camlight headlight,
camlight left
axis equal off
set(gcf,'color',[1 1 1]);

% export_fig function is available then save figure as png file. Create a
% button with callback that will save the figure as antialiased image.
if exist('export_fig') > 0
    export_fig('png','-nocrop','-a2','torusSurf');
end
end