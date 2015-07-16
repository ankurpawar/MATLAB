function mesh2textureScFile(vertices,faces,u,v,shader,meshName,scFile)
%fuction to write vertices to sunflow mesh in sc file
%vertices,faces,u,v,shader,meshName,scFile
numberOfVertices=length(vertices);
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

meshData3=strvcat('  normals none',...
                  '  uvs facevarying');
[row,col]=size(meshData3);

for n=1:row
    fprintf(scFile,'%s\n',meshData3(n,:));
end

[rowu,colu]=size(u);
for n=1:rowu
    fprintf(scFile,'  %g %g  %g %g  %g %g\n',u(n,1),v(n,1),u(n,2),v(n,2),u(n,3),v(n,3));
end


fprintf(scFile,'\n } \n');
