%Quad tree decomposition of image
I = imread('hand1.png');
I = rgb2gray(I);
S = qtdecomp(I,.5,1);
blocks = repmat(uint8(0),size(S));


for dim = [512 256 128 64 32 16 8 4 2 1];
    numblocks = length(find(S==dim));
    if (numblocks > 0)
        values = repmat(uint8(1),[dim dim numblocks]);
        values(2:dim,2:dim,:) = 256-dim;
        blocks = qtsetblk(blocks,S,dim,values);
    end
end

imshow(blocks,bone(256));
imwrite(blocks,copper(256),'block_2.png');
