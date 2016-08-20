function sphericalTetra
% Spherical Tetrahedron
vert=[+1 +1 +1
    -1 -1 +1
    -1 +1 -1
    +1 -1 -1];
face=[1 2 3
    2 3 4
    1 3 4
    1 2 4];

pairs=uniquePair2(face);

tubeLineX=zeros(length(pairs),50);
tubeLineY=zeros(length(pairs),50);
tubeLineZ=zeros(length(pairs),50);

for n=1:length(pairs)
    verNo=pairs(n,:);
    [xnew,ynew,znew]=pointsOnLine2(vert(verNo,1),vert(verNo,2),vert(verNo,3));
    [xnew,ynew,znew]=onSphere(xnew,ynew,znew);
    line(xnew,ynew,znew);
    tubeLineX(n,:)=xnew;
    tubeLineY(n,:)=ynew;
    tubeLineZ(n,:)=znew;
end
axis equal
view(3);

figure
for n=1:length(pairs)
    verts = {[tubeLineX(n,:)' tubeLineY(n,:)' tubeLineZ(n,:)']};
    daspect([1 1 1])
    streamtube(verts,0.1);
end
view(3);
axis equal
end

function [xnew,ynew,znew] = pointsOnLine2(x,y,z)
dvec=[x(2)-x(1) y(2)-y(1) z(2)-z(1)];
dist=sqrt(dvec(1).^2+dvec(2).^2+dvec(3).^2 );
points=linspace(0,1,50);
xnew=x(1)+points.*dvec(1);
ynew=y(1)+points.*dvec(2);
znew=z(1)+points.*dvec(3);
end

function [xnew,ynew,znew] = pointsOnLine(x,y,z)
xoff=x(1);
yoff=y(1);
zoff=z(1);
x=x-xoff;
y=y-yoff;
z=z-zoff;
[th,phi,r]=cart2sph(x,y,z);
newRads=linspace(r(1),r(2),50);
[xnew,ynew,znew]=sph2cart(th(2),phi(2),newRads);
xnew=xnew+xoff;
ynew=ynew+yoff;
znew=znew+zoff;
end

function  [xnew,ynew,znew]=onSphere(x,y,z)
S = sqrt(1./(x.^2+y.^2+z.^2));
xnew = x.*S;
ynew = y.*S;
znew = z.*S;
end

function [pair]=uniquePair(faces);
[row,col]=size(faces);
pair=[];
for n=1:row
    index=faces(n,:);
    for m=1:col-1
        pair=[pair;index(m) index(m+1)];
    end
end
pair = unique(pair,'rows');
end

function [pair]=uniquePair2(faces);
[row,col]=size(faces);
pair=[];
for n=1:row
    index=faces(n,:);
    for m=1:col-1
        pair=[pair;index(m) index(m+1)];
    end
    pair=[pair;index(1) index(m+1)];
end
maxFace=max(max(faces));
ind=nchoosek(1:maxFace,2);
pair=unique(pair,'rows');
pair=unique([pair ; fliplr(pair)],'rows');
pair=intersect(pair,ind,'rows');
end