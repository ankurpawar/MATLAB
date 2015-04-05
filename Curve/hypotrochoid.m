%hypotrochoid
prompt = {'Enter choice:'};
dlg_title = 'Number';
num_lines = 1;
def = {'1'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
choice=str2num(answer{1});
switch choice
    case 1
        t=0:0.05:7*pi;a=10;b=2;h=3;  
    case 2
        t=0:0.025:2*pi;a=8;b=2;h=5;
    case 3
        t=0:0.025:2*pi;a=9;b=3;h=3;  
    case 4
        t=0:0.025:2*pi;a=10;b=2;h=1;
    case 5
        t=0:0.025:2*pi;a=9;b=3;h=6;      
end
%t=-7*pi:0.001:7.01*pi;a=pi;b=1;

%t=-7*pi:0.001:7.01*pi;a=2*pi;b=1;
%t=-12*pi:0.04:10.01*pi;a=2/pi;b=1;
%t=-12*pi:0.1:10.05*pi;a=2/pi;b=1;



x=(a-b)*cos(t)+h*cos(t*(a-b)/b);
y=(a-b)*sin(t)-h*sin(t*(a-b)/b);
[xc,yc]=pol2cart(t,a);


plot([x;xc],[y;yc],'linewidth',2,'color',[0.4 0.6 0.7]),hold on
plot( x, y,'.','markersize',10,'color',1-[0.4 0.6 0.7]),hold on
plot(xc,yc,'.','markersize',10,'color',[0.2 0.2 0.5]);
axis off equal
str1(1) = {'$ x=(a-b)cos(\theta)+hcos(\theta\frac{a-b}{b})$'};
str1(2) = {'$ y=(a-b)sin(\theta)-hsin(\theta\frac{a-b}{b})$'};
str1(3) = {['$ \theta=0:0.02:' num2str(round(max(t/pi))) '\pi $']};
str1(4) = {['$ a=' num2str(a) ',b=' num2str(b) ',h=' num2str(h) '$']};
text('Interpreter','latex',...
       'String',str1,...
       'Position',[min(min(x)) max(max(y))],...
       'FontSize',20)

axis off equal