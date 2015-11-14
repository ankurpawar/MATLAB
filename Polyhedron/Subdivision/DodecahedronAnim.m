function DodecahedronAnim
%Dodecahedron animation.
phi=(1+sqrt(5))/2; %golden ratio
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

%convex hull will give the faces of the icosahedron
face = convhulln(vert);

%sub divide complete mesh 3 times
for n = 1:3
    [vert, face] = subdivisionLinear3(vert, face);
end

axis equal
axis([-2 2 -2 2 -2 2])
view(3)

p = vert(1,:);
c = linspace(-1,1.5,10);
h = patch('vertices',zeros(3,3),'faces',[1 3 3],'edgecolor','k','facecolor','r');
v = vert;

lighting phong
camlight headlight
material shiny

for n = 1:length(c)
    [v(:,1),v(:,2),v(:,3)] = onSphere(vert(:,1),vert(:,2),vert(:,3),c(n));
    dis = sqrt( sum((v(1,:)).^2) );
    v = v/dis;
    set(h,'vertices',v,'faces',face,'edgecolor','k','facecolor','b');
    pause(0.25);
end


function [xnew,ynew,znew] = onSphere(x,y,z,c)
S = (1./(x.^2+y.^2+z.^2)).^(c);
xnew = x.*S;
ynew = y.*S;
znew = z.*S;
return