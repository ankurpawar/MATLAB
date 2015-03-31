%newton fractal
%Note: this script takes about 7 seconds to complete the fractal
%equation (z+0.5-0.866i)*(z+0.5+0.866i)*((z-1)^(0.4+0.9i))
%
x = linspace(-1.5,1.5,700);
y = linspace(-1.5,1.5,700);
c = zeros(length(y),length(x));



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
rough2 = 0;
m  =  1;
n  =  len_x*len_y;
const=0.7+0.9*i;
tic
for m=1:n
    
    k = 0;
    z = c(m);
    rough1 = 0.06;
    rough  = 0;
    while ((k<=30)&&(abs(rough1)> 0.03))
        rough2=  const/(z-1)+1/(z+0.5 - 0.866i)+1/(z+0.5 + 0.866i);
        z = z - 1/rough2;
        rough1 = z - rough;
        rough  = z;
        k  = k+1;
    end
    zvalues(m) = k;
    
end
toc
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
zmax=max(zvalues(:));
zmin=min(zvalues(:));
num=zmax-zmin;
zvalues=zvalues-zmin;
cmap=colormap(hot(num));
colormap(cmap);
image(x,y,zvalues)
axis tight square

%remove comments '%' from 70-75 to save the image
%clear x y c
%zval8 = uint8(zvalues);
%clear zvalues
%rgb   = ind2rgb8( zval8 , cmap );
%imwrite(rgb ,'newton9.png','png') ;

