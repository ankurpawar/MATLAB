%GumowskiMira1
total=20000;
xarr=zeros(total,1);
yarr=zeros(total,1);
xn=1;
yn=1;
x=0;
y=0;
%a=-0.77;b=0.95;
%a=-0.23;b=1;
a=0.31;b=1;

for k=1:total
    xn =  b * yn +a*x  +2*(x)^2*(1 - a)/(1 + x^2);
    yn = -x +a*xn +2 *(xn)^2 *(1 - a)/(1 +xn^2);
    
    %xn = b * yn +a*x  +2*(x)^2 *(1 - a)/(1 + (x)^2);
    %yn = -x    +a*xn +2*(xn)^2*(1 - a)/(1 + (xn)^2);
    x=xn;
    xarr(k)=x;
    yarr(k)=yn;
end
plot(xarr,yarr,'.')