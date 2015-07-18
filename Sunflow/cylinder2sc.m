%Cylinder for sunflow
[x,y,z] = cylinder(0.5,100);

%surf(x+0.5,y+0.5,z);

[cone,plate1,plate2] = Cone([0.5 0.5 0],[0.5 0.5 1],[0.5 0.5],[200],'r',1,1);

[conex]=get(cone,'xdata');
[coney]=get(cone,'ydata');
[conez]=get(cone,'zdata');
[coneFace,coneVert]=surf2patch(conex,coney,conez);


plate1x=get(plate1,'xdata');
plate1y=get(plate1,'ydata');
plate1z=get(plate1,'zdata');

[x2, y2] = poly2cw(plate1x,plate1y);
[plate1Face,v1]=poly2fv(x2,y2);
plate1Vert=[v1 zeros(length(v1),1)];


plate2x=get(plate2,'xdata');
plate2y=get(plate2,'ydata');
plate2z=get(plate2,'zdata');


[x2, y2] = poly2cw(plate2x,plate2y);
[plate2Face,v2]=poly2fv(x2,y2);
plate2Vert=[v2 1+zeros(length(v2),1)];

cylinderVert=[coneVert;...
    plate1Vert;...
    plate2Vert];

increVertLen=length(coneVert);
plateVertLen=length(plate1Vert);

[v2,coneFace]=patch2tripatch(coneVert,coneFace);

cylinderFace=[coneFace;...
    increVertLen+plate1Face;...
    increVertLen+plateVertLen+plate2Face];

cylVert=[coneVert;...
    plate1Vert;...
    plate2Vert];
cylinderVert=[cylVert(:,1) cylVert(:,3) cylVert(:,2)];
clf
patch('faces',cylinderFace,'vertices',cylinderVert,'facecolor','r')
axis([-2 2 -2 2 -2 2]);
view(3)
patch2OBJ(cylinderVert,cylinderFace,'unitCylinder')