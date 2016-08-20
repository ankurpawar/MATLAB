function shericalGroup
% Independent script that generate some spherical polyhedron
phi=(1+sqrt(5))/2; %golden ration

% cell for vartices and faces
vertCell=cell(5,1);
faceCell=cell(5,1);

% tetrahedron vertices and faces
vert_tetra = [+1 +1 +1
    -1 -1 +1
    -1 +1 -1
    +1 -1 -1];
face_tetra = [1 2 3
    2 3 4
    1 3 4
    1 2 4];
vertCell{1,1} = vert_tetra;
faceCell{1,1} = face_tetra;

% octahedron vertices and faces
vert_octa = [1 0 0
    -1 0 0
    0 1 0
    0 -1 0
    0 0 1
    0 0 -1];
face_octa = [3 5 2
    5 3 1
    6 3 2
    3 6 1
    4 5 1
    5 4 2
    4 6 2
    6 4 1];
vertCell{2,1} = vert_octa;
faceCell{2,1} = face_octa;

% icosahedron face and vertices
vert_icosa = [0 1 phi;
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

face_icosa = [1     5     9
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
vertCell{3,1} = vert_icosa;
faceCell{3,1} = face_icosa;

% dodecahedron face and vertices
vert_dodeca = [1 1 1
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

face_dodeca = [1 13 2 18 17;
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
vertCell{4,1} = vert_dodeca;
faceCell{4,1} = face_dodeca;

% cube face and vertices
vert_cube = [1 1 1
    1 1 -1
    1 -1 1
    1 -1 -1
    -1 1 1
    -1 1 -1
    -1 -1 1
    -1 -1 -1];
face_cube = [1 2 4 3
    1 5 6 2
    5 6 8 7
    7 8 4 3
    1 3 7 5
    2 4 8 6];
vertCell{5,1} = vert_cube;
faceCell{5,1} = face_cube;

xoff = [-2.5 2.5 0 2.5 -2.5];
yoff = [-2.5 -2.5 0 2.5 2.5];
zoff = [0 0 0 0 0];
count = 0;
colors = hsv(5);
for m = 1:5
    [pairs,tubeLineX,tubeLineY,tubeLineZ] = sphericalPolhedra(...
        vertCell{m,1},faceCell{m,1});
    for n = 1:length(pairs)
        tubeLines = {[tubeLineX(n,:)'+xoff(m) ...
            tubeLineY(n,:)'+yoff(m) ...
            tubeLineZ(n,:)'+zoff(m)]};
        daspect([1 1 1]);
        h = streamtube(tubeLines,0.2);
        set(h,'facecolor',colors(m,:),'edgecolor','none');
        x=get(h,'xdata');
        y=get(h,'ydata');
        z=get(h,'zdata');
        [v,f] = surf2tripatch(x,y,z);
        count=count+1;
    end
end
camlight headlight
axis equal
view(3);
end