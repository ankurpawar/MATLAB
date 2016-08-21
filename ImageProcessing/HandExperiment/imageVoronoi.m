%Read image from file
I = imread('hand1.png');
image(I)
figure
%Convert to grayscale image
I=rgb2gray(I);
%Quadtree decomposition
S = qtdecomp(I,.5,2);
blocks = repmat(uint8(0),size(S));
%imwrite(I,gray(256),'avrilbw1.png');
pointImg=zeros(size(blocks));

for dim = [512 256 128 64 32 16 8 4 2 1];    
    numblocks = length(find(S==dim));    
    if (numblocks > 0)        
       values = repmat(uint8(1),[dim dim numblocks]);
       values(2:dim,2:dim,:) = 0;
       blocks = qtsetblk(blocks,S,dim,values);
    end
end

[i,j,s] = find(S);
for k = 1:length(i)
    row=i(k);
    col=j(k);
    val=s(k);
    if val>0
       pointImg(row+val/2,col+val/2) = 255;
    end
end

imshow(blocks,[])
imwrite(blocks,gray(256),'block_1.png');
figure
imshow(pointImg,[])
imwrite(pointImg,gray(256),'pointBlock.png');
 
[row,col]=find(pointImg);
 
TRI = delaunay(col,512-row);
triplot(TRI,col,512-row);
figure
[vx, vy]=voronoi(col,512-row);
plot(vx,vy);
axis equal
axis([-50 600 -50 600])