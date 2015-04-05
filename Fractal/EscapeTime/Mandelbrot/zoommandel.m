%mandelanim
%mandelbrot set
%this script takes about 2 seconds
%to complete the fractal
%remove the comment in line 52 to 57
%to save the fractal as a png file
%the function ind2rb8 takes sometime
%x=[-1.5 1.5;]image(x,y,zval);[xl,yl,al,rect] = imcrop;
%x=linspace(rect(1),rect(1)+rect(3),500)
%y=linspace(rect(2),rect(2)+rect(4),500)
 
 rect =  [-1.5 -1.5 3 3]; 
   x  =  linspace(-1.5,1.5,500);
   y  =  linspace(-1.5,1.5,500);  
len_x =  length(x);
len_y =  length(y);
 xnew =  0; 
 ynew =  0;
    a =  0;    
    b =  0;
   xn =  0;   
   yn =  0;
rough =  0;
   
 img =  zeros(len_x,len_y,3);
 rough1 =  0;
 iter=2000;
 %h_msg =  msgbox(' Please Wait ',' ');
for rough1=1:4
   x  =  linspace(rect(1),rect(1)+rect(3),500);
   y  =  linspace(rect(2),rect(2)+rect(4),500);
   PixelHeight=(max(y)-min(y))/500;


for m=1:len_y
       b=y(m);
       if (abs(b)< PixelHeight/2) 
           b=0.0;
       end
     for n=1:len_x
       a=x(n);
       k=0; 
       
      xn=0;yn=0;

     while (k<=(iter))&&((xn^2+yn^2)<10000)
       xnew = xn^2 - yn^2 + a;
       ynew = 2*xn*yn + b;  
         xn = xnew;
         yn = ynew;
          k = k+1;
     end
    zval(m) = k;
    k=k-1;
    if k==iter
        img(m,n,1)=0;
        img(m,n,2)=0;
        img(m,n,3)=0;
    elseif yn>0
        img(m,n,1)=0;
        img(m,n,2)=0;
        img(m,n,3)=0;
    else
        img(m,n,1)=255;
        img(m,n,2)=255;
        img(m,n,3)=255;
    end       
 end
end

image(x,y,uint8(img))
axis tight square
rect=getrect;
end
