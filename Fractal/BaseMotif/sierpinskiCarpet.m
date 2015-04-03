%Sierpinski Carpet
colored=1;

if colored
    b0=uint8([1 1 1;1 0 1;1 1 1]);
    for n=1:5
        x=zeros(3^n,'uint8');
        b0=1+[b0 b0 b0;b0 x b0;b0 b0 b0];
    end
    colors=pink(6);
    imagesc(b0),colormap(colors);
    imwrite(b0-1,colors,'sierpinski2.png','png');
else
    b0=logical([1 1 1;1 0 1;1 1 1]);
    for n=1:5
        x=logical(zeros(3^n));
        b0=[b0 b0 b0;b0 x b0;b0 b0 b0];
    end
    imagesc(b0),colormap(gray(2));
    %imwrite(bn,'sierpinski1.png','png','bitdepth',1);
end