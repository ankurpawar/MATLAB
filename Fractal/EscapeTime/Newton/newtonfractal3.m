%Newton fractal
%This script may take time to complete depending on the number
%of iteratons and size of image
% z^4 + 3*z^3 + 2*z^2 + 0.2*z + 1
IMAGEWIDTH = 500;
IMAGEHEIGHT = 500;
x = linspace(-1,1,IMAGEWIDTH);
y = linspace(-1,1,IMAGEHEIGHT);
c = zeros(length(y),length(x));
iters = 64;
cutoff = 0.05;
len_x = length(x);
len_y = length(y);
for n=1:len_x
    c(n,:) = y(n)+i*x(:);
end

h_msg   = msgbox(' Please Wait ',' ');
zvalues = zeros(len_x,len_y);
z = 0+i*0;
rough = 0;
rough1 = 0;

m  =  1;
n  =  len_x*len_y;
tic
for m = 1:len_x*len_y
    k = 0;
    z = c(m);
    rough1 = 0.06;
    rough  = 0;
    while ((k <= iters) && (abs(rough1) > cutoff))
        z = z-(z*z*z*z + 3*z*z*z + 2*z*z +0.2*z+ 1)...
            /(4*z*z*z + 9*z*z + 4*z +0.2);
        rough1 = z - rough;
        rough  = z;
        k  = k+1;
    end
    zvalues(m) = k;
end
close(h_msg);
ho = flipud(colormap(pink(iters)));
colormap(ho);
imagesc(x,y,zvalues);
axis tight square
toc