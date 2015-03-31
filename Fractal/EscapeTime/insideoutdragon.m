%Inside out dragon
%Formula take from Paul Bourke website
% zn+1 = zn2 + f(|zn|) + i g(|zn|)
% f(r) = r (1 + 2 r + r2) (r2 - 1) / (1 + r3)2
% g(r) = r (1 - 2 r + r2) (r2 - 1) / (1 + r3)2
x  =  linspace(-2,2,100);
y  =  linspace(-2,2,100);
len_x =  length(x);
len_y =  length(y);
iter =  100;  %number of iterations
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
    
    z = 1/c(m);
    xn = 0;
    yn = 0;
    k = 0;
    r=abs(z);
    while (k<=iter)&&(r<2)
        r=abs(z);
        f=r*(1 + 2* r + r^2)*(r^2-1)/(1 + r^3)^2;
        g=r*(1 - 2* r + r^2)*(r^2 - 1)/(1 + r^3)^2;
        z= z^2 + f+ i*g;
        k = k+1;
    end
    zval(m) = k;
end
toc
close(h_msg);
%you can also try any one of these colormaps
%cmap = flipud(colormap(cool(iter)));
%cmap = flipud(colormap(copper(iter)));
%cmap = flipud(colormap(hot(iter)));
cmap = fliplr(colormap(pink(iter+4)));
%cmap = flipud(colormap(summer(iter)));
%cmap = flipud(colormap(winter(iter)));
%cmap = flipud(colormap(spring(iter)));
%cmap = flipud(colormap(bone(iter)));
colormap(cmap);
image(zval)
axis tight off

%clear x y c
%imwrite(zval,cmap ,'mandel123.png','png') ;