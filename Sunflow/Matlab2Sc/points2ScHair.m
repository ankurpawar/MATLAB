function points2ScHair(points,ScFile)
%points2ScHair(points,ScFile) ,points m x 3,ScFile file Id
[row,col]=size(points);
hairData=strvcat('object {',...
                  ['  shader shaderHair'],...
                   '  type hair',...
                  ['  segments ' num2str(row-1)],...   
                  ['  width ' num2str(0.03)],...   
                  ['  points ' num2str(row*col)]);
for count=1:6              
    fprintf(ScFile,'%s\n',hairData(count,:));
end

for n=1:row
    fprintf(ScFile,'%g %g %g ',points(n,:));
end
fprintf(ScFile,'\n%c \n','}');