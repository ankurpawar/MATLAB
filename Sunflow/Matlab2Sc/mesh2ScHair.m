function mesh2ScHair(x,y,z,ScFile)

[faces,vertices,cmap]=surf2patch(x,y,z);
faces=faces';
[m,n]=size(faces);
points=zeros(m*n,3);
for count=1:m*n
   points(count,:)=vertices(faces(count),:);
end
line(points(:,1),points(:,2),points(:,3));
%points2ScHair(points,ScFile);

