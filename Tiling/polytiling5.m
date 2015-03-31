%polytiling
   n=3;
   t=linspace(0+pi/6,2*pi+pi/6,n*2+1);
   r=1;
   gapx1=4*cos(pi/6);

   gapy2=1;
   gapx2=2*cos(pi/6);
x=r*cos(t);y=r*sin(t);

%patch(x,y,'r')
total=6;
colors=pink(3);
rough=-gapx2/2;
for ky=1:total+9
    rough=-rough;  
    for kx=1:total
%         if mod(ky,3)
%          patch(x+kx*gapx1+rough,y+ky*gapy2,[0.4 0.5 0.7]);
%         else
%          patch(x+kx*gapx1+rough,y+ky*gapy2,[0.7 0.5 0.4]);
%         end
        patch(x+kx*gapx1+rough,y+ky*gapy2,colors(mod(ky,3)+1,:),'edgecolor',[0.5 0.5 0.5]);
    end
end
axis equal off