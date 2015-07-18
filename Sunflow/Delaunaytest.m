%Delaunaytest
x = -1+2*rand(6,20);
y = -1+2*rand(6,20);
x(1,1:4)=[-1 1 1 -1];
y(1,1:4)=[-1 -1 1 1];

TRI = delaunay(x(1,:),y(1,:));
[row,col]=size(TRI);
tri2=zeros(row,col,6);

for n=1:6
    x(n,1:4)=[-1 1 1 -1];
    y(n,1:4)=[-1 -1 1 1];
    tri2(:,:,n)=delaunay(x(n,:),y(n,:));
end
h=zeros(1,6);
h(1)=trimesh(tri2(:,:,1),-1*ones(size(x(1,:))),x(1,:),y(1,:));hold on
h(2)=trimesh(tri2(:,:,2),1*ones(size(x(1,:))),x(2,:),y(2,:));
h(3)=trimesh(tri2(:,:,3),x(3,:),y(3,:),1*ones(size(x(1,:))));
h(4)=trimesh(tri2(:,:,4),x(4,:),y(4,:),-1*ones(size(x(1,:))));
h(5)=trimesh(tri2(:,:,5),x(5,:),1*ones(size(x(1,:))),y(5,:));
h(6)=trimesh(tri2(:,:,6),x(6,:),-1*ones(size(x(1,:))),y(6,:));

scfile=fopen('delaunaytest.sc','w');
for n=1:6
    faces=get(h(n),'faces');
    cmap=hsv(length(faces));
    vertices=get(h(n),'vertices');
    [row,col]=size(faces);
    for m=1:row
        shader2ScFile('glass',['face' num2str(n) 'shader' num2str(m-1)],1.2,cmap(m,:),scfile);
        
    end
    mesh2ScMultipleShader(vertices,faces-1,row,['face' num2str(n) 'shader'],['face' num2str(n)],scfile);
end

shader2ScFile('diffuse','shaderHair',[0.7 0.7 0.7],scfile);
for n=1:6
    faces=get(h(n),'faces');
    vertices=get(h(n),'vertices');
    [row,col]=size(faces);
    for m=1:row
        fac=faces(m,:);
        points2ScHair(vertices(fac,:),scfile);
    end
end
fclose(scfile);

hidden off
axis equal
hold off

%mesh2ScMultipleShader(vertices,faces,numberOfShader,shaderName,meshName,sc
%File)