%cube
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
edge=getEdges(face);
for n=1:length(edge)
    %line(vert(edge(n,:),1),vert(edge(n,:),2),vert(edge(n,:),3));
end
patch('faces',face,'vertices',vert,'facecolor','r');
axis off
axis equal
view(3)