%surfacetest
[x,y,z] = peaks(100);

zmin=min(min(z));
zmax=max(max(z));

%surf(x,y,z),axis equal
h=contour3(x,y,z,20);

h=findobj('type','patch');
%set(h,'edgecolor',[1 1 1],'linewidth',2);

%get(h(1))
figure
lenh=length(h);

cmap=flipud(colormap(jet(lenh)));
levels=linspace(zmin,zmax,lenh);

totalFaces=[];
totalVertices=[];
vertcount=0;
scfile=fopen('peakcontour.sc','w');
for n=1:length(h)
    
    vertices=get(h(n),'vertices');
    vert=vertices;
    vert(any(isnan(vert),2),:) = [];
    
    [vrow,vcol]=size(vert);
    zl=levels(n)*ones(vrow,1)/3;
    
    vert(:,3)=zl;
    
    %verts = {vert};
    
    [v,f]=polyStrip(vert(:,1),vert(:,2),0.035);
    vz=levels(n)*ones(length(v),1)/3;
    v(:,3)=v(:,3)+vz;
    patch('faces',f,'vertices',v,'facecolor',cmap(n,:));
    
    shader2ScFile('diffuse',['strip' num2str(n)],[1 1 1],scfile);
    mesh2ScFile(v,f-1,['strip' num2str(n)],['stripmesh' num2str(n)],scfile);
    
    [f, v] = poly2fv(vert(:,1),vert(:,2));
    [vrow,vcol]=size(v);
    zl=levels(n)*ones(vrow,1)/3;
    v=[v+0.5 zl];
    faces=get(h(n),'faces');
    patch('faces',f,'vertices',v,'facecolor',cmap(n,:));
    %streamtube(verts,0.1);
    shader2ScFile('diffuse',['slice' num2str(n)],cmap(n,:),scfile);
    mesh2ScFile(v,f-1,['slice' num2str(n)],['slicemesh' num2str(n)],scfile);
    %patch2OBJ2(vertices,faces,['slice' num2str(n)]);
end

%patch2OBJ2(totalVertices,totalFaces,['slicedlogo']);
fclose(scfile);
axis equal
view(3)
%hsurf=surf(x,y,z);
%get(hsurf);

callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);
%[vert,face]=surf2tripatch(x1,y1,z);

%mesh2PovMesh(vert,face,'membrane','mlogo');
%patch('faces',fac,'vertices',ver,'facecolor','r');
%surf2OBJ(x,y,z,'membrane');
%L = 40*membrane(1,25);
%mesh2ScFile(vertices,faces,shader,scFile)

