%polytiling
n=6;
t=linspace(0-pi/4,2*pi-pi/4,n*2+1);
x=cos(t);
y=sin(t);
gap=(cos(pi/12)-cos(pi/4));
x2=[cos(pi/4)  cos(pi/4)+2*gap cos(pi/4)+2*gap   cos(pi/4)];
y2=[cos(pi/4)  cos(pi/4)       cos(pi/4)+2*gap   cos(pi/4)+2*gap];

gapx1=2*cos(pi/12);
gapy2=2*cos(pi/12);%-(cos(pi/12)-cos(pi/4));
gapx2=cos(pi/12);
total=7;
rough=-gapx2/2;
 for ky=1:total
     rough=-rough;
     for kx=1:total  
         if mod(kx+ky,2)
             patch(x+kx*gapx1,y+ky*gapy2,[0.6 0.75 0.65]);
             patch(x2+kx*gapx1,y2+ky*gapy2,[0.8 0.2 0.3]);
         else
             patch(x+kx*gapx1,y+ky*gapy2,[0.6 0.5 0.8]);
             patch(x2+kx*gapx1,y2+ky*gapy2,[0.8 0.9 0.2]);
         end
     end
 end

axis equal off