%squarespiral
total=20; %keep it even
x=zeros(1,total);
y=zeros(1,total);
xn=0;
yn=0;
rough=-1;
for k=1:total/2-1
    x([2*k+1 2*k+2])=k*rough;
    %x([2*k+1 2*k+2])=k*rough+k*(sin(2.001*pi*k));
    %x([2*k+1 2*k+2])=cos(k*rough);
    %x([2*k+1 2*k+2])=sin(1*k*rough).*cos(1*k*rough);
    %x([2*k+1 2*k+2])=cos(k*2.001*rough);
    %x([2*k+1 2*k+2])=rough*sin(cos(rough)-sin(k*rough));
    %x([2*k+1 2*k+2])=(cos(k*abs(rough))+sin(k*rough));
    rough=-(rough);
end
y(2:end)=x(1:end-1);
[t,r]=cart2pol(x,y);
line(x,y,'color',[0 0 0]),axis equal on tight
daspect([1 1 1])

