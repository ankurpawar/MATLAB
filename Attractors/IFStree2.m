%IFStree2
% xn+1 = a xn + b yn + e
% yn+1 = c xn + d yn + f


 a=[     0.0100   -0.0100    0.4200    0.4200 ];
 b=[     0.0000    0.0000   -0.4200    0.4200 ];
 c=[     0.0000    0.0000    0.4200   -0.4200 ];
 d=[     0.4500   -0.4500    0.4200    0.4200 ];
 e=[     0.0000    0.0000    0.0000    0.0000 ];
 f=[     0.0000    0.4000    0.4000    0.4000 ];
    
    xn=1;
yn=1;
x=linspace(-0.5,0.5,1000);
y=linspace(-0.1,0.9,1000);
xdiff=x(2)-x(1);
ydiff=y(2)-y(1);
minx=min(x);
miny=min(y);
img=zeros(1000,1000);
xmax=0;xmin=0;ymax=0;ymin=0;
xi=0;yi=0;
total=5000000;
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
    img(indx,indy)=img(indx,indy)+50;
end
img=img';
img=flipud(img);
img=log(1+img);
image(img);
cmap=colormap(flipud(gray(10)));
%imwrite(img,cmap,'IFStree2.png','png');