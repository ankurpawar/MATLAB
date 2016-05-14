function tileBaravelle6
%generalized baravelle spiral
N=4;
root2=sqrt(2);
phi=pi/N;
t=linspace(0+phi,2*pi+phi,N+1);
len=1;
cmap=[0 1 1;1 1 0;0 1 1;1 1 0];
theta=0;
for row=1:2
    xoff=2*root2*row;    
    for col=1:4
        yoff=1*root2*col;
        if mod(col,2)
            xoff=xoff+root2;
        else
            xoff=xoff-root2;
        end
        for n=[2 4]
            len=1;
            theta=0;
            for k=1:15
                [x,y]=pol2cart([phi 2*phi 3*phi]+t(n)+theta...
                    ,[len*cos(pi/N),len,len*cos(pi/N)]);
                if k==1
                    offx1=x(2);
                    offy1=y(2);
                end
                
                patch(x-offx1+xoff,y-offy1+yoff,'r'...
                    ,'facecolor',cmap(n,:)/sqrt(k),...
                    'edgecolor',cmap(n,:)/sqrt(k),'linewidth',0.01);
                patch(-x+offx1+xoff,y-offy1+yoff,'r'...
                    ,'facecolor',cmap(n,:)/sqrt(k),...
                    'edgecolor',cmap(n,:)/sqrt(k),'linewidth',0.01);
                theta=theta+phi;
                len=len*cos(pi/N);
            end
        end
        
        yoff2=1*root2*col;
        if mod(col,2)
            xoff2=xoff-root2;
        else
            xoff2=xoff+root2;
        end
        for n=[1 3]
            len=1;
            theta=0;
            for k=1:15
                [x,y]=pol2cart([phi 2*phi 3*phi]+t(n)+theta...
                    ,[len*cos(pi/N),len,len*cos(pi/N)]);
                if k==1
                    offx=x(2);
                    offy=y(2);
                end
                patch(x-offx+xoff2,y-offy+yoff2,'r'...
                    ,'facecolor',cmap(n,:)/sqrt(k),...
                    'edgecolor',cmap(n,:)/sqrt(k),'linewidth',0.01);
                patch(x-offx+xoff2,-y+offy+yoff2,'r'...
                    ,'facecolor',cmap(n,:)/sqrt(k),...
                    'edgecolor',cmap(n,:)/sqrt(k),'linewidth',0.01);
                theta=theta+phi;
                len=len*cos(pi/N);
            end
        end
    end
end
axis equal off
set(gcf,'color',[1 1 1]);
end