%complex mapping

%x axis limits
XformPoint=-1*pi;
XtoPoint=1*pi;

%yaxis limits
YformPoint=-1*pi;
YtoPoint=1*pi;

%number of points in mesh
numPoints=200;

%create meshgrid for surface
[x,y]=meshgrid(linspace(XformPoint,XtoPoint,numPoints),...
    linspace(YformPoint,YtoPoint,numPoints));

%create meshgrid for uv coordinates
[textureU,textureV]=meshgrid(linspace(0,1,numPoints),linspace(0,1,numPoints));

%uv array is a nx2 array , n represent number of vertices in mesh
UV=[reshape(textureU,numPoints*numPoints,1) reshape(textureV,numPoints*numPoints,1)];

z = x+y*i;
%z = cplxgrid(30);z=z;cplxmap(z,tan(z));
%fz=(1-z)./(1+z);
fz=atanh(z);

val= abs(fz);

surf(imag(z),real(z),val,pi+angle(fz),'edgecolor','none');

[f,v,c]=surf2patch(real(z),imag(z),val,pi+angle(fz));
[vert,face]=patch2tripatch(v,f);

scfile=fopen('ComplexSurf.sc','w');
shader2ScFile('diffuse',['cplxSurf'],[0.8 0.8 0.8],scfile);
mesh2ScFile(vert,face-1,['cplxSurf'],['cplxSurface'],scfile);
fclose(scfile);

%texture coordinates file
textureUV=fopen('ComplexTexture.txt','w');
for n=1:length(v)
    fprintf(textureUV,'  %g  %g \n',UV(n,:));
end
fclose(textureUV);


axis equal

%this push button is used to choose a suitable view of surface
%rotate the surface using rotate tool,then press the button
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,5,4});
