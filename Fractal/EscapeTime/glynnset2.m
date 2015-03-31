%Glynn set fractal
%formula for generating Glynn set zn=(z^1.5)-0.2;
%author:Ankur Pawar
%
%This script takes about 50 seconds to complete the fractal.
%You can use different colormap to color the fractal.
%Remove the comment in the last line to save the image of fractal

x  =  linspace(-0.8,0.8,1000);
y  =  linspace(-0.8,1.4,1000);
len_x =  length(x);
len_y =  length(y);
const=-0.2;    %constant
iter =  100;  %number of iterations
z=0+0i;
c =  zeros(len_y,len_x);
zval =  zeros(len_y,len_x);
h = waitbar(0,'Please wait...'); %wait bar

%generate complex grid    
for n=1:len_y

    c(n,:)=y(n)+i*x(:);

end

tic %start timer

for m=1:len_x
     for n=1:len_y
         z = c(m,n); 
         k = 1;
         while (k<iter)&&(abs(z)<2)
             z=z^1.5+const;
             k = k+1;
         end
            zval(m,n) = k;
     end
     waitbar(m/len_x,h);   
end
toc %stop timer

close(h);
cmap = hsv(iter);    
colormap(cmap);
image(x,y,zval)

%imwrite(zval,cmap ,'glynnset2.png','png');