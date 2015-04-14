%Peter de Jong
% xn+1 = d sin(a xn) - sin(b yn)
% yn+1 = c cos(a xn) + cos(b yn)
% runtime about 15 seconds
%a single ring 
%The equation and coefficients a,b,c,d are taken from Paul Bourke website
%
xres =1000;
yres =1000;
N =22000000;  %number of iterations

%minimum and maximum value of x and y are already calculated
xmin=-7.7;xmax=7.7;ymin=-2.6;ymax=2.6;
maxdist=13.5;
img=zeros(xres,yres,3);
xdiff=((xmax)-(xmin))/xres;
ydiff=((ymax)-(ymin))/yres;
minx=xmin;
miny=ymin;



xn=1;
yn=1;
x=0;
y=0;
aa=0;bb=0;r=0;g=0;
a=1.4; b=1.56;c=1.4;d=-6.56;  %coefficients
dist=0;maxd=0;
tic
for nn=1:1
    for n=1:N

        xn =(d*sin(a* x) - sin(b* y));
        yn =(c*cos(a* x) + cos(b*y));
        dist=sqrt((xn-x)^2+(yn-y)^2);
        %maxd=max(dist,maxd);
        %s=atan2(yn-y,xn-x)/(2*pi);
        x=xn;
        y=yn;
        aa=dist/maxdist;
               s=1;
               v=1;
               zo = floor(6*aa); 
               rough = (zo); 
               f = aa*6 - zo;
               p = v*(1-s);
               q = v*(1-s*f);
               t = v*(1-s*(1-f));

               switch (rough)    
              case 0 
                    r=v; g=t; bb=p;
              case 1 
                    r=q; g=v; bb=p;
              case 2 
                    r=p; g=v; bb=t;
              case 3 
                    r=p; g=q; bb=v;
              case 4 
                    r=t; g=p; bb=v;
              case 5 
                    r=v; g=p; bb=q;
              end             
        indx=floor((x-minx)/xdiff);
        indy=floor((y-miny)/ydiff);
        img(indy,indx,1)=img(indy,indx,1)+r;
        img(indy,indx,2)=img(indy,indx,2)+g;
        img(indy,indx,3)=img(indy,indx,3)+bb;


    end
end
h=0.5*fspecial('average',[2 2]);
img=imfilter(img,h);
toc
image(uint8(256-img));
imwrite(uint8(256-img),'peterdejongring.png','png');