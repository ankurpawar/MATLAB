%Bour's Minimal Surface
z = cplxgrid(50);

r = 0.5*abs(z);
theta = 2*angle(z);
n =5;

rth = linspace(-2*pi,2*pi,400);
radi = 0.5*ones(1,400);

rx = radi.*cos(rth)-0.5.*radi.^2.*cos(2*rth);
ry = -radi.*sin(rth)-0.5.*radi.^2.*sin(2*rth);
rz = 4/3.*radi.^(3/2).*cos(3/2*rth);


x = r.*cos(theta)-0.5.*r.^2.*cos(2*theta);
y = -r.*sin(theta)-0.5.*r.^2.*sin(2*theta);
z = 4/3.*r.^(3/2).*cos(3/2*theta);

surf(x,y,z,theta,'edgecolor','none');
cmap = makeColorMap(rand(1,3),rand(1,3),rand(1,3),128);
shading interp
colormap([cmap ; flipud(cmap)]);

lighting phong
camlight headlight
axis off equal
set(gcf,'color',[1 1 1])

tubeLines = {[rx' ry' rz']};
daspect([1 1 1])
h = streamtube(tubeLines,0.05);
set(h,'edgecolor','none','facecolor',[0.8 0.8 0.8]);

% export_fig function is available then save figure as png file
if exist('export_fig') > 0
    export_fig('png','-nocrop','BourMinimalSurface');
end