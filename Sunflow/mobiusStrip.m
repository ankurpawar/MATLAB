%mobius strip to sunflow with colored texture
numPoints=200;
[u,v]=meshgrid(linspace(0,2*pi,numPoints),linspace(-0.8,0.8,numPoints));
[textureU,textureV]=meshgrid(linspace(0,1,numPoints),linspace(0,1,numPoints));

UV=[reshape(textureU,numPoints*numPoints,1) reshape(textureV,numPoints*numPoints,1)];

t=4;
h=surf(sin(u).*(2-v.*sin(t*u/2))...
    ,cos(u).*(2-v.*sin(t*u/2))...
    ,v.*cos(t*u/2),u...
    ,'edgecolor','none');
%get(h)
x=get(h,'xdata');
y=get(h,'ydata');
z=get(h,'zdata');
%get(h)
[f,v,c]=surf2patch(x,y,z,x);
line(v(1:3,1),v(1:3,2),v(1:3,3));
line(x(1:3,1),y(1:3,1),z(1:3,1));
[vert,face]=patch2tripatch(v,f);
%colormap([jet(125);flipud(jet(125))]);
colormap(hsv(numPoints));
daspect([1 1 1])

scfile=fopen('mobius.sc','w');
shader2ScFile('diffuse',['mobiusShader'],[0.8 0.8 0.8],scfile);
mesh2ScFile(vert,face-1,['mobiusShader'],['mobiusStrip'],scfile);
fclose(scfile);

sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,6,4});

textureUV=fopen('texture.txt','w');
for n=1:length(v)
    fprintf(textureUV,'  %g  %g \n',UV(n,:));
end
fclose(textureUV);

% vertexNorm=fopen('normals.txt','w');
% normals=get(h,'VertexNormals');
% normals=[reshape(normals(:,:,1),numPoints*numPoints,1) ...
%          reshape(normals(:,:,2),numPoints*numPoints,1) ...
%          reshape(normals(:,:,3),numPoints*numPoints,1) ];
% for n=1:length(v)
%     fprintf(vertexNorm,'  %g  %g \n',normals(n,:));
% end
% fclose(vertexNorm);