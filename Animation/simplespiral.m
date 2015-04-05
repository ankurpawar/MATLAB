%simple spiral
t=0:1/sqrt(2*pi):5*pi;
%t=0.5:1/log(8):5*pi;%h_s=scatter(x(:)',y(:)',30+4*((x(:)').^2+(y(:)').^2),s
%qrt((x(:)').^2+(y(:)').^2),'filled');axis square off;
r=t;
lent=length(t);

x=zeros(8,lent);
y=zeros(8,lent);
x2=zeros(8,lent);
y2=zeros(8,lent);

pd=-0.75:0.25:1;

for n=1:8
x(n,:)=r.*cos(t+pd(n)*pi);
y(n,:)=r.*sin(t+pd(n)*pi);

x2(n,:)=r.*cos(t+pd(n)*pi);
y2(n,:)=-r.*sin(t+pd(n)*pi);
end
%h_p=plot(x,y,'.','markersize',15);
%plot(x2,y2,'.','color',[0.2 0.3 0.4],'markersize',15);hold off

axis square off

%get(h(1))
h_s=scatter(x(:)',y(:)',20+1*((x(:)').^2+(y(:)').^2),sqrt((x(:)').^2+(y(:)').^2),'filled');axis square off;
colormap copper
%legend('t=0.5:1/3:5pi,r=(t)')
str1(1) = {['$r(\theta)=\theta$']};

%str1(2) = {' '};

str1(2) = {'$\theta = 0.5: \frac{1}{log_e8}: 5\pi$'};


%axes('position',[.1  .7  .8  .2])
text('Interpreter','latex',...
       'String',str1,...
       'Position',[max(max(x))-0.1 max(max(y))],...
       'FontSize',20)
axis off