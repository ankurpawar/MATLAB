%epitrochoid
choice=1;
switch choice
    case 1
        t=0:0.02:2*pi;a=9;b=3;h=3;
    case 2
        t=0:0.025:2*pi;a=8;b=2;h=5;
    case 3
        t=0:0.025:2*pi;a=10;b=2;h=5;
    case 4
        t=0:0.025:2*pi;a=6;b=2;h=3;
        
end
%t=-7*pi:0.001:7.01*pi;a=2*pi;b=1;
%t=-12*pi:0.04:10.01*pi;a=2/pi;b=1;
%t=-12*pi:0.1:10.05*pi;a=2/pi;b=1;
%t=-12*pi:0.1:10.05*pi;a=2/pi;b=1;h=2;
[xc,yc]=pol2cart(t,a);
x=(a+b)*cos(t)-h*cos(t*(a+b)/b);
y=(a+b)*sin(t)-h*sin(t*(a+b)/b);


plot([x;xc],[y;yc],'linewidth',2,'color',[0.3 0.4 0.7]),hold on
plot( x, y,'.','markersize',10,'color',1-[0.3 0.4 0.7]),hold on
plot(xc,yc,'.','markersize',10,'color',[1-0.3 1-0.4 0.7]);
axis off equal
str1(1) = {'$ x=(a+b)cos(\theta)-hcos(\theta\frac{a+b}{b})$'};
str1(2) = {'$ y=(a+b)sin(\theta)-hsin(\theta\frac{a+b}{b})$'};
str1(3) = {['$ \theta=0:0.02:' num2str(round(max(t/pi))) '\pi $']};
str1(4) = {['$ a=' num2str(a) ',b=' num2str(b) ',h=' num2str(h) '$']};
text('Interpreter','latex',...
    'String',str1,...
    'Position',[min(min(x)) max(max(y))],...
    'FontSize',20)
