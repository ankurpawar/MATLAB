x = linspace(-2*pi,2*pi,200);
y = x;
[X,Y] = meshgrid(x,y);
Z = cos(X.^2+Y.^2);
nColor = 256; %number of colors
cmap = gray(nColor);
colormap(cmap);
imagesc(Z);
imwrite(Z,cmap,'unscaled.png');

%Do scaling of data then save image
% scale Z from 0 to 1
Z2 = (Z - min(Z(:)));
Z2 = Z2./max(Z2(:));

%Scale Z2 from 0 to 255
Z2 = uint8((nColor-1)*Z2);
%Save scaled image
imwrite(Z2,cmap,'scaled.png');