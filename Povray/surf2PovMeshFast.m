function surf2PovMeshFast(x,y,z,Nx,Ny,Nz,filename,meshname)
%Matlab PovRay mesh
%mesh2PovMesh(vertices,faces,filename)

povFile=fopen([filename],'w');

fprintf(povFile,['#declare ' meshname '=\nmesh2{\n' ]);

%write vertices to file
fprintf(povFile,'  vertex_vectors{\n');

[vertices,faces]=surf2tripatch(x,y,z);

[rowVertices,colVertices]=size(vertices);
fprintf(povFile,'    %d\n',rowVertices);

%fprintf(povFile,'    <%-12.6f,%-12.6f,%-12.6f>,\n',vertices');
fprintf(povFile,'    <%g,%g,%g>,\n',vertices(1:rowVertices-1,:)');
fprintf(povFile,'    <%g,%g,%g>\n',vertices(rowVertices,:));

fprintf(povFile,'  }\n');

%write vertex normals
[vNormals,f]=surf2tripatch(Nx,Ny,Nz);
[rowNormals,colNormals]=size(vNormals);
clear f
fprintf(povFile,'  normal_vectors {\n');

fprintf(povFile,'    %d\n',rowNormals);

fprintf(povFile,'    <%g,%g,%g>,\n',vNormals(1:rowNormals-1,:)');
fprintf(povFile,'    <%g,%g,%g>\n',vNormals(rowNormals,:));

fprintf(povFile,'  }\n');



%Write Faces to file
faces=faces-1;
fprintf(povFile,'  face_indices{\n');

[rowFaces,colFaces]=size(faces);
fprintf(povFile,'    %d',rowFaces);
%for n=1:rowFaces
    %fprintf(povFile,',\n    <%d,%d,%d>',faces(n,:)); 
%end

fprintf(povFile,',\n    <%d,%d,%d>',faces(1:rowFaces-1,:)'); 
fprintf(povFile,',\n    <%d,%d,%d>',faces(rowFaces,:)); 

fprintf(povFile,'\n  }\n',rowVertices);

fprintf(povFile,'}');

fclose(povFile);