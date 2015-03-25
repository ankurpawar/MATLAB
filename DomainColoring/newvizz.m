%newvizz

IMGWIDTH = 1000;
IMGHEIGHT = 1000;
X = linspace(-pi,pi,IMGWIDTH);
Y = linspace(-pi,pi,IMGHEIGHT);
lenx = length(X);
leny = length(Y);
Z = zeros(length(X),length(Y));
colors = zeros(length(X),length(Y),3);
col = zeros(1,3);
for n = 1:lenx
    Z(n,:) = Y(:)+i*X(n);
end

funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i);
%funcz = Z./Z.^sqrt(Z);
%funcz = 1./(cos(Z)-sinh(Z));
%funcz = Z.^sqrt(Z)-Z./log(Z);
%funcz = tan(Z);
%funcz = ((Z-1).*(Z+1).^2)./((Z+i).*(Z-i).^2);

hue = (pi+angle(funcz))/(2*pi);
x = imag(funcz);
y = real(funcz);
r = abs(funcz);
a = 0.40824829046386301636 * y;
b = 0.70710678118654752440 * x;
d =  1./(1+(r).^2);
r = mod(abs(sqrt(d)), 1);
red =   0.5   + 0.81649658092772603273* y .*d;
green = 0.5 -  d .* ( a - b );
blue =  0.5  - d .* ( a + b );
d = 0.5  - r.*d;
d(r < 1) = -d(r < 1);
red = red + d;
green = green + d;
blue = blue + d;

red = mod(red,1);
blue = mod(blue,1);
green = mod(green,1);

ColorMset = zeros(size(x,1), size(x,2), 3);
ColorMset(:,:,1) = 255*red;
ColorMset(:,:,2) = 255*green;
ColorMset(:,:,3) = 255*blue;

image(Y,X,uint8(ColorMset));
axis square off
imwrite(uint8(ColorMset),'newvizz4.png','png','Comment','(Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i)');
