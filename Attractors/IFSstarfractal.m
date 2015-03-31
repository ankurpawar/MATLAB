NX= 1000;
NY= 1000;
N=8000000;%N= 100000000;
SCALE= (NX / 15);
maxcount=0;
%i,m,n,c,ix,iy;
x=1;y=1;x1=0.001;y1=0.001;
a=zeros(25,1);
b=zeros(25,1);

m = 3;

   %/* Create the image */
   img = zeros(NX,NY);
%   EraseBitmap(image,NX,NY,white);
%   srand(time(NULL));

   for k=1:m
      a(2*k) = cos(2*pi * (k+1) / m);
      b(2*k) = sin(2*pi * (k+1) / m);
   end
   for k=1:m 
      a(2*k+1) = 0.5*(cos(2*pi * (k+1) / m) + cos(2*pi * k / m));
      b(2*k+1) = 0.5*(sin(2*pi * (k+1) / m) + sin(2*pi * k / m));
   end
   
   for n=1:N
      
      c =ceil(mod(25*rand,2*m));
      x1 = (x/(x*x + y*y))/3 + a(c);
      y1 = (-y/(x*x + y*y))/3 + b(c);
      x = x1 / (x1*x1 + y1*y1);
      y = y1 / (x1*x1 + y1*y1);

      ix = x * SCALE + NX/2;
      iy = y * SCALE + NY/2;
      ix=floor(ix);
      iy=floor(iy);
      if ix<1000 && iy<1000 && ix>0 && iy>0
      img(ix,iy)=img(ix,iy)+1;
      maxcount=max(maxcount,img(iy,ix));
      end
   end

maxcount=log(maxcount);
for n=1:NX*NY
    if img(n)>0
       img(n)=128*log(img(n))/maxcount;  
    end
end


image(img);
colormap(1-gray(128));