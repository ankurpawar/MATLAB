%logspiral
%t=1:1/exp(pi):10*pi;
t=1:0.5/(2*exp(1)):10*pi;
r=log(t);
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
h_s=scatter(x(:)',y(:)',15,(x(:)'.*y(:)'),'filled');axis square off;
colormap hsv
legend('t=1:0.5/(2*exp(1)):10pi,r=log(t)')