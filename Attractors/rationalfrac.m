%rational fractal
%original code by Paul Bourke
%Translated in MATLAB
NX= 1000;
NY= 1000;
N= 10000000;
SCALE= (NX * 1.1);
img=zeros(NX,NY);
indx=0;
indy=0;
x=1;y=1;

for n=1:N
    a = mod(floor(3.5*rand),3);
    if (a == 0)
        x1 = sin(1 / (x+1)) / (x+1);
        y1 = y / (y+1);
    elseif (a == 1)
        x1 = x / 2;
        y1 = y / 2;
    else
        x1 = x / (x+1);
        y1 = sin(1 / (y+1)) / (y+1);
    end
    x = x1;
    y = y1;
    if (n < 100)
        continue;
    end
    ix = x * SCALE + 10;
    iy = y * SCALE + 10;
    indx=floor(ix);
    indy=floor(iy);
    img(indx,indy)=img(indx,indy)+1.5;
end

image(img);
cmap=colormap(flipud(pink(156)));
%imwrite(img,cmap,'rationalfractal.png','png');