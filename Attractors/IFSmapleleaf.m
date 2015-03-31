%xn+1 = a xn + b yn + e
%yn+1 = c xn + d yn + f

%The parameter table:
         %set 1     set 2     set 3     set 4  
a=[     0.1400    0.4300    0.4500    0.4900]; 
b=[     0.0100    0.5200   -0.4900    0.0000];
c=[     0.0000   -0.4500    0.4700    0.0000];
d=[     0.5100    0.5000    0.4700    0.5100];
e=[    -0.0800    1.4900   -1.6200    0.0200];
f=[    -1.3100   -0.7500   -0.7400    1.6200];

xres=1000;
yres=1000;
xn=1;
yn=1;
lim=1.05*[-3.4743  3.3331 -3.3286 3.3042];
x=linspace(lim(1),lim(2),xres);
y=linspace(lim(3),lim(4),yres);
xdiff=x(2)-x(1);
ydiff=y(2)-y(1);
minx=min(x);
miny=min(y);
img=zeros(yres,xres);
img2=zeros(yres,xres);
xmax=0;xmin=0;ymax=0;ymin=0;
xi=0;yi=0;
total=20000000;
for n=1:total
    ran=rand;   
    if ran>0.75
        xn = a(1)*xi+b(1)*yi  +e(1);
        yn = c(1)*xi+d(1)*yi  +f(1);
    elseif ran>0.5
        xn = a(2)*xi+b(2)*yi  +e(2);
        yn = c(2)*xi+d(2)*yi  +f(2);
    elseif ran>0.25
        xn = a(3)*xi+b(3)*yi  +e(3);
        yn = c(3)*xi+d(3)*yi  +f(3);
    else
        xn = a(4)*xi+b(4)*yi  +e(4);
        yn = c(4)*xi+d(4)*yi  +f(4);
    end
    xi=xn;
    yi=yn;
    xmax=max(xi,xmax);
    xmin=min(xi,xmin);
    ymax=max(yi,ymax);
    ymin=min(yi,ymin);
    indx=floor((xi-minx)/xdiff);
    indy=floor((yi-miny)/ydiff);
    img(indy,indx)=img(indy,indx)+1;
end
maximg=log(max(max(img)));
for n=1:xres*yres
    xn=img(n);
    if xn>0
      img2(n)=128*log(xn)/maximg;
    end
end
image(flipud(img2));
cmap=colormap(flipud(gray(128)));
