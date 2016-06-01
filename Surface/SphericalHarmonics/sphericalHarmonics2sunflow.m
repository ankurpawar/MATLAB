% Script to export spherical harmonics to SunFlow along. Mesh data along
% with the texture data
deg = 10;
ord = 2;
shRef = 1;
shScale = 0.5;
nPoints = 100;
%get the spherical harmonics x,y,z data
[x,y,z,r] = SphericalHarmonics2(deg,ord,shRef,shScale,'real',nPoints);
% convert to patch
[faces,vertices,colmap] = surf2patch(x,y,z,r);
% Plot the surface
h = patch('faces',faces,'vertices',vertices,'facecolor','flat'...
    ,'Cdata',colmap,'edgecolor','none');
colormap(1-copper(256));

% export to sunflow file
scfile = fopen('spHarmonicsTextured.sc','w');
[triVert,triFaces] = patch2tripatch(vertices,faces);
mesh2ScFile(triVert,triFaces-1,['meshshader'],['sphereHarmonics'],scfile);
fclose(scfile);
view(3)
axis on equal
shading interp

% Saving the texture data
[textureU,textureV] = meshgrid(linspace(0,1,nPoints)...
    ,linspace(0,1,nPoints));

UV = [reshape(textureU,nPoints*nPoints,1) ...
    reshape(textureV,nPoints*nPoints,1)];
textureUV = fopen('SphericalharmonicsUV.txt','w');
for ord = 1:length(triVert)
    fprintf(textureUV,'  %g  %g \n',UV(ord,:));
end
fclose(textureUV);