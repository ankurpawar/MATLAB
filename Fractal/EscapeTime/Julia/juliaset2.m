%Julia set
%this script takes about 2 second
%to complete the fractal
%remove the comment in line 52 to 57
%to save the fractal as a png file
%the function ind2rb8 takes sometime
x = linspace(-1.5,1.5,300);
y = linspace(-1.5,1.5,300);
c = zeros(length(x),length(y));
a = 0;
b = 0;
xn= 0;
yn= 0;
xnew = 0;
ynew = 0;
lenx  = length(x);
leny  = length(y);
zval  = zeros(leny,lenx);
%h_msg = msgbox(' Please Wait ',' ');

for n=1:leny

    c(n,:)=y(n)+i*x(:);

end


a = -0.7708; -0.3420 ;-0.0284; -0.6642;0.28685134248957;
b = -0.1363;  0.6349 ;-0.7145; -0.5768;0.48848536810956;
format long
a = 0.53; b = -0.92;aa=0-(-1+(2)*rand(1,5));bb=0-(-1+(2)*rand(1,5));
for mm=1:5
a=aa(mm);b=bb(mm);
for n = 1:lenx*leny
    
    k  = 0;
    xn = real(c(n));
    yn = imag(c(n));
    while ((k <= 100) &&((xn*xn + yn*yn)<4))
    xnew = xn*xn-yn*yn + a;
    ynew = 2*xn*yn + b;
      xn = xnew;
      yn = ynew;
       k = k+1;
    end
  zval(n)=k;
    
end
ho=flipud(colormap(bone));
zval = zval';
colormap(ho);
h2 = image(x,y,zval);
pause(0.5)
%drawnow
end

%close(h_msg);
ho=flipud(colormap(bone));
%zval = zval';
colormap(ho);
h2 = image(x,y,zval);

%clear x y c
%cmap  = colormap;
%zval8 = uint8(zval);
%clear zval
%rgb   = ind2rgb8( zval8 , cmap );
%imwrite(rgb ,'julia.png','png') ;

