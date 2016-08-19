function ColorTestSimple
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

subplot(2,3,4);
imagesc(zval1);
subplot(2,3,5);
imagesc(zval2);
subplot(2,3,6);
imagesc(zval3);
end