function img=zvisual7(func)
%zvisual7('func')
%visualization of complex function (domain coloring)
%hue is the angle of complex function
%sat is the white lines which is the real and imaginary value of  
%    complex function
%value is the black circles 
%usage
%
%   zvisual7  
%   calling zvisual7 without any argument draw z-1./z
%
%   zvisual7('sin(z)')
%   plots sin(z) from -pi to pi in x-axis  and -pi to pi in y-axis
%   
%   zvisual7('func')
%   'func' can be any function  
%   example: zvisual7('log(z)') , zvisual7( 'cot(z)')
%            zvisual7('z.^2 - 1./z') , zvisual7('z.^3-cos(z)')........
%   always use ./ .* .^ operators when passing 'func'
%   any function is drawn from -pi to pi on x-axis  and -pi to pi on y-axis  
%
%   to save image call function as 
%   img=zvisual7('log(z)');
%   imwrite(img,'domaincolor.png','png');
%   
if nargin==0
   func='z-1./z'; 
end
    
X  = linspace(-pi,pi,500);
Y  = linspace(-pi,pi,500);
lenx  = length(X);
leny  = length(Y);
Z     = zeros(length(X),length(Y));
colors= zeros(length(X),length(Y),3);
ColorMset = zeros(lenx,leny,3);
colors_uint8   = zeros(lenx,leny,3,'uint8');
for n = 1:lenx        
    Z(n,:)= Y(:)+i*X(n);
end

Z=feval(inline(func),Z);

hue=angle(Z)/(2*pi);
hue=-min(min(hue))+hue;
r=log(abs(Z))/(2*log(2));
        
        

z_real=real(Z);
z_imag=imag(Z);

%loop to limit imaginary and real value of function from -pi to pi
for m=1:length(X)*length(Y)
   if z_real(m)>pi || z_imag(m)>pi
      z_real(m)=pi;z_imag(m)=pi;
   elseif z_real(m)<-pi || z_imag(m)<-pi
      z_real(m)=-pi;z_imag(m)=-pi;
   else
      z_real(m)=z_real(m);z_imag(m)=z_imag(m);
   end
end
sat=mod(abs(cos(pi*z_imag).*cos(pi*z_real).*...
            sin(pi*z_imag).*sin(pi*z_real)).^0.5,1);
sat = 1 -(1-sat).^5; 
sat = 0.1 +sat *0.9;


val=abs(cos(2*pi*r));
val = 1 -(1-val).^2; 
val = 0.6 +val *0.4;



ColorMset(:,:,1) = hue;
ColorMset(:,:,2) = sat;
ColorMset(:,:,3) = val;

h_wait=waitbar(0,'Please  wait...');
for mm=1:lenx            
    for nn=1:leny        
           a=ColorMset(mm,nn,1);
           s=ColorMset(mm,nn,2);
           v=ColorMset(mm,nn,3);
           zo = floor(6*a); 
           rough = (zo); 
           f = a*6 - zo;
           p = v*(1-s);
           q = v*(1-s*f);
           t = v*(1-s*(1-f));
 
           switch (rough)    
          case 0 
                r=v; g=t; b=p;
          case 1 
                r=q; g=v; b=p;
          case 2 
                r=p; g=v; b=t;
          case 3 
                r=p; g=q; b=v;
          case 4 
                r=t; g=p; b=v;
          case 5 
                r=v; g=p; b=q;
          end             
                 
        
      co = (256*r); 
      if(co>255)          
         co = 255; 
      end                 
      colors(mm,nn,1) = co;
      co = (256*g); 
      if(co>255)          
          co = 255; 
      end                 
      colors(mm,nn,2) = co;
      co = (256*b); 
      if(co>255)          
         co = 255; 
      end                 
      colors(mm,nn,3) = co;

      end            
    waitbar(mm/lenx,h_wait);
end               
close(h_wait);

colors_uint8=uint8(colors);
image(X,Y,uint8(colors))
axis square
if nargout==1
    img=colors_uint8;
end

%function end
