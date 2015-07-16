function surf2OBJ(x,y,z,fileName)
%
%Write matlab surface to a triangular .obj file.
%The output .obj file contains only vertices 
%and triangular faces.
%surf2OBJ(x,y,z,filename)
%x,y,z : matrix each of same size
%
%filename : a string.No need to add .obj at the end 
%of filename because the code will append it itself.
%
%example 1:
%[X,Y,Z] = peaks(30);
%surf2OBJ(X,Y,Z,'peaks');
%
%example 2:
%[x,y,z]=sphere(50);
%surf2OBJ(x,y,z,'sphere');

fileOBJ=fopen([fileName '.obj'],'w');

[vertices,faces]=surf2tripatch(x,y,z);

[mVertices,nVertices]=size(vertices);

[mFaces,nFaces]=size(faces);

fprintf(fileOBJ,'v  %g  %g  %g\n',vertices');

fprintf(fileOBJ,'f  %d  %d  %d\n',faces');
  
fclose(fileOBJ);