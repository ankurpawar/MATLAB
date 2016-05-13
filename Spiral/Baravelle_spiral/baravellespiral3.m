%baravelle spiral
l=1;
theta=0;
xold=0;
yold=0;
total=15;
cmap=jet(total);
for k=1:total
    x=[l 0 0];
    y=[0 0 l];
    [t,r]=cart2pol(x,y);
    [x,y]=pol2cart(t+theta,r);
    patch(x+xold,y+yold,cmap(k,:),'edgecolor','none');
    patch(-(x+xold)+2,-(y+yold)+2,cmap(k,:),'edgecolor','none');
    xold=x(end)+xold;
    yold=y(end)+yold;
    theta=theta-pi/4;
    l=l/sqrt(2);
end
axis equal off