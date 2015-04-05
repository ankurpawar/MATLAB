%stringart1
%t=linspace(0,2*pi,50);
choice=1;
if choice==1
    
    t=linspace(0,2*pi,20);
    t=t(1:end-1);
    r=sin(t);
    [x,y]=pol2cart(t,r);
    %x=[1:10];y=[ones(1:10)];
    
    a=1:length(x);
    b=circshift(a,[1 -5]);
    plot([x(b);x(a)],[y(b);y(a)],'color',[0 0 0]),hold on
    %line(x,y)
    axis equal
else
    total=20;
    x1=linspace(0,8,total);
    y1=zeros(1,length(x1));
    y2=linspace(0,8,total);
    x2=8+zeros(1,length(y2));
    line([x1 ;x2],[y1; y2],'color',[0 0 0],'linewidth',1),hold on
    axis equal tight
end