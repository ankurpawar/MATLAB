function tileBaravelle3
%generalized baravelle spiral
N=3;
const=0.866; %sqrt(3)/2
phi=pi/N;
t=linspace(0+phi+pi/6,2*pi+phi+pi/6,N+1);
len=1;
cmap=makeColorMap([1 0.8 0.1],[0.6 0.8 1],N);
theta=0;
for row=1:6
    xoff=2*const*row;
    
    for col=1:6
        yoff=1.732*const*col;
        if mod(col,2)
            xoff=xoff+const;
        else
            xoff=xoff-const;
        end
        for n=1:N
            len=1;
            theta=0;
            for k=1:10
                [x,y]=pol2cart([phi 2*phi 3*phi]+t(n)+theta...
                    ,[len*cos(pi/N),len,len*cos(pi/N)]);
                if k==1
                    offx=x(2);
                    offy=y(2);
                end
                
                patch(x-offx+xoff,y-offy+yoff,'r'...
                    ,'facecolor',cmap(n,:)/sqrt(k)...
                    ,'edgecolor',cmap(n,:)/sqrt(k),'linewidth',0.1);
                theta=theta+phi;
                len=len*cos(pi/N);
            end
        end
    end
end
axis equal off
end