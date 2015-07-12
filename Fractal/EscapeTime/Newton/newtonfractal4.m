%newton fractal
%This script may take time to complete depending on the number
%of iteratons and size of image
%the fractal (z^3 - 2*z + 2)
x = linspace(-1.5,1.5,500);
y = linspace(-1.5,1.5,500);
c = zeros(length(y),length(x));
iters = 128;
len_x = length(x);
len_y = length(y);

for n=1:len_x
    c(n,:) = y(n)+i*x(:);
end

h_msg   = msgbox(' Please Wait ',' ');
zvalues = zeros(len_x,len_y);
z   = 0+i*0;
rough = 0;
rough1 = 0;

m  =  1;
n  =  len_x*len_y;
tic
for m=1:len_x*len_y
    
    k = 0;
    z = c(m);
    rough1 = 0.05;
    rough  = 0;
    while ((k <= iters)&&(abs(rough1)>0.05))
        z = z-(z*z*z - 2*z + 2)/(3*z*z - 2);
        
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
cmap=flipud(colormap(bone(iters)));
colormap(cmap);
imagesc(x,y,zvalues);
axis equal
toc

%remove comments '%' from 66-71 to save the image
%clear x y c
%zval8 = uint8(zvalues);
%clear zvalues
%rgb   = ind2rgb8( zval8 , cmap );
%imwrite(rgb ,'newton4.png','png') ;

