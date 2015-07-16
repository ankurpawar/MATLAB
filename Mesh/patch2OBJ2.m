function patch2OBJ2(vertices,faces,fileName)

fileOBJ=fopen([fileName '.obj'],'w');



[mVertices,nVertices]=size(vertices);

[facesLength]=length(faces);

for count=1:mVertices
   fprintf(fileOBJ,'v  %g   %g   %g\n',vertices(count,:));
end

fprintf(fileOBJ,'f  ');
for count=1:facesLength
   fprintf(fileOBJ,'%d ',faces(count));
end

fclose(fileOBJ);