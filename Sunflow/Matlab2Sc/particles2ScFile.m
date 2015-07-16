function particles2ScFile(particles,shaderName,filename,ScFile)
% particles2ScFile(particles,shaderName,filename,ScFile) 
% particles : array of m x 3
% shaderName : string to represent shader
% filename : name of file where the particle coordinates
%will be written (file is big endian)
% ScFile : file handle of sunflow file  
fid=fopen([filename '.dat'],'w','b');
[row,col]=size(particles);

ShaderString=strvcat('object {',...
                  ['  shader ' shaderName],...
                   '  type particles',...
                  ['  filename ' filename '.dat'],...   
                  ['  radius ' num2str(0.1)]);
for n=1:5              
    fprintf(ScFile,'%s\n',ShaderString(n,:));
end
fprintf(ScFile,'%c\n\n','}');
for n=1:row
    fwrite(fid,particles(n,1),'float32');
    fwrite(fid,particles(n,2),'float32');
    fwrite(fid,particles(n,3),'float32');
end
fclose(fid);

