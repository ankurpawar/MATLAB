%nova fractal
%Note: this script takes about 8 seconds to complete
%the fractal
res=700;
xres = res;
yres = res;
const=0;
x = linspace(-0.8,0.8,xres);
y = linspace(-1.15,0.94,yres);
c = zeros(length(y),length(x));
iter= 60;    %number of iterations
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
for m=1:n
    const=c(m) ;
    k = 0;
    rough1 = 0.06;
    rough  = 0;
    z=-1;
    while ((k<=iter)&&(abs(rough1)> 0.05))
        z = z - 1*(0.33334*z + 0.33334/(z^2))+const;
        %simplified expression of  z- (z^3-1)/(3*z^2)+c;
        
        rough1 = z - rough;
        rough  = z;
        k  = k+1;
    end
    zvalues(m) =k;
    
end
toc
close(h_msg);
ho=flipud(colormap(bone));
colormap((ho));
image(x,y,zvalues);