%complexviz
IMGWIDTH = 500;
IMGHEIGHT = 500;
X = linspace(-pi,pi,IMGWIDTH);
Y = linspace(-pi,pi,IMGHEIGHT);
lenx = length(X);
leny = length(Y);
Z = zeros(length(X),length(Y));
colors=zeros(length(X),length(Y),3);
col=zeros(1,3);
for n=1:lenx
    Z(n,:)=Y(:)+i*X(n);
end

%Z=feval(inline('log(pi*z).^(z)'),Z);
%Z=feval(inline('(z-1)./(z+1)'),Z);
Z=feval(inline('(z)'),Z);
hue=(pi+angle(Z))/(2*pi);
%hue=-min(min(hue))+hue;
r=log(abs(Z))/(2*log(2));


%sat=abs(sin(0.75*pi*abs(Z)));
sat=abs(sin(2*pi*r));
%sat=(1+(sat))/2 ;
sat = 1 -(1-sat).^3;
sat = 0.1 +sat *0.9;
sat=mod(abs(cos(pi*imag(Z)).*sin(pi*real(Z))).^2.5,1);
sat = 1 -(1-sat).^3;
sat = 0.1 +sat *0.9;

%val=mod(abs(cos(2*pi*r).*cos(pi*real(Z)).*sin(pi*imag(Z))).^0.7,1);
%val=abs(cos(0.75*pi*abs(Z)));
val=abs(cos(2*pi*r));

%val=(1+(val))/2 ;
val = 1 -(1-val).^2;
val = 0.6 +val *0.4;
 
img = zeros(IMGWIDTH,IMGHEIGHT,3);
img(:,:,1) = hue;
img(:,:,2) = sat;
img(:,:,3) = val;

%convert HSV to RGB 
rgb=hsv2rgb(img);
imshow(rgb);
