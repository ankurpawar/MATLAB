function zviz2(func);
%ZVIZ  Visualize functions of a complex variable.
%   ZVIZ expr1 expr2 ... exprn or ZVIZ('expr1','expr2',...'exprn') plots
%   colored contour maps of the given expressions, which should involve
%   a complex variable, z.  Contour lines for the real and imaginary parts
%   are superimposed on a full color image using a color scheme developed
%   by John Richardson.  (http://home1.gte.net/jrsr/complex.html)
%   Red is real, blue is positive imaginary, green is negative imaginary,
%   black is small magnitude and white is large magnitude.  Branch cuts
%   appear as color discontinuities and coalescent contour lines.
%   Singularities appear as characteristic black and white patterns.
%
%   For example
%      zviz  z  2./z.^2  sqrt(z)  acosh(z)  atanh(z)  exp(-1./z.^2)
%   produces six figures with plots of the six expressions.
%
%   Regarding branch cuts, see pp. 79 and 86 of Abramowitz and Stegun
%   and Cleve's Corner, MATLAB News & Notes, Summer, 1998.
%
%                                   z = x + i*y
%   sqrt(z), log(z):                x <= 1       &  y == 0
%   asin(z), acos(z), atanh(z):     abs(x) >= 1  &  y == 0
%   atan(z), asinh(z):              x == 0       &  abs(y) >= 1
%   acsc(z), asec(z), acoth(z):     abs(x) <= 1  &  y == 0
%   acot(z), acsch(z):              x == 0       &  abs(y) <= 1
%   acosh(z):                       x <= 1       &  y == 0
%   asech(z):                  (x <= 0 | x >= 1) &  y == 0
 if nargin==0
     %func='(1./z)';
     %func='i./sqrt(z)./log(z)';
     %func='z';
     %func='log(z)-atanh(z).^1.5';
 end
   F = func;

   X  = linspace(-pi,pi,500);
   Y  = linspace(-pi,pi,500);
   Z     = zeros(length(X),length(Y));
   for n = 1:length(X)        
        Z(n,:)= Y(:)+i*X(n);
   end

   w = feval(inline(F),Z);
   img=z2rgb(w);
   image(img);
   
   axis off square
   %imwrite(img,'newcolor1.png','png');
   %drawnow


function C = z2rgb(z);
%Z2RGB Complex variable color image.
%   Z2RGB(Z) maps a complex matrix into a full color image.
%   The mapping is due to John Richardson
%   See http://home1.gte.net/jrsr/complex.html.
%   Example:
%      [x,y] = meshgrid(-2:1/16:2); z = x+i*y;
%      image(z2rgb(F(z)))

r = abs(z);
a = sqrt(1/6)*real(z);
b = sqrt(1/2)*imag(z);
d = 1./(1+r.^2);
R = 1/2 + sqrt(2/3)*real(z).*d;
G = 1/2 - d.*(a-b);
B = 1/2 - d.*(a+b);
d = 1/2 - r.*d;
d(r<1) = -d(r<1);
C(:,:,1) = R + d;
C(:,:,2) = G + d;
C(:,:,3) = B + d;

C(:,:,1)=C(:,:,1)/max(max(C(:,:,1)));
C(:,:,2)=C(:,:,2)/max(max(C(:,:,2)));
C(:,:,3)=C(:,:,3)/max(max(C(:,:,3)));

hs=rgb2hsv(C);
z_real=real(z);z_imag=imag(z);
for m=1:length(z)*length(z)
   if z_real(m)>pi || z_imag(m)>pi
      z_real(m)=pi;z_imag(m)=pi;
   elseif z_real(m)<-pi || z_imag(m)<-pi
      z_real(m)=-pi;z_imag(m)=-pi;
   else
      z_real(m)=z_real(m);z_imag(m)=z_imag(m);
   end
end
hs(:,:,3)=hs(:,:,3).^3;
hs(:,:,3) =1-(hs(:,:,3)).^5; 


hs(:,:,2)=mod(abs(cos(pi*z_imag).*cos(pi*z_real).*...
                  sin(pi*z_imag).*sin(pi*z_real)).^0.5,1);    %%%%

hs(:,:,2) = (1-hs(:,:,2)).^5; 
%hs(:,:,2) = 1-(hs(:,:,2));

C=hsv2rgb(hs);

