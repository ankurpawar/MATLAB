function patch2POVtriangle(vert,faces,filename)
%patch2POVtriangle(vertices,faces)
%vertices is n-by-3 array
%faces is m-by-3 array

txtFile=fopen([filename '.txt'],'w');

fprintf(txtFile,'union { \n');

%fprintf(txtFile,'   triangle{ < %g,%g,%g > , < %g,%g,%g > , < %g,%g,%g > }\n',vert(faces(:,1),:)',vert(faces(:,2),:)',vert(faces(:,3),:)');
fprintf(txtFile,'   triangle{ < %g,%g,%g > , < %g,%g,%g > , < %g,%g,%g > }\n',vert(faces',:)');

fprintf(txtFile,'} \n');
fclose(txtFile);
return