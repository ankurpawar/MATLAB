%ikeda attractor
%zn+1 = a + b zn exp[ i k - i p / (1 + | zn2 | ) ]
%a = 0.85, b = 0.9, k = 0.4, p = 7.7
a = 0.85;
b = 0.9;
k = 0.4;
pp = 7.7;

xres=1000;
yres=1000;
x=linspace(-1.5,1.1,xres);
y=linspace(-0.6,1.7,yres);
zval=zeros(length(x),length(y),3);
xdiff=x(2)-x(1);
ydiff=y(2)-y(1);
minx=min(x);
miny=min(y);

sensitivity=0.2;
xi=0;yi=0;xn=0;yn=0;
curcol=zeros(1,3);
total=50;
skip=10;
z_old=0+0i;
max_x=0;max_y=0;
for n=1:700000
    aa=mod(xi/5,1);
    s=1;
    v=1;
    zo = floor(6*aa);
    rough = (zo);
    f = aa*6 - zo;
    p = v*(1-s);
    q = v*(1-s*f);
    t = v*(1-s*(1-f));
    
    switch (rough)
        case 0
            r=v; g=t; bb=p;
        case 1
            r=q; g=v; bb=p;
        case 2
            r=p; g=v; bb=t;
        case 3
            r=p; g=q; bb=v;
        case 4
            r=t; g=p; bb=v;
        case 5
            r=v; g=p; bb=q;
    end
    z_new=a + b*z_old* exp( i*k - i*pp/(1 + abs( z_old^2 ) ) );
    z_old=z_new;
    xi=imag(z_old);
    yi=real(z_old);
    
    
    indx=floor((xi-minx)/xdiff);
    indy=floor((yi-miny)/ydiff);
    
    zval(indx,indy,1)=zval(indx,indy,1)+r;
    zval(indx,indy,2)=zval(indx,indy,2)+g;
    zval(indx,indy,3)=zval(indx,indy,3)+bb;
    
end

zval=(1.0-exp(-sensitivity .*zval))*200;
image(uint8(zval));
imwrite(uint8(zval),'ikeda.png')
