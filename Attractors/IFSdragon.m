%IFS dragon
xn=1;
yn=1;
x=linspace(-8,8,1000);
y=linspace(-2,12,1000);
xdiff=x(2)-x(1);
ydiff=y(2)-y(1);
minx=min(x);
miny=min(y);
img=zeros(1000,1000);
a1=     0.824074;   a2=0.088272;
b1 =    0.281428;   b2= 0.520988;
c1=    -0.212346;   c2=-0.463889;
d1=     0.864198;   d2=-0.377778;
e1=    -1.882290;   e2= 0.785360;
f1=    -0.110607;   f2= 8.095795;
p=[0.2 0.8];
xi=0;yi=0;
total=3000000;
for n=1:total
    ran=rand;
    if ran<0.8
        xn = a1 *xi + b1 *yi + e1;
        yn = c1 *xi + d1 *yi + f1;
    else 
        xn = a2 *xi + b2 *yi + e2;
        yn = c2 *xi + d2 *yi + f2;
    end
    xi=xn;
    yi=yn;
    indx=floor((xi-minx)/xdiff);
    indy=floor((yi-miny)/ydiff);
    img(indx,indy)=img(indx,indy)+2;
end

image(img);
cmap=colormap(flipud(gray(220)));
%imwrite(img,cmap,'IFSdragon.png','png');