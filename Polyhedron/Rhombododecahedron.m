%Rhombododecahedron
vert = [0 0 2;
    1 -1 1;
    1 1 1;
    -1 1 1;
    -1 -1 1;
    2 0 0;
    0 2 0;
    -2 0 0;
    0 -2 0;
    1 -1 -1;
    1 1 -1;
    -1 1 -1;
    -1 -1 -1;
    0 0 -2];
face=[2 1 3 6
    9 5 1 2
    3 1 4 7
    4 1 5 8
    9 2 6 10
    6 3 7 11
    7 4 8 12
    8 5 9 13
    10 6 11 14
    14 11 7 12
    14 12 8 13
    13 9 10 14];
getEdges(face);
patch('vertices',vert,'faces',face,'facecolor','r');
view(3)
axis equal