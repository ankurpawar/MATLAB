%octahedron
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
getEdges(face)
colors=summer(length(face));
h=patch('faces',face,'vertices',vert,'facecolor','r');
%set(h,'facecolor','flat','facevertexcdata',colors);
axis equal
view(3)
