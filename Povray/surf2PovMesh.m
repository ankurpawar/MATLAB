function surf2PovMesh(x,y,z,filename,meshname)
%function to export matlab surface to PovRay mesh
%syntax: surf2PovMesh(x,y,z,filename,meshname);
%x,y,z must be of same size
%filename is a string,which is the name of file with .pov or .inc extension
%meshname is a string,which is the name of mesh  
%example 1 : [x y z] = sphere;
%            surf2PovMesh(x,y,z,'sphere.pov','sphere');   
%        
%example 2 :[x y z] = sphere;
%           surf2PovMesh(x,y,z,'sphere.inc','sphere');   
%POV-Ray takes .pov as well as .inc file for rendering mesh
%
%When .pov file is used complete scene information is written
%in that file.So if mesh is saved in .pov file then scene must be
%described in the same file.
%example: surf2PovMesh(x,y,z,'peaks.pov','peakMesh');
%then describe complete scene in peak.pov file.
%
%When mesh file is saved with .inc extension then
%it can be used in many scenes.We have to declare #include
%directive to use that file 
%example : surf2PovMesh(x,y,z,'peaks.inc','peakMesh');
%#include "peaks.inc" directive will include that mesh in
%scene.
%
%To render the mesh in POV-Ray write the commands with any type
%of settings.
%object{
%    peakMesh
%    finish{...}
%    pigment{...} 
%}

povFile=fopen(filename,'w');

fprintf(povFile,['#declare ' meshname '=\nmesh2{\n' ]);

fprintf(povFile,'  vertex_vectors{\n');

[vertices,faces]=surf2tripatch(x,y,z);

%write vertices to file
[rowVertices,colVertices]=size(vertices);
fprintf(povFile,'    %d\n',rowVertices);
fprintf(povFile,'    <%g,%g,%g>,\n',vertices(1:rowVertices-1,:)');
fprintf(povFile,'    <%g,%g,%g>\n',vertices(rowVertices,:));
fprintf(povFile,'  }\n',rowVertices);

%write faces to file
faces=faces-1;%povray face start with zero index
fprintf(povFile,'  face_indices{\n');

[rowFaces,colFaces]=size(faces);
fprintf(povFile,'    %d',rowFaces);
fprintf(povFile,',\n    <%d,%d,%d>',faces(1:rowFaces-1,:)'); 
fprintf(povFile,',\n    <%d,%d,%d>',faces(rowFaces,:)); 
fprintf(povFile,'\n  }\n',rowVertices);

fprintf(povFile,'}');
fclose(povFile);
%close file

function [v,new_faces]=surf2tripatch(x,y,z)
[f,v,c] = surf2patch(x,y,z,z);
[m,n]=size(f);
new_faces=zeros(m*2,3);
new_faces(1,:)=[f(1,1) f(1,2) f(1,3)];
for count=2:2:2*m-1
    count2=count/2; 
    new_faces(count,:)=[f(count2,3) f(count2,4) f(count2,1)]; 
    new_faces(count+1,:)=f(count2+1,1:3);
end
new_faces(2*m,:)=[f(count2+1,3) f(count2+1,4) f(count2+1,1)];

