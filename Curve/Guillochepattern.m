%Guilloché patterns,not exactly 


t=0:0.001:3;
choice=7;
switch choice
    case 1
        for n=1:10
         x=(16+2*cos(35*pi*2*t-0.25*pi*n)).*(cos(2*pi*t));
         y=(16+2*cos(35*2*pi*t-0.25*pi*n)).*(sin(2*pi*t));
        line(x,y)
        end
    case 2
        for n=1:10
         x=(16+2*cos(35*pi*2*t-0.25*pi*n)).*(cos(2*pi*t));
         y=(16+2*cos(35*2*pi*t-0.25*pi*n)).*(sin(1*pi*t));
        line(x,y)
        end
    case 3
        cmap=1-copper(30);
        for n=30:-1:1
         x=(n+16+2*cos(25*pi*2*t-0.25*pi*n)).*(cos(2*pi*t));
         y=(n+16+2*cos(25*2*pi*t-0.25*pi*n)).*(sin(2*pi*t));
        %line(x,y)
        patch(x,y,'r','facecolor',cmap(n,:),'edgecolor','none');
        end    
    case 4
      cmap=hsv(5) ;
      for nn=1:5  
        for n=1:10
         x=(4*nn+10+2*cos(25*pi*2*t-0.25*pi*n)).*(cos(2*pi*t));
         y=(4*nn+10+2*cos(25*2*pi*t-0.25*pi*n)).*(sin(2*pi*t));
        line(x,y,'color',cmap(nn,:));
        end     
      end 
    case 5
        for n=1:10
         x=(16+2*cos(10*pi*2*t-0.25*pi*n)).*(cos(3*pi*t));
         y=(16+2*cos(10*2*pi*t-0.25*pi*n)).*(sin(2*pi*t));
        line(x,y)
        end  
    case 6
        for n=1:10
         x=(16+2*cos(10*pi*2*sin(2*pi*t)-0.25*pi*n)).*(cos(2*pi*t));
         y=(16+2*cos(10*2*pi*sin(2*pi*t)-0.25*pi*n)).*(sin(2*pi*t));
        line(x,y)
        end      
     case 7
        for n=1:10
         x=(1+2*cos(5.0*pi*t-0.25*pi*n));
         y=(1+2*cos(5.5*pi*t-0.25*pi*n));
        line(x,y)
        end
end
axis equal