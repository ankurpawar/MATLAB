%s=2  ;%seed
d=4.66920160910299067185320382046620  ;%seed
s=9*d;
s=d;
%s=pi;
eulers = 0.577215664901532860606512;
%s=eulers;

theta=0;
phi=0;
%total=1465;
total=5000;
curx=zeros(1,total);
cury=zeros(1,total);
xn=0;
yn=0;
for k=1:total
    theta=mod(theta+2*pi*s,2*pi);
    phi=mod(phi,2*pi)+theta;
    
    %phi=mod(phi+2*pi*mod(7*k+41,511)*s,2*pi); 
    
    [x,y]=pol2cart(phi,1);
    xn=x+xn;
    yn=y+yn;
    curx(k)=xn;
    cury(k)=yn;
end
line(curx,cury,'linewidth',1)
axis equal
