%Haferman Carpet

a0=uint8([1 1 1;1 1 1;1 1 1]);
b0=uint8([0 1 0;1 0 1;0 1 0]);
for n=1:5
    an=1+[b0 b0 b0;b0 b0 b0;b0 b0 b0];
    b0=[a0 b0 a0;b0 a0 b0;a0 b0 a0];
    a0=an;
end
imagesc(b0),colormap(bone(4));
%imwrite(b0,bone(4),'haferman2.png','png'); %save coloured image
%imwrite(b0,'haferman1.png','bitdepth',1);  %save binary image
