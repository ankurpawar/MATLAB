function polytiling
%hexagonal tile
n=3;
t=linspace(0+pi/6,2*pi+pi/6,n*2+1);
r=1;
gapx1=2*cos(pi/6);

gapy2=1+sin(pi/6);
gapx2=cos(pi/6);
x=r*cos(t);y=r*sin(t);

total=10;
colors=pink(3);
rough=-gapx2/2;
for ky=1:total
    rough=-rough;
    for kx=1:total
        patch(x+kx*gapx1+rough,y+ky*gapy2,colors(mod(kx+ky,3)+1,:)...
            ,'edgecolor',[0.5 0.5 0.5]);
    end
end
axis equal off
end