%IFS tree
%xn+1 = r cos(theta) xn - s sin(phi) yn + e
%yn+1 = r sin(theta) xn + s cos(phi) yn + f



    r=[     0.0500    0.0500    0.6000    0.5000    0.5000    0.5500 ];
    s=[     0.6000   -0.5000    0.5000    0.4500    0.5500    0.4000 ];
theta=[     0.0000    0.0000    0.6980    0.3490   -0.5240   -0.6980 ];
  phi=[     0.0000    0.0000    0.6980    0.3492   -0.5240   -0.6980 ];
    e=[     0.0000    0.0000    0.0000    0.0000    0.0000    0.0000 ];
    f=[     0.0000    1.0000    0.6000    1.1000    1.0000    0.7000 ];
    
    
xn=1;
yn=1;
maxcount=0;
xres=1000;yres=1000;
x=linspace(-1,1,xres);
y=linspace(-0.1,2.2,yres);
xdiff=x(2)-x(1);
ydiff=y(2)-y(1);
minx=min(x);
miny=min(y);
img=zeros(xres,yres);
xmax=0;xmin=0;ymax=0;ymin=0;
xi=0;yi=0;
total=10000000;
for n=1:total
    ran=rand;   
    if ran>0.8333
        xn = r(1)* cos(theta(1))* xi - s(1)* sin(phi(1))* yi + e(1);
        yn = r(1)* sin(theta(1))* xi + s(1)* cos(phi(1))* yi + f(1);
    elseif ran>0.667
        xn = r(2)* cos(theta(2))* xi - s(2)* sin(phi(2))* yi + e(2);
        yn = r(2)* sin(theta(2))* xi + s(2)* cos(phi(2))* yi + f(2);
    elseif ran>0.5  
        xn = r(3)* cos(theta(3))* xi - s(3)* sin(phi(3))* yi + e(3);
        yn = r(3)* sin(theta(3))* xi + s(3)* cos(phi(3))* yi + f(3);
    elseif ran>0.333
        xn = r(4)* cos(theta(4))* xi - s(4)* sin(phi(4))* yi + e(4);
        yn = r(4)* sin(theta(4))* xi + s(4)* cos(phi(4))* yi + f(4);
    elseif ran>0.1667
        xn = r(5)* cos(theta(5))* xi - s(5)* sin(phi(5))* yi + e(5);
        yn = r(5)* sin(theta(5))* xi + s(5)* cos(phi(5))* yi + f(5);
    else
        xn = r(6)* cos(theta(6))* xi - s(6)* sin(phi(6))* yi + e(6);
        yn = r(6)* sin(theta(6))* xi + s(6)* cos(phi(6))* yi + f(6);    
    end
    xi=xn;
    yi=yn;
    xmax=max(xi,xmax);
    xmin=min(xi,xmin);
    ymax=max(yi,ymax);
    ymin=min(yi,ymin);
    indx=floor((xi-minx)/xdiff);
    indy=floor((yi-miny)/ydiff);
    img(indx,indy)=img(indx,indy)+1;
    maxcount=max(maxcount,img(indx,indy));
end
maxcount=log(maxcount);
for n=xres*yres
   if img(n)>0 
    img(n)=128*log(img(n))/maxcount;
   end
end
img=img';
img=flipud(img);

image(img);
cmap=colormap(flipud(gray(128)));
%imwrite(img,cmap,'IFStree.png','png');