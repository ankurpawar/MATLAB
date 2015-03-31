%IFS spiral2
%xn+1 = a xn + b yn + e
%yn+1 = c xn + d yn + f

             a =[0.787879   -0.121212     0.181818];
             b =[-0.424242    0.257576    -0.136364];
             c =[0.242424    0.151515     0.090909];
             d =[0.859848    0.053030     0.181818];
             e =[1.758647   -6.721654     6.086107];
             f =[1.408065    1.377236     1.568035];
             p=[  0.90    0.05     0.05];
   
   
xn=1;
yn=1;
x=linspace(-8,8,1000);
y=linspace(-0.1,10,1000);
xdiff=x(2)-x(1);
ydiff=y(2)-y(1);
minx=min(x);
miny=min(y);
img=zeros(1000,1000,3);
xmax=0;xmin=0;ymax=0;ymin=0;
xi=0;yi=0;
total=55000;
for n=1:total
    ran=rand;
    if ran<0.9
        xn = a(1) *xi + b(1) *yi + e(1);
        yn = c(1) *xi + d(1) *yi + f(1);
    elseif ran<0.5
        xn = a(2) *xi + b(2) *yi + e(2);
        yn = c(2) *xi + d(2) *yi + f(2);
    else   
        xn = a(3) *xi + b(3) *yi + e(3);
        yn = c(3) *xi + d(3) *yi + f(3);
    end
    aa=mod(xn,1);
           s=1;
           v=1;
           zo = floor(6*aa); 
           rough = (zo); 
           ff = aa*6 - zo;
           pp = v*(1-s);
           q = v*(1-s*ff);
           t = v*(1-s*(1-ff));
 
           switch (rough)    
          case 0 
                r=v; g=t; bb=pp;
          case 1 
                r=q; g=v; bb=pp;
          case 2 
                r=pp; g=v; bb=t;
          case 3 
                r=pp; g=q; bb=v;
          case 4 
                r=t; g=pp; bb=v;
          case 5 
                r=v; g=pp; bb=q;
          end             
    
    xi=xn;
    yi=yn;
    xmax=max(xi,xmax);
    xmin=min(xi,xmin);
    ymax=max(yi,ymax);
    ymin=min(yi,ymin);
    indx=floor((xi-minx)/xdiff);
    indy=floor((yi-miny)/ydiff);
    img(indx,indy,1)=img(indx,indy,1)+r;
    img(indx,indy,2)=img(indx,indy,2)+g;
    img(indx,indy,3)=img(indx,indy,3)+bb;
end

image(uint8(img));

%imwrite(img,cmap,'IFSdragon.png','png');