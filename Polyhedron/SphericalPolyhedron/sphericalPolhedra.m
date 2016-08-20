function [pairs,tubeLineX,tubeLineY,tubeLineZ]=sphericalPolhedra(vert,faces);
%[pairs,tubeLineX,tubeLineY,tubeLineZ]=sphericalPolhedra(vert,faces);
pairs=uniquePair(faces);
tubeLineX=zeros(length(pairs),30);
tubeLineY=zeros(length(pairs),30);
tubeLineZ=zeros(length(pairs),30);

for n=1:length(pairs)
    verNo=pairs(n,:);
    [xnew,ynew,znew]=pointsOnLine(vert(verNo,1),vert(verNo,2),vert(verNo,3));
    [xnew,ynew,znew]=onSphere(xnew,ynew,znew);
    tubeLineX(n,:)=xnew;
    tubeLineY(n,:)=ynew;
    tubeLineZ(n,:)=znew; 
end
end

function  [xnew,ynew,znew]=pointsOnLine(x,y,z)
dvec=[x(2)-x(1) y(2)-y(1) z(2)-z(1)];
dist=sqrt(dvec(1).^2+dvec(2).^2+dvec(3).^2 );
points=linspace(0,1,30);
xnew=x(1)+points.*dvec(1);
ynew=y(1)+points.*dvec(2);
znew=z(1)+points.*dvec(3);
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
    pair=[pair;index(1) index(m+1)];
end
maxFace=max(max(faces));
ind=nchoosek(1:maxFace,2);
pair=unique(pair,'rows');
pair=unique([pair ; fliplr(pair)],'rows');
pair=intersect(pair,ind,'rows');
end