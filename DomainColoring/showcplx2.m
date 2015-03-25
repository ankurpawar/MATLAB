%Farrisviz

	
X  = linspace(-pi,pi,500);
Y  = linspace(-pi,pi,500);
lenx  = length(X);
leny  = length(Y);
Z     = zeros(length(X),length(Y));
ColorMset = zeros(lenx,leny,3);
rgb   = zeros(lenx,leny,3);
for n = 1:lenx        
    Z(n,:)= Y(:)+i*X(n);
end

%Z=feval(inline('(z.^2-1).*(z-2*i).^2./(z.^2+2+2*i)'),Z);
%Z=feval(inline('(1+z)./(1-z)'),Z);
Z=feval(inline('(z.^2-i)./(2*z.^2+2*i)'),Z);
%Z=feval(inline('(2*z.^3- 6*z.^2 - z - 2)/6'),Z);
%Z=feval(inline('((z-1).*(z+1).^2)./((z+i).*(z-i).^2)'),Z);
%Z=feval(inline('cot(z)'),Z);

%(2*z.^3- 6*z.^2 - z - 2)/6.
m12 = log(2);

arg = angle(Z)/(2*pi);
%arg = mod(angle(Z),(2*pi));
arg = -min(min(arg))+arg;
arg2=arg;
for m=1:lenx*leny
    a=floor(20*arg(m));
    arg(m)=a/20;
end

abs_z= abs(Z);
exponent=2;
l=1-(4*atan(abs(Z).^abs(exponent))/pi);
l=sign(exponent).*sign(l).*abs(l);

s = min(1,(1-l));
s = 1 -(1-s).^5; 
s = 0.1 +s *0.9;

v = min(1,(1+l));
v = 1 -(1-v).^5; 
v = 0.1 +v *0.9;

ColorMset(:,:,1) = arg;
ColorMset(:,:,2) = s;
ColorMset(:,:,3) = v;

rgb=hsv2rgb(ColorMset);
image(rgb);
axis off square
%imwrite(rgb,'misc3.png','png','Source','((z-1).*(z+1).^2)./((z+i).*(z-i).^2)')
