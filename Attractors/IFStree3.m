%IFStree3
% xn+1 = a xn + b yn + e
% yn+1 = c xn + d yn + f


a=[ 0.0500   -0.0500    0.0300   -0.0300    0.5600    0.1900   -0.3300 ];
b=[ 0.0000    0.0000   -0.1400    0.1400    0.4400    0.0700   -0.3400 ];
c=[ 0.0000    0.0000    0.0000    0.0000   -0.3700   -0.1000   -0.3300 ];
d=[ 0.4000   -0.4000    0.2600   -0.2600    0.5100    0.1500    0.3400 ];
e=[-0.0600   -0.0600   -0.1600   -0.1600    0.3000   -0.2000   -0.5400 ];
f=[-0.4700   -0.4700   -0.0100   -0.0100    0.1500    0.2800    0.3900 ];
    
xn=1;
yn=1;
x=linspace(-0.98,0.99,1000);
y=linspace(-0.85,0.91,1000);
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
    if ran>0.8571
        xn = a(1)*xi+b(1)*yi  +e(1);
        yn = c(1)*xi+d(1)*yi  +f(1);
    elseif ran>0.7143
        xn = a(2)*xi+b(2)*yi  +e(2);
        yn = c(2)*xi+d(2)*yi  +f(2);
    elseif ran>0.5714  
        xn = a(3)*xi+b(3)*yi  +e(3);
        yn = c(3)*xi+d(3)*yi  +f(3);
    elseif ran>0.4286
        xn = a(4)*xi+b(4)*yi  +e(4);
        yn = c(4)*xi+d(4)*yi  +f(4);
    elseif ran>0.2857
        xn = a(5)*xi+b(5)*yi  +e(5);
        yn = c(5)*xi+d(5)*yi  +f(5);
    elseif ran>0.1429
        xn = a(6)*xi+b(6)*yi  +e(6);
        yn = c(6)*xi+d(6)*yi  +f(6);
    else
        xn = a(7)*xi+b(7)*yi  +e(7);
        yn = c(7)*xi+d(7)*yi  +f(7);
    end
    xi=xn;
    yi=yn;
    xmax=max(xi,xmax);
    xmin=min(xi,xmin);
    ymax=max(yi,ymax);
    ymin=min(yi,ymin);
    indx=floor((xi-minx)/xdiff);
    indy=floor((yi-miny)/ydiff);
    img(indx,indy)=img(indx,indy)+70;
end
img=img';
img=flipud(img);
img=log(eps+img);
image(img);
cmap=colormap(flipud(gray(10)));
%imwrite(img,cmap,'IFStree3.png','png');