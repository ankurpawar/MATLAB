%Newton fractal
%This script may take time to complete depending on the number 
%of iteratons and size of image
%the fractal equation z^4-cos(z)
x = linspace(-0.5,0.5,500);
y = linspace(-0.5,0.5,500);
c = zeros(length(y),length(x));
iters = 64;
cutoff = 0.05;
len_x = length(x);
len_y = length(y);

for n=1:len_x
    c(n,:) = y(n)+i*x(:);
end

h_msg = msgbox(' Please Wait ',' ');
zvalues = zeros(len_x,len_y);
z = 0+i*0;
rough = 0;
rough1 = 0;

m = 1;
n = len_x*len_y;
tic
for m = 1:len_x*len_y
    k = 0;
    z = c(m);
    rough1 = 0.06;
    rough  = 0;
    while ((k <= iters) && (abs(rough1) > cutoff))
        z = z - (z*z*z*z-cos(z))/(4*z*z*z+sin(z));
        rough1 = z - rough;
        rough  = z;
        k  = k+1;
    end
    zvalues(m) = k;
end
close(h_msg);
%you can also try any one of these colormaps
%cmap = flipud(colormap(hsv));
%cmap = flipud(colormap(copper));
%cmap = flipud(colormap(hot));
%cmap = flipud(colormap(gray));
%cmap = flipud(colormap(jet));
%cmap = flipud(colormap(summer));
%cmap = flipud(colormap(winter));
%cmap = flipud(colormap(spring));
%cmap = flipud(colormap(bone));
%cmap = colormap(hsv);
%cmap = colormap(copper);
%cmap = colormap(hot);
%cmap = colormap(gray);
%cmap = colormap(jet);
%cmap = colormap(summer);
%cmap = colormap(winter);
%cmap = colormap(spring);
%cmap = colormap(bone);
cmap = colormap(bone(iters));
colormap(cmap);
image(x,y,zvalues);
axis tight
toc

%remove comments '%' from 68-72 to save the image
%clear x y c
%zval8 = uint8(zvalues);
%clear zvalues
%rgb   = ind2rgb8(zval8, cmap );
%imwrite(rgb ,'newton2.png','png');