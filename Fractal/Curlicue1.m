function Curlicue1
s = sqrt(2)*0.0196;
theta = 0;
phi = 0;
total = 10000;
curx = zeros(1,total);
cury = zeros(1,total);
xn = 0;
yn = 0;
for k = 1:total
    theta = mod(theta+2*pi*s,2*pi);
    phi = mod(phi,2*pi)+theta;
    [x,y] = pol2cart(phi,1);
    xn = x+xn;
    yn = y+yn;
    curx(k) = xn;
    cury(k) = yn;
end
line(curx,cury,'linewidth',1,'color','k');
axis off equal
set(gcf,'color',[1 1 1])
end