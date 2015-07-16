function [v,new_faces]=patch2tripatch2(v,f)
%
%converts quad patches to trianglular patches
%
% [ newVertices , newFaces ] = patch2tripatch2( vertices , faces )
%
% faces is matrix of dimension m by 4
% newFaces is a matrix of dimension n by 3
% where n = m * 2

[m,n]=size(f);
new_faces=zeros(m*2,3);

rowSeq1=1:2:m*2-1;
rowSeq2=2:2:m*2;
row=1:m;

%for row=1:m
%    new_faces(rowSeq1(row),:)=f(row,[1 2 3]); 
%    new_faces(rowSeq2(row),:)=f(row,[1 3 4]);
%end

new_faces(rowSeq1(:),:)=f(row(:),[1 2 3]); 
new_faces(rowSeq2(:),:)=f(row(:),[1 3 4]);
