%squarespiral
k=1;
x=0;
y=0;
xold=0;
yold=0;
theta=0;
for n=0:50*pi
    theta=theta+pi/2.25;
    [x,y]=pol2cart(theta,k);
    line([x+xold xold],[y+yold yold]);
    %if mod(n,2)
    k=k+1;
    %end
    xold=xold+x;
    yold=yold+y;
end
axis equal off