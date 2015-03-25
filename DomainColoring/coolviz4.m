function img=coolviz4(func)
%visualization of complex function
%usage
%
%   coolviz4  
%   calling coolviz4 without any argument draw cos(z)-sinh(z)
%
%   coolviz4('sin(z)')
%   plots sin(z) from -pi to pi in x-axis  and -pi to pi in y-axis
%   
%   coolviz4('func')
%   'func' can be any function  
%   example: coolviz4('log(z)')      , coolviz4( 'cot(z)')
%            coolviz4('z.^2 - 1./z') , coolviz4('z.^3-cos(z)')........
%   always use ./ .* .^ operators when passing 'func'
%   any function is drawn from -pi to pi on x-axis  and -pi to pi on y-axis  
%
%   to save image call function as 
%   img=coolviz4('log(z)');
%   imwrite(img,'domaincolor.png','png');
%   

if nargin==0
    func='cos(z)-sinh(z)';
end
x=linspace(-pi,pi,500);
y=linspace(-pi,pi,500);
z  = zeros(length(x),length(y));
col= zeros(length(x),length(y),3);
lenx = length(x);
leny = length(y);
mm=1;
nn=1;
v=0+0i;
r=0;
g=0;
b=0;
    
for n = 1:lenx
    z(n,:) = y(:)+i*x(n);
end
    

z=feval(inline(func),z);       %function

phase_z=mod(max(max(abs(z))),pi);


PI = pi;   
E  = exp(1);
h_wait=waitbar(0,'Please  wait...');

for mm=1:lenx            
    for nn=1:leny        
        v=z(mm,nn);
        a=angle(v);
   
        while(a<0)        
           a = a + 2*PI; 
        end               

        a = a / (2*PI);
        m = abs(v);
        ranges = 0;
        rangee = 1;
    
        while(m>rangee)     
            ranges = rangee;
            rangee = rangee* E;
        end                
        k   = (m-ranges)/(rangee-ranges);
    
       
        if k < 0.5       
          sat=mod(abs(cos(10*pi*a)).^5,1);
       else
          sat=mod(abs(cos(10*pi*a)).^5,1);
       end               
       sat = 1 - (1-sat)^5; 
       sat = 0.1 + sat*0.9;
    
       if k < 0.5          
          val=k*2; 
       else
          val=1-(k-0.5)*2;
       end                 
       val = 1 - val;
       val = 1 -(1-val)^3; 
       val = 0.4 +val *0.6;
       
       if (sat==0)      
           r = val;g = val;b = val;
       else            
           if (a==1)   
              a = 0;
           end      
           zo = floor(a*6); 
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
      end                
        
      co = (256*r); 
      if(co>255)          
         co = 255; 
      end                 
      col(mm,nn,1) = co;
      co = (256*g); 
      if(co>255)          
          co = 255; 
      end                 
      col(mm,nn,2) = co;
      co = (256*b); 
      if(co>255)          
         co = 255; 
      end                 
      col(mm,nn,3) = co;

      end            
    waitbar(mm/lenx,h_wait);
end                
close(h_wait);
col8=uint8(col);
image(col8);
axis off square

if nargout==1
    img=col8;
end

%function end
