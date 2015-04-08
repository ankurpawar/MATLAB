function RhombicTriacontahedron
%Rhombic Triacontahedron
phi=(1+sqrt(5))/2;
vert1=[0 1 phi
    0 1 -phi
    0 -1 phi
    0 -1 -phi
    1 phi 0
    1 -phi 0
    -1 phi 0
    -1 -phi 0
    phi 0 1
    phi 0 -1
    -phi 0 1
    -phi 0 -1];

vert2=[1 1 1
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

face2=[1 13 2 18 17;
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

K = convhulln(vert1);
[vert1(:,1),vert1(:,2)]=transform2d(vert1(:,1),vert1(:,2),0,0,90*pi/180,0,0);
vert=[vert1;vert2];
K = convhulln(vert);
h=trisurf(K,vert(:,1),vert(:,2),vert(:,3),'facecolor','r');

for n=1:length(vert)
    placeText(vert(n,1),vert(n,2),vert(n,3),n);
end

axis equal
view(3)

function [xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
%2d transformation without scaling
%[xd,yd]=transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;