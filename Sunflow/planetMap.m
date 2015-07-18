%planet Map
function planetMap
[x,y,z]=sphere;

surf(x,y,z);
scfile=fopen('saturn.sc','w');
ringWidth=[0.2 0.5 0.1 0.3];
ringRadius=[1.8 2.1 2.65 3];
for n=1:4
    
    [x2,y2]=pol2cart(linspace(0,2*pi,200)',ringRadius(n));
    z2=0*x2;
    [f,v]=orbitRibbon(x2,y2,z2,ringWidth(n));
    patch('faces',f,'vertices',v);
    
    shaderName=['ringShader' num2str(n)];
    shader2ScFile('diffuse',shaderName,[0.75 0.75 0.75],scfile);
    mesh2ScFile(v,f-1,shaderName,['ring' num2str(n)],scfile);
    
end
axis equal
fclose(scfile);
callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);



function [faces,vertices]=orbitRibbon(x,y,z,stripWidth)
[theta,phi,r]=cart2sph(x,y,z);
[xx,yy,zz]=sph2cart(theta,phi,r+stripWidth);
%z=zeros(size(x));
x1=[x;xx];
y1=[y;yy];
z1=[z;zz];
vertices=[x1 y1 z1];
n=length(x);

numberOfVertices=2*n;
numberOfFaces=2*n-2;
faces=ones(numberOfFaces,3);

for count=1:n-1
    faces(count,:)=[count count+1 n+count];
end

for count=n:2*n-2
    faces(count,:)=[count+1 count+2 count-n+2];
end