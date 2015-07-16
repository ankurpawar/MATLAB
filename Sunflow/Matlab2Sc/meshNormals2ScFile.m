function meshNormals2ScFile(vertices,faces,normals,shader,meshName,scFile)
%meshNormals2ScFile(vertices,faces,normals,shader,meshName,scFile)
%fuction to write vertices to sunflow mesh in sc file
%vertices,faces,fid is file ID,shader 
[numberOfVertices,dim]=size(vertices);
[numberOfFaces,mfaces]=size(faces);


meshData1=strvcat('object {',...
                  ['  shader ' shader],...
                   '  type generic-mesh',...
                  ['  name ' meshName],...   
                  ['  points ' num2str(numberOfVertices)]);
[row,col]=size(meshData1);

for n=1:row                  
    fprintf(scFile,'%s\n',meshData1(n,:));
end

for n=1:numberOfVertices
    fprintf(scFile,'    %g   %g   %g\n',vertices(n,:)); 
end

meshData2=['  triangles ' num2str(numberOfFaces)];
fprintf(scFile,'%s\n',meshData2);

for n=1:numberOfFaces
    fprintf(scFile,'  %d  %d  %d\n',faces(n,:)); 
end
%    fprintf(scFile,'      %s\n',facesStr); 

%normals for mesh
fprintf(scFile,'  normals vertex');

for n=1:numberOfVertices
    fprintf(scFile,'    %g   %g   %g\n',normals(n,:)); 
end


fprintf(scFile,'  uvs none\n}\n');
fprintf(scFile,'\n');
