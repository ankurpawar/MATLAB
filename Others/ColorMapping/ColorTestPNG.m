function ColorTestPNG
%color test
zval1 = [0 1 2 3];
zval2 = [1 2 3 4];
zval3 = [2 3 4 5];
%RGBY
cmap = [1 0 0;
    0 1 0;
    0 0 1;
    1 1 0];
colormap(cmap);

subplot(2,3,1);
image(zval1);
subplot(2,3,2);
image(zval2);
subplot(2,3,3);
image(zval3);

% Save data as indexed png
imwrite(zval1,cmap ,'imgtest1.png','png');
imwrite(zval2,cmap ,'imgtest2.png','png');
imwrite(zval3,cmap ,'imgtest3.png','png');
% Read png
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