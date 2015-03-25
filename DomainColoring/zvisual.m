function img=zvisual(func)
%zvisual('func')
%visualization of complex function (domain coloring)
%hue is the angle of complex function
%sat and val are absolute value of complex function
%sat and val are scaled so that their value comes in range
%of 0 to 1 
%
%usage
%
%   zvisual  
%   calling zvisual without any argument draw complex plane tan(z)
%
%   zvisual('sin(z)')
%   plots sin(z) from -pi to pi in x-axis  and -pi to pi in y-axis
%   
%   zvisual('func')
%   'func' can be any function  
%   example: zvisual('log(z)') , zvisual( 'cot(z)')
%            zvisual('z.^2 - 1./z') , zvisual('z.^3-cos(z)')........
%   always use ./ .* .^ operators when passing 'func'
%   any function is drawn from -pi to pi on x-axis  and -pi to pi on y-axis  
%
%   to save image call function as 
%   img=zvisual('log(z)');
%   imwrite(img,'domaincolor.png','png');
%   

if nargin==0
    func='tan(z)';
end

X = linspace(-pi,pi,1000);
Y = linspace(-pi,pi,1000);
lenx=length(X);
leny=length(Y);
ColorMset = zeros(lenx,leny,3);
Z = zeros(length(X),length(Y));
colors=zeros(length(X),length(Y),3);

for n=1:lenx        
       Z(n,:)=Y(:)+i*X(n);
end


Z=feval(inline(func),Z);
abs_z=abs(Z);

hue=angle(Z)/(2*pi);
hue=-min(min(hue))+hue;

ColorMset(:,:,1) = hue;

%loop to limit absolute value of function from 0 to 2pi
for m=1:lenx*leny
    if abs_z(m)>2*pi
       abs_z(m)=2*pi;
    end
end
ColorMset(:,:,2) = abs(sin(pi*sqrt(abs_z)));
ColorMset(:,:,2) = 1 -(1-ColorMset(:,:,2)).^3; 

ColorMset(:,:,3) = abs(cos(pi*sqrt(abs_z)));
ColorMset(:,:,3) = 1 -(1-ColorMset(:,:,3)).^3; 
ColorMset(:,:,3) = (0.6 +ColorMset(:,:,3) *0.4);


h_wait=waitbar(0,'Please  wait...');
for mm=1:lenx            
    for nn=1:leny        
           a  = ColorMset(mm,nn,1);
           sat=ColorMset(mm,nn,2);
           val=ColorMset(mm,nn,3);
           zo = floor(6*a); 
           rough = (zo); 
           f = a*6 - zo;
           p = val*(1-sat);
           q = val*(1-sat*f);
           t = val*(1-sat*(1-f));
 
           switch (rough)    
          case 0 
                r=val; g=t; b=p;
          case 1 
                r=q; g=val; b=p;
          case 2 
                r=p; g=val; b=t;
          case 3 
                r=p; g=q; b=val;
          case 4 
                r=t; g=p; b=val;
          case 5 
                r=val; g=p; b=q;
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
if nargout==1
    img=colors_uint8;
end

%function end