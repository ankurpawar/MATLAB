function [v,new_faces]=patch2tripatch(v,f)
%
%converts quad patches to triangular patches
%
% [ newVertices , newFaces ] = patch2tripatch( vertices , faces )
%
% faces is matrix of dimension m by 4
% newFaces is a matrix of dimension n by 3
% where n = m * 2

[m,n]=size(f);
new_faces=zeros(m*2,3);
new_faces(1,:)=[f(1,1) f(1,2) f(1,3)];
for count=2:2:2*m-1
    count2=count/2; 
    new_faces(count,:)=[f(count2,3) f(count2,4) f(count2,1)]; 
    new_faces(count+1,:)=f(count2+1,1:3);
end
new_faces(2*m,:)=[f(count2+1,3) f(count2+1,4) f(count2+1,1)];
