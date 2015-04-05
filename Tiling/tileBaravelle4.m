function tileBaravelle4
%generalized baravelle spiral
N=4;
root2=sqrt(2);
phi=pi/N; 
t=linspace(0+phi,2*pi+phi,N+1);
len=1;
cmap=makeColorMap([1 0.75 0.6],[0.5 0.8 1],N);
theta=0;
%patch([-10 10 10 -10],[-10 -10 10 10],[0.75 0.75 0.75]);
for row=1:4
    xoff=2*root2*row;
    
    for col=1:6
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
                [x,y]=pol2cart([phi 2*phi 3*phi]+t(n)+theta,[len*cos(pi/N),len,len*cos(pi/N)]);
                if k==1
                   offx=x(2);
                   offy=y(2);
                end
             
                patch(x-offx+xoff,y-offy+yoff,'r','facecolor',cmap(n,:)/sqrt(k),'edgecolor',cmap(n,:)/sqrt(k),'linewidth',0.1);
                patch(-x+offx+xoff,y-offy+yoff,'r','facecolor',cmap(n,:)/sqrt(k),'edgecolor',cmap(n,:)/sqrt(k),'linewidth',0.1);
                theta=theta+phi;
                len=len*cos(pi/N);
            end
        end
        
        
    end
end
%axis([-1 1 -1 1]) 
%axis([-1.3 1.3 -1.3 1.3]) %for N=6;
axis equal off

