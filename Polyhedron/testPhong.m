%phongColors

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

%face=[12 8 4;8 12 11;7    12     2];
%h=patch('vertices',vert,'faces',face,'facecolor','g');
% get(h)

kd=0.5;
ka=0.5;
ks=0.5;
refl=1;
l=[0 2 2];
nCap=[0 0 0];
for n=1:length(face)
    v1=vert(face(n,1),:);
    v2=vert(face(n,2),:);
    centroid=mean(vert(face(n,:),:));
    line(centroid(1),centroid(2),centroid(3),'marker','o');
    
    fn=cross(centroid-v1,centroid-v2);
    line([centroid(1) centroid(1)-fn(1)],[centroid(2) centroid(2)-fn(2)],[centroid(3) centroid(3)-fn(3)],'marker','o');
    const=dot(l/sqrt(sum(l.^2)),fn/sqrt(sum(fn.^2)));
    nCap=fn/sqrt(sum(fn.^2));
    d=(l-centroid)/sqrt(sum((l-centroid).^2));
    xD=-l+2*centroid+2*nCap*(dot(d,nCap));
    cc=dot(xD,l);
    xDcap=cc/sqrt(sum(cc.^2));
    intens=ka+kd*max(0,const)+ks*max(0,xDcap^refl);
    
    patch('vertices',vert(face(n,:),:),'faces',[1 2 3],'facecolor',intens*[0 1 0]);
end
view(3)
axis equal
