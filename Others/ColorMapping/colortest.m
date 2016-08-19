function colortest
%color test
zval1=[0 1 2 3];
zval2=[1 2 3 4];
zval3=[2 3 4 5];
cLimMax = 4;
cmap = summer(cLimMax);

figure; 
colormap(cmap);
subplot(2,3,1);
image(zval1);

subplot(2,3,2);
image(zval2);

subplot(2,3,3);
image(zval3);

%imgNew1 = scaleImage(zval1, cLimMax);
imwrite(zval1,cmap ,'imgtest1.png','png');

%imgNew2 = scaleImage(zval2, cLimMax);
imwrite(zval2,cmap ,'imgtest2.png','png');

%imgNew3 = scaleImage(zval3, cLimMax);
imwrite(zval3,cmap ,'imgtest3.png','png');

[img1, imap1] = imread('imgtest1.png');
[img2, imap2] = imread('imgtest2.png');
[img3, imap3] = imread('imgtest3.png');

subplot(2,3,4);
colormap(imap1);
image(img1);

subplot(2,3,5);
colormap(imap2);
image(img2);

subplot(2,3,6);
colormap(imap3);
image(img3);

end

function imgNew = scaleImage(img, cLimMax)
minImg = min(img(:));
img = img - minImg;
maxImg = max(img(:));
img = img / maxImg;
imgNew = uint8(img*(cLimMax-1));
end