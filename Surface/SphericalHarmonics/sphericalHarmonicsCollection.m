% Script to make collection of spherical harmonics
meshSize = 75;
shRef = 1;
shScale = 0.5;

for deg = 1:5
    for ord = 0:deg
        [x,y,z,r] = SphericalHarmonics2(deg,ord,shRef,shScale,'real'...
            ,meshSize);
        [faces,vertices,colmap] = surf2patch(x,y,z,r);
        vertices(:,1) = vertices(:,1) + 4*deg;
        vertices(:,2) = vertices(:,2) + 4*ord;
        h = patch('faces',faces,'vertices',vertices,'facecolor','flat'...
            ,'Cdata',colmap,'edgecolor','none');
    end
end
colormap(1-copper(256));
view(3)
shading interp
axis on equal
set(gcf,'color',[1 1 1])
set(gca,'color',[1 1 1])