%tetrahedron
vert=[+1 +1 +1
    -1 -1 +1
    -1 +1 -1
    +1 -1 -1];
face=[1 2 3
    2 3 4
    1 3 4
    1 2 4];
getEdges(face)
colors=jet(4);
h=patch('faces',face,'vertices',vert);
set(h,'facecolor','flat','facevertexcdata',colors);
axis equal
view(3)