function meshlight2ScFile(vertices,faces,lightName,emitColor,radiance,scFile)
%fuction to write vertices to sunflow mesh in sc file
%vertices,faces,fid is file ID,shader 
numberOfVertices=length(vertices);
numberOfFaces=length(faces);
%verticesStr=num2str(vertices);
facesStr=num2str(faces);



meshLightData1=strvcat('light {',...
                       '  type meshlight' ,...
                      ['  name ' lightName]);
[m,n]=size(meshLightData1);

for count=1:m                  
    fprintf(scFile,'%s\n',meshLightData1(count,:));
end

fprintf(scFile,'  emit %s\n',num2str(emitColor));
fprintf(scFile,'  radiance %s\n',num2str(radiance));
fprintf(scFile,'  samples 16\n');
fprintf(scFile,['  points ' num2str(numberOfVertices) '\n']);
for count=1:numberOfVertices
    fprintf(scFile,'      %8.5f      %8.5f     %8.5f\n',vertices(count,:)); 
end

meshLightData2=['  triangles ' num2str(numberOfFaces)];
fprintf(scFile,'%s\n',meshLightData2);

for count=1:numberOfFaces
    fprintf(scFile,'      %s\n',facesStr(count,:)); 
end

fprintf(scFile,'} \n');



