%Barth sextic
% s=0.05;
% [x,y,z]=meshgrid(linspace(-1.5,1.5,120));
% t = 0.5*(1 + sqrt(5));
% u= 4*(t^2* x.^2 - y.^2).*(t^2.* y.^2 - z.^2).*(t^2 .* z.^2 - x.^2) - (1+2*t)*(x.^2 + y.^2 + z.^2 - 1).^2;
% [f,v]=isosurface(u,0);

a=2*pi;
s=2*pi/60;
[x,y,z]=meshgrid(linspace(-a,a,100));
cx = cos(2*x);
cy = cos(2*y);
cz = cos(2*z);
u = 10.0*(cos(x).*sin(y) + cos(y).*sin(z) + cos(z).*sin(x))- 0.5*(cx.*cy + cy.*cz + cz.*cx) - 14.0;
[f,v] = isosurface(u,0);

p2 = patch('Vertices',v,'Faces',f,'edgecolor','k','facecolor','r');
%isosurface(u,0);
axis equal


n = isonormals(u,p2);

scfile = fopen('barth.sc','w');
meshNormals2ScFile(v,f-1,n,'barthshader','barthmesh',scfile);
fclose(scfile);


callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);