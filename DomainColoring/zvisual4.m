function img=zvisual4(func)
%zvisual4('func')
%visualization of complex analytic function (domain coloring)
%hue is the angle of complex numbers
%val is the black lines which occur after every 36 degree change 
%    in angle of function
%sat is white circles 
%sat and val are scaled so that their value comes in range
%of 0 to 1 
%
%usage
%
%   zvisual4  
%   calling zvisual4 without any argument draw (z-1)./(z+1)
%
%   zvisual4('sin(z)')
%   plots sin(z) from -pi to pi in x-axis  and -pi to pi in y-axis
%   
%   zvisual4('func')
%   'func' can be any function  
%   example: zvisual4('log(z)')      , zvisual4( 'cot(z)')
%            zvisual4('z.^2 - 1./z') , zvisual4('z.^3-cos(z)')........
%   always use ./ .* .^ operators when passing 'func'
%   any function is drawn from -pi to pi on x-axis  and -pi to pi on y-axis  
%
%   to save image call function as 
%   img=zvisual4('log(z)');
%   imwrite(img,'domaincolor.png','png');
%   
	

if nargin==0
   func='(z-1)./(z+1)'; 
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


m12 = log(2);
abs_z= abs(Z);

hue = angle(Z)/(2*pi);
hue = -min(min(hue))+hue;

val = mod(log(abs_z)/m12,1);
val = 1 -(1-val).^3; 
val = 0.6 +val *0.4;
val = mod(abs(cos(10*pi*hue)).^0.12,1);

sat = mod(log(abs_z)/m12,1);
sat = 0.4 +sat *0.6;
sat = mod(abs(cos(pi*sat).^0.75),1);
sat = 1 -(1-sat).^2; 
sat = sat.^3;


ColorMset(:,:,1) = hue;
ColorMset(:,:,2) = sat;
ColorMset(:,:,3) = val;

h_wait=waitbar(0,'Please  wait...');
for mm=1:lenx            
    for nn=1:leny        
           a  = ColorMset(mm,nn,1);
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
