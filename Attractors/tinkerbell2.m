%tinkerball map
%x(n+1) = xn^2 - yn^2 + 0.9*xn + 0.6013* yn ;
%y(n+1) = 2*xn*yn - 2*xn + 0.5* yn ;
%runtime:about 15 second

N = 6000000;
res = 1000;
xn = 0.001;
yn = 0.001;
%a=0.3; b=0.6; c=2; d=0.27;
x = linspace(-1.3,0.5,res);
y = linspace(-0.8,1.8,res);
xdiff = x(2)-x(1);
ydiff = y(2)-y(1);
minx = min(x);
miny = min(y);
img = zeros(res,res,3);
sensitivity = 0.02;
xn = 0.001;
yn = 0.001;
a = 0.9;
b = 0.6013;
c = 2;
d = 0.5;
rr = zeros(1,6);
gg = zeros(1,6);
bbb = zeros(1,6);
old_rough = 1;
for n = 1:N
    aa = mod(xn,1);
    s = 1;
    v = 1;
    zo = floor(6*aa);
    rough = (zo);
    f = aa*6 - zo;
    p = v*(1-s);
    q = v*(1-s*f);
    t = v*(1-s*(1-f));
    
    %            switch (rough)
    %           case 0
    %                 r=v; g=t; bb=p;
    %           case 1
    %                 r=q; g=v; bb=p;
    %           case 2
    %                 r=p; g=v; bb=t;
    %           case 3
    %                 r=p; g=q; bb=v;
    %           case 4
    %                 r=t; g=p; bb=v;
    %           case 5
    %                 r=v; g=p; bb=q;
    %           end
    rough = rough+1;
    if rough <= 6
        rr= [v q p p t v];
        gg= [t v v q p p];
        bbb=[p p t v v q];
        old_rough=rough;
    else
        rough=old_rough;
    end
    xi = xn^2 - yn^2 + a*xn + b*yn;
    yi = 2*xn*yn - c*xn + d*yn;
    xn = xi;
    yn = yi;
    indx = floor((xi-minx)/xdiff);
    indy = floor((yi-miny)/ydiff);
    img(indx,indy,1) = img(indx,indy,1) + rr(rough);
    img(indx,indy,2) = img(indx,indy,2) + gg(rough);
    img(indx,indy,3) = img(indx,indy,3) + bbb(rough);
end
%h=fspecial('average',2);
%img=imfilter(img,h);
image(uint8(img));

%imwrite(uint8(img),'tinkerballmap.png','png');