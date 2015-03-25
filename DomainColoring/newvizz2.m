%newvizz2
IMGWIDTH = 1000;
IMGHEIGHT = 1000;
X = linspace(-pi,pi,IMGWIDTH);
Y = linspace(-pi,pi,IMGHEIGHT);
lenx = length(X);
leny = length(Y);
Z = zeros(length(X),length(Y));
ColorMset = zeros(lenx,leny,3);
for n = 1:lenx
    Z(n,:) = Y(:)+i*X(n);
end

%Z=feval(inline('(z.^2-1).*(z-2*i).^2./(z.^2+2+2*i)'),Z);
%Z=feval(inline('(z)'),Z);
%Z=feval(inline('cos(z)-sinh(z)'),Z);
%Z=feval(inline('tan(2.^z)+tan(1./2.^z)'),Z);
%Z=feval(inline('(2*z.^3- 6*z.^2 - z - 2)/6'),Z);
Z=feval(inline('((z-1).*(z+1).^2)./((z+i).*(z-i).^2)'),Z);

r = abs(Z);
x = real(Z);
y = imag(Z);
a = 0.40824829046386301636 * x;
b = 0.70710678118654752440 * y;
d =  1./(1+r.^2);

red = 0.5  + 0.81649658092772603273 * x.*d;
green = 0.5  - d .* ( a - b );
blue =  0.5  - d .* ( a + b );

d =  0.5  - r.*d;
d(r < 1) = -d(r < 1);

red = red + d;
green = green + d;
blue = blue + d;

ColorMset(:,:,1) = 255*red;
ColorMset(:,:,2) = 255*green;
ColorMset(:,:,3) = 255*blue;

image(Y,X,uint8(ColorMset));
axis square
%imwrite(rgb,'misc3.png','png','Source','((z-1).*(z+1).^2)./((z+i).*(z-i).^2)')
