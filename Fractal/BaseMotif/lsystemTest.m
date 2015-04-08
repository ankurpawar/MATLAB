%L system

old_exp='';

for n=1:10
  rule=repmat('F',1,n);  
  old_exp=[rule '+' rule '+' old_exp '+']; 
end

    
phi=45*pi/180;

%spirals
phi2=linspace(0,2*pi,50);
[sx,sy]=pol2cart(phi2,phi2);
sx=(sx-2*pi)/(2*pi);
sx=[sx -fliplr(sx)]+1;
sy=[sy -fliplr(sy)]/(2*pi);
[sphi,rho]=cart2pol((sx)',(sy)');

%calculations for points of string
len_old_exp=length(old_exp);
fIndex=strfind(old_exp,'F');
xx=zeros(length(fIndex)*100,1);
yy=zeros(length(fIndex)*100,1);
xn=0;
yn=0;
xtemp=0;
ytemp=0;
theta=0;
k=1;
for n=1:len_old_exp
   switch (old_exp(n)) 
       case 'F'   %only draw forward
           [xn,yn]=pol2cart(sphi+theta,rho);
            xx(k:k+99,1)=xtemp+xn;
            yy(k:k+99,1)=ytemp+yn;
            xtemp=xtemp+xn(100,1);
            ytemp=ytemp+yn(100,1);
           k=k+100;
       case '-'
           theta=theta+phi; %anticlockwise
       case '+'
           theta=theta-phi; %clockwise
   end
end

choice=0;
if choice
   line(xx,yy,'color',[0.7 0.8 0.4]);
else
   cmap=makeColorMap(rand(1,3),rand(1,3),[0 0 0],500); 
   x=xx(1);
   y=yy(1);
   for n=2:length(xx)
       line([x xx(n)],[y yy(n)],'color',cmap(mod(n,500)+1,:));
       x=xx(n);
       y=yy(n);
   end 

end
axis off equal