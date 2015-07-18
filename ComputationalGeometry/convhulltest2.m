%convhull test 2
total=550;
theta=(-1+2*rand(1,total))*pi;
phi=(-1+2*rand(1,total))*pi;
[x,y,z]=sph2cart(theta,phi,1);
%plot3(x,y,z,'.')
X=[x' y' z'];
choice=1;

if choice
    k=convhulln(X);
    h=trimesh(k,X(:,1),X(:,2),X(:,3));
    axis equal
    hidden off
    get(h);
    
    %   scfile=fopen('covhulltest.sc','w');
    
    faces=get(h,'faces');
    cmap=hsv(length(faces));
    vertices=get(h,'vertices');
    [row,col]=size(faces);
    %        for m=1:row
    %           shader2ScFile('glass',['face' num2str(1) 'shader' num2str(m-1)],1.2,cmap(m,:),scfile);
    %        end
    %        mesh2ScMultipleShader(vertices,faces-1,row,['face' num2str(1) 'shader'],['face' num2str(1)],scfile);
    %   fclose(scfile)
else
    tes = delaunay3(x,y,z);
    h=trimesh(tes,x,y,z);
    %get(h)
    axis equal
    hidden off
end