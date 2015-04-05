%stella octongula
vert=[1  1  1
    -1 -1  1
    -1  1 -1
    1 -1 -1
    -1 -1 -1
    1  1 -1
    1 -1  1
    -1  1  1];
face=[1 2 3
    2 3 4
    1 3 4
    1 2 4
    5 6 7
    6 7 8
    5 7 8
    5 6 8];

colors=pink(length(vert));
h=patch('faces',face,'vertices',vert);
set(h,'facecolor','flat','facevertexcdata',colors);
axis equal
view(3)
