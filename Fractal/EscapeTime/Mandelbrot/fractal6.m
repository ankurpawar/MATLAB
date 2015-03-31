%Mandelbrot set
%this script takes about 2 seconds
%to complete the fractal
%remove the comment in line 62 to 67
%to save the fractal as a png file
%the function ind2rgb8 takes sometime
 
   %x  =  linspace(-1.5,0.6,1000);
   %y  =  linspace(-1.26,1.26,1000);
x  =  linspace(-1.5,0.6,500);
y  =  linspace(-1.26,1.26,500);
 iter = 250;
len_x =  length(x);
len_y =  length(y);
 xnew =  0; 
 ynew =  0;
    a =  0;    
    b =  0;
   xn =  0;   
   yn =  0;
rough =  0;
    c =  zeros(len_y,len_x);
 zval =  zeros(len_y,len_x);
h_msg =  msgbox(' Please Wait ',' ');

for n=1:len_y

    c(n,:)=y(n)+i*x(:);

end

tic
for m=1:len_x*len_y
     
     a = imag(c(m)); 
     b = real(c(m));
    xn = 0;   
    yn = 0;
     k = 0;
     while (k<=iter)&&((xn^2+yn^2)<4)
       xnew = xn^2 - yn^2 + a;
       ynew = 2*xn*yn + b;  
         xn = xnew;
         yn = ynew;
          k = k+1;
     end
    zval(m) = k;

end
toc
close(h_msg);
cmap = flipud(bone(iter));%[bone(125);flipud(bone(125))];
%you can also try any one of these colormaps
%cmap = flipud(colormap(gray));  
%cmap = flipud(colormap(copper));  
%cmap = flipud(colormap(hot));  
%cmap = flipud(colormap(bone));  
%cmap = flipud(colormap(summer)); 
%cmap = flipud(colormap(winter));  
%cmap = flipud(colormap(pink));  
%cmap = flipud(colormap(bone));    
colormap(cmap);
image(x,y,zval)

%clear x y c
%cmap  = colormap;
%imwrite(zval,cmap,'mandelw.png','png') ;



