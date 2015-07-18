%sphericalTetra
function sphericalTetra
choice=1;
phi=(1+sqrt(5))/2;
switch choice
    case 1  %tetra
        vert=[+1 +1 +1
            -1 -1 +1
            -1 +1 -1
            +1 -1 -1];
        face=[1 2 3
            2 3 4
            1 3 4
            1 2 4];
    case 2  %octa
        vert=[1 0 0
            -1 0 0
            0 1 0
            0 -1 0
            0 0 1
            0 0 -1];
        face=[3 5 2
            5 3 1
            6 3 2
            3 6 1
            4 5 1
            5 4 2
            4 6 2
            6 4 1];
    case 3   %icosa
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
    case 4
        vert=[1 1 1
            1 1 -1
            1 -1 1
            1 -1 -1
            -1 1 1
            -1 1 -1
            -1 -1 1
            -1 -1 -1
            0 1/phi phi
            0 1/phi -phi
            0 -1/phi phi
            0 -1/phi -phi
            1/phi phi 0
            1/phi -phi 0
            -1/phi phi 0
            -1/phi -phi 0
            phi 0 1/phi
            phi 0 -1/phi
            -phi 0 1/phi
            -phi 0 -1/phi];
        
        face=[1 13 2 18 17;
            1 9 5 15 13;
            13 15 6 10 2;
            2 10 12 4 18;
            18 17 3 14 4;
            1 9 11 3 17;
            5 9 11 7 19;
            15 5 19 20 6;
            6 20 8 12 10;
            20 19 7 16 8;
            8 12 4 14 16;
            11 7 16 14 3];
    case 5      %  cube
        vert=[1 1 1
            1 1 -1
            1 -1 1
            1 -1 -1
            -1 1 1
            -1 1 -1
            -1 -1 1
            -1 -1 -1];
        face=[1 2 4 3
            1 5 6 2
            5 6 8 7
            7 8 4 3
            1 3 7 5
            2 4 8 6];
end

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


for n=1:length(pairs)
    
    verts = {[tubeLineX(n,:)' tubeLineY(n,:)' tubeLineZ(n,:)']};
    daspect([1 1 1])
    
    streamtube(verts,0.1);
end
%whos
%c = combnk(1:4,2)
%C = nchoosek(n,k)

% h=patch('faces',face,'vertices',vert,'facecolor','r');
%get(h)
view(3);
% whos pairs
axis equal

function  [xnew,ynew,znew]=pointsOnLine2(x,y,z)

dvec=[x(2)-x(1) y(2)-y(1) z(2)-z(1)];
dist=sqrt(dvec(1).^2+dvec(2).^2+dvec(3).^2 );

points=linspace(0,1,50);

xnew=x(1)+points.*dvec(1);
ynew=y(1)+points.*dvec(2);
znew=z(1)+points.*dvec(3);

% x=x-xoff;
% y=y-yoff;
% z=z-zoff;

return


function  [xnew,ynew,znew]=pointsOnLine(x,y,z)

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
return

function  [xnew,ynew,znew]=onSphere(x,y,z)
S = sqrt(1./(x.^2+y.^2+z.^2));
xnew = x.*S;
ynew = y.*S;
znew = z.*S;
return

function [pair]=uniquePair(faces);

[row,col]=size(faces);
%pair=zeros(row*())
pair=[];
for n=1:row
    index=faces(n,:);
    for m=1:col-1
        pair=[pair;index(m) index(m+1)];
        
    end
    
    %pair=[pair;index(1) index(m+1)];
    
end
%pair;
%pair=unique(pair,'rows')
%pair=[pair;fliplr(pair)]
pair=unique(pair,'rows');
return

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
return