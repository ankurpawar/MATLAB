function patch2OBJ(vertices,faces,fileName)
%
%Writes matlab triangular or quad patch to .obj file 
%patch2OBJ(vertices,faces,filename)
%vertices: must be a m-by-3 array
%faces : can be a m-by-3 or m-by-4 array
%If faces is m-by-3 array then patch is triangular
%it means 3 vertices will make a face.
%If faces is m-by-4 array then patch is quad
%it means 4 vertices will make a face.
%filename : a string .No need to add .obj at the end 
%of filename because the code will append it itself.
%
%example 1 sphere.obj:
%[x,y,z]=sphere(50);
%[face,vert,c]=surf2patch(x,y,z);
%patch2OBJ(vert,face,'sphere');
%
%example 2 icosahedron.obj:
%phi=(1+sqrt(5))/2; %golden ratio
%vert=[0 1 phi;
%      0 1 -phi;
%      0 -1 phi;
%      0 -1 -phi;
%      1 phi 0;
%      1 -phi 0;
%     -1 phi 0;
%     -1 -phi 0;
%      phi 0 1;
%      phi 0 -1;
%     -phi 0 1;
%     -phi 0 -1];
%face=convhulln(vert,{'Qt'});
%patch2OBJ(vert,face,'icosa');

fileOBJ=fopen([fileName '.obj'],'w');

[mVertices,nVertices]=size(vertices);

[mFaces,nFaces]=size(faces);

fprintf(fileOBJ,'v  %g  %g  %g\n',vertices');

if nFaces==3
       fprintf(fileOBJ,'f  %d  %d  %d\n',faces');
elseif nFaces==4
       fprintf(fileOBJ,'f  %d  %d  %d  %d\n',faces');
end  

fclose(fileOBJ);