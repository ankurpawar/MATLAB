%Chaotic flow
total=15000;
  x=zeros(total,1);
  y=zeros(total,1);
  z=zeros(total,1);
  x(1)=0.1;
  y(1)=0.1;
  z(1)=0.1;
  dt=0.0175;
choice=10;
switch choice
    case 1
          
          for n=2:total
              x(n)=x(n-1)+ dt*(z(n-1)*y(n-1));
              y(n)=y(n-1)+ dt*(x(n-1)-y(n-1));
              z(n)=z(n-1)+ dt*(1-y(n-1)*x(n-1));
          end
    case 2
          
          for n=2:total
              x(n)=x(n-1)+ dt*(-y(n-1)+z(n-1)^2);
              y(n)=y(n-1)+ dt*(x(n-1)+0.5*y(n-1));
              z(n)=z(n-1)+ dt*(x(n-1)-z(n-1));
          end
    case 3
        dt=0.175;
            for n=2:1500
                  x(n)=x(n-1)+ dt*(y(n-1));
                  y(n)=y(n-1)+ dt*(-x(n-1)+y(n-1)*(1-x(n-1)^2));
                  z(n)=0;
            end
    case 4
          for n=2:total
               x(n)=x(n-1)+ dt*(0.4*x(n-1)+z(n-1));
               y(n)=y(n-1)+ dt*(x(n-1)*z(n-1)-y(n-1));
               z(n)=z(n-1)+ dt*(-x(n-1)+y(n-1));
          end
    case 5
        dt=0.015;
         for n=2:total
                 x(n)=x(n-1)+ dt*(y(n-1)+z(n-1));
                 y(n)=y(n-1)+ dt*(-x(n-1)+0.5*y(n-1));
                 z(n)=z(n-1)+ dt*(x(n-1)^2-z(n-1));
         end
    case 6
        dt=0.005;
         for n=2:total
               x(n)=x(n-1)+ dt*(-y(n-1));
               y(n)=y(n-1)+ dt*(x(n-1)+z(n-1));
               z(n)=z(n-1)+ dt*(x(n-1)*z(n-1)+3*y(n-1)^2);
         end
    case 7
         for n=2:total
               x(n)=x(n-1)+ dt*(y(n-1)*z(n-1));
               y(n)=y(n-1)+ dt*(x(n-1)-y(n-1));
               z(n)=z(n-1)+ dt*(1-x(n-1)^2);
         end
               x(n)=x(n-1)+ dt*(-0.2*y(n-1));
               y(n)=y(n-1)+ dt*(x(n-1)+z(n-1));
               z(n)=z(n-1)+ dt*(x(n-1)+y(n-1)^2-z(n-1));
    case 8
         for n=2:total
               x(n)=x(n-1)+ dt*(2*z(n-1));
               y(n)=y(n-1)+ dt*(-2*y(n-1)+z(n-1));
               z(n)=z(n-1)+ dt*(-x(n-1)+y(n-1)^2+y(n-1));
         end
    case 9
         for n=2:total
               x(n)=x(n-1)+ dt*(x(n-1)*y(n-1)-z(n-1));
               y(n)=y(n-1)+ dt*(x(n-1)-y(n-1));
               z(n)=z(n-1)+ dt*(x(n-1)+0.3*z(n-1));
         end
    case 10
         for n=2:total
               x(n)=x(n-1)+ dt*(-2*y(n-1));
               y(n)=y(n-1)+ dt*(x(n-1)+z(n-1)^2);
               z(n)=z(n-1)+ dt*(1+y(n-1)-2*z(n-1)); 
         end
    case 11
           dt=0.005;
           for n=2:total
               x(n)=x(n-1)+ dt*(y(n-1));
               y(n)=y(n-1)+ dt*(x(n-1)-z(n-1));
               z(n)=z(n-1)+ dt*(x(n-1)+x(n-1)*z(n-1)+2.7*y(n-1)); 
           end
    case 12
           for n=2:total
               x(n)=x(n-1)+ dt*(2.7*y(n-1)+z(n-1));
               y(n)=y(n-1)+ dt*(-x(n-1)+y(n-1)^2);
               z(n)=z(n-1)+ dt*(x(n-1)+y(n-1)); 
           end
    case 13
           for n=2:total    
               x(n)=x(n-1)+ dt*(0.9-y(n-1));
               y(n)=y(n-1)+ dt*(0.4+z(n-1)-y(n-1));
               z(n)=z(n-1)+ dt*(x(n-1)*y(n-1)-z(n-1)); 
          end
          
end
%line(x,y,z,'LineWidth',1,'Color',[0.2 0.3 0.5]);
cmap=jet(65);
gap=round(total/64);
remain=mod(total,64);
count=1;
for k=1:gap:total-gap
line([x(k:k+gap)],[y(k:k+gap)],[z(k:k+gap)],'Color',1-cmap(count,:));
count=count+1;
end
upto=total-remain:total;
%line([x(upto)],[y(upto)],[z(upto)],'LineWidth',1,'Color',cmap(count,:));
%line(x,y,(min(z)-0.1)*ones(size(z)),'LineWidth',1,'Color',[0 0 0]);
axis on square
box on

view(3)
%line(x,y,z,'LineWidth',1,'Color',[0.2 0.3 0.5]);


