%cube with holes on the faces
f=cell(6,1);
v=cell(6,1);

for n=1:6
    [faces,vertices]=holedPlane;
    f{n,1}=faces;
    v{n,1}=vertices;
    n;
end

vnew=cell(6,1);
%xy plane
[row,col]=size(v{1,1});
z=ones(row,1);
vnew{1,1}=[v{1,1}(:,1) v{1,1}(:,2) z];

[row,col]=size(v{2,1});
z=-ones(row,1);
vnew{2,1}=[v{2,1}(:,1) v{2,1}(:,2) z];

%yz plane
[row,col]=size(v{3,1});
z=ones(row,1);
vnew{3,1}=[z v{3,1}(:,1) v{3,1}(:,2)];

[row,col]=size(v{4,1});
z=-ones(row,1);
vnew{4,1}=[z v{4,1}(:,1) v{4,1}(:,2)];

%xz plane
[row,col]=size(v{5,1});
z=ones(row,1);
vnew{5,1}=[v{5,1}(:,1) z v{5,1}(:,2)];

[row,col]=size(v{6,1});
z=-ones(row,1);
vnew{6,1}=[v{6,1}(:,1) z v{6,1}(:,2)];

clear v faces vertices


scfile=fopen('holedCube1.sc','w');
shader2ScFile('diffuse','cubeShader',[0.5 0.5 0.5],scfile);

for n=1:6
    faces=f{n,1};
    vertices=vnew{n,1};
    mesh2ScFile(vertices,faces-1,['cubeShader'],['holedSurface' num2str(n)],scfile);
    patch('Faces', faces, 'Vertices', vertices, 'FaceColor', 'r','edgecolor','none');
end
axis equal

fclose(scfile);

sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,5,true});