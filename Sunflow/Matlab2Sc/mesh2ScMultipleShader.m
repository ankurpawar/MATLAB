function mesh2ScMultipleShader(vertices,faces,numberOfShader,shaderName,meshName,scFile)
%fuction to write vertices to sunflow mesh in sc file
%vertices,faces,numberOfShader,shaderName,meshName,scFile
numberOfVertices=length(vertices);
[numberOfFaces,mfaces]=size(faces);
%verticesStr=num2str(vertices);
facesStr=num2str(faces);



meshData1=strvcat('object {',...
                  ['  shaders ' num2str(numberOfShader)]);
              
[m,n]=size(meshData1);
for count=1:m                  
    fprintf(scFile,'%s\n',meshData1(count,:));
end

for count=1:numberOfShader                
    fprintf(scFile,'  %s\n',[shaderName num2str(count-1)]);
end

meshData2=strvcat('  type generic-mesh',...
                  ['  name ' meshName],...   
                  ['  points ' num2str(numberOfVertices)]);
[m,n]=size(meshData2);

for count=1:m                  
    fprintf(scFile,'%s\n',meshData2(count,:));
end

for count=1:numberOfVertices
    fprintf(scFile,'      %8.5f      %8.5f     %8.5f\n',vertices(count,:)); 
end

meshData3=['  triangles ' num2str(numberOfFaces)];

fprintf(scFile,'%s\n',meshData3);

for count=1:numberOfFaces
    fprintf(scFile,'      %s\n',facesStr(count,:)); 
end
%    fprintf(scFile,'      %s\n',facesStr); 

meshData3=strvcat('  normals none',...
                  '  uvs none');
[m,n]=size(meshData3);

for count=1:m                  
    fprintf(scFile,'%s\n',meshData3(count,:));
end

fprintf(scFile,'%s\n','face_shaders');
for count=1:numberOfShader                
    fprintf(scFile,'  %s\n',num2str(count-1));
end

fprintf(scFile,'}\n');

