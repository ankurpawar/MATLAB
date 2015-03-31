%author:Ankur Pawar
%burning ship fractal
%this script takes about 5 seconds to plot the fractal
%remove comments from line 60 - 61 to save the figure as 
%an image of resolution 2000x2000;

   y = linspace(-0.13,0.02,2000);
   x = linspace(-1.8,-1.6,2000);
len_x= length(x);
len_y= length(y);
iter = 100;   %number of iterations
   m = 1;   
   c = zeros(len_y,len_x);
zval = zeros(len_y,len_x);
xnew = 0; 
ynew = 0;
   a = 0;   
   b = 0;
  xn = 0;   
  yn = 0;
total= len_x*len_y;

for m= 1:len_y
   c(m,:) = y(m)+i*x(:);
end
 
h_msg= msgbox('Please  wait...','');
tic           %start timer


for m = 1:total
     a  = imag(c(m));
     b  = real(c(m));
     xn = 0;   
     yn = 0;
     k  = 0;
     while (k<=iter)&&((xn^2+yn^2)<4)
       xnew = xn^2 - yn^2 + a;
       ynew = 2*abs(xn*yn)+ b;  % ynew = 2*xn*yn+ b; for mandelbrot set
         xn = xnew;
         yn = ynew;
          k = k+1;
     end
     zval(m) = k;
end
toc          %stop timer

close(h_msg);
%you can also try these colormaps
%cmap = flipud(colormap(pink));  
%cmap = flipud(fliplr(colormap(copper)));  
%cmap = flipud(colormap(hot));  
%cmap = flipud(colormap(gray));  
%cmap = fliplr(colormap(autumn));  
cmap = fliplr(flipud(colormap(bone)));  
colormap(cmap);
image(x,y,zval);
axis tight off

%clear x y c
%imwrite(zval, cmap ,'burn.png','png','source','Computer generated') ;

