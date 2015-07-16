function patch2PLY(vertices,faces,fileName)
filePLY=fopen([fileName '.ply'],'w');

[mVertices,nVertices]=size(vertices);

[mFaces,nFaces]=size(faces);

headerData=strvcat('ply',...
                   'format ascii 1.0',...
                   'comment created by MATLAB',...
                   ['element vertex ' num2str(mVertices,'%d ')],...
                   'property float32 x',...
                   'property float32 y',...
                   'property float32 z',...
                   ['element face ' num2str(mFaces,'%d ')],...
                   'property list uint8 int32 vertex_indices',...
                   'end_header');

%[m,n]=size(headerData);

for n=1:10                  
    fprintf(filePLY,'%s \n',headerData(n,:));
end
               
%for n=1:mVertices
   fprintf(filePLY,'%g  %g  %g\n',vertices');;
%end

% formatString=' ';
% for n=1:(nFaces+1)
%   formatString=[formatString '%d '];
% end
% formatString=[formatString '\n'];

%for n=1:mFaces
ind=ones(1,mFaces);
   fprintf(filePLY,'%d %d %d %d\n',[nFaces(ind,1) faces]');
%end

fclose(filePLY);



