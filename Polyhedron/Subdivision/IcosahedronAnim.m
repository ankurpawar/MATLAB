function IcosahedronAnim
%icosahedron
phi=(1+sqrt(5))/2; %golden ratio
vert=[0 1 phi;
    0 1 -phi;
    0 -1 phi;
    0 -1 -phi;
    1 phi 0;
    1 -phi 0;
    -1 phi 0;
    -1 -phi 0;
    phi 0 1;
    phi 0 -1;
    -phi 0 1;
    -phi 0 -1];

face =[1     5     9
    6     3     9
    1     3    11
    3     1     9
    7     2     5
    7     1    11
    1     7     5
    10     6     9
    5    10     9
    2    10     5
    10     4     6
    4    10     2
    4     8     6
    3     8    11
    8     3     6
    7    12     2
    12     4     2
    12     7    11
    8    12    11
    12     8     4];

edge=[1     3
    1     5
    1     7
    1     9
    1    11
    2     4
    2     5
    2     7
    2    10
    2    12
    3     6
    3     8
    3     9
    3    11
    4     6
    4     8
    4    10
    4    12
    5     7
    5     9
    5    10
    6     8
    6     9
    6    10
    7    11
    7    12
    8    11
    8    12
    9    10
    11    12];

cmap=hsv(length(face));

for n=1:4
    [vert, face] = subdivisionLinear3(vert, face);
end

colorMesh=meshgrid(1:length(cmap),1:length(face)/length(cmap));
colorIndex=colorMesh(:);

length(face);
axis vis3d
axis([-2 2 -2 2 -2 2])
view(3)

p=vert(1,:);
c=[1 0 -0.5 -1];
h=patch('vertices',zeros(3,3),'faces',[1 3 3],'edgecolor','k','facecolor','r');
v=vert;

for n=1:length(c)
    [v(:,1),v(:,2),v(:,3)]=onSphere(vert(:,1),vert(:,2),vert(:,3),c(n));
    dis=sqrt( sum((v(1,:)).^2) );
    v=v/dis;
    set(h,'vertices',v,'faces',face,'edgecolor','k','facecolor','flat','facevertexcdata',cmap(colorIndex,:));
    min(v(:,3));
    for m=1:length(edge)
        
        epoints=vert(edge(m,:),:);
        edgePoints=pointsOnLine(epoints(1,:),epoints(2,:),17);
        [edgePoints(:,1),edgePoints(:,2),edgePoints(:,3)]=onSphere(edgePoints(:,1),edgePoints(:,2),edgePoints(:,3),c(n));
        sh=streamtube(mat2cell(edgePoints/dis,17,3),[1 6]);
        tubeX=get(sh,'xdata');
        tubeY=get(sh,'ydata');
        tubeZ=get(sh,'zdata');
        
    end
    pause(0.1)
end

axis vis3d

function  [xnew,ynew,znew]=onSphere(x,y,z,c)
S = (x.^2+y.^2+z.^2).^(c);
xnew = x.*S;
ynew = y.*S;
znew = z.*S;
return