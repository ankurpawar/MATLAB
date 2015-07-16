function patch2stl(faces,vertices,filename)
%not complete
stlFile=fopen([filename '.stl'],'w');

[vrow,vcol]=size(vertices);
faceLen=length(faces);
for n=1:80
    fprintf(stlFile,'1');
end

fwrite(stlfile,vrow,'uint8');


for n=1:faceLen
   fwrite(stlFile,[0.1 0.1 0.1],'float');%write for normal 
   faceIndex=faces(n);
   
   fwrite(stlFile,vertices(faceindex,:),'float');
   
   fwrite(stlFile,2,'short');
end

fclose(stlFile);