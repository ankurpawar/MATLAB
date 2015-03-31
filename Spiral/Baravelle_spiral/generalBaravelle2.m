function generalBaravelle2
%generalized baravelle spiral
N=4;
phi=pi/N; 
t=linspace(0+phi,2*pi+phi,N+1);
len=1;
cmap=1-copper(N);
theta=0;
%patch([-10 10 10 -10],[-10 -10 10 10],[0.75 0.75 0.75]);
for n=1:N
    len=1;
    theta=0;
    for k=1:9
        [x,y]=pol2cart([phi 2*phi 3*phi]+t(n)+theta,[len*cos(pi/N),len,len*cos(pi/N)]);
        if k==1
           offx=x(2);
           offy=y(2);
        end
        %patch(x+x(1),y+y(1),'r','facecolor',cmap(n,:),'edgecolor','k');
        patch(x-offx,y-offy,'r','facecolor',cmap(n,:),'edgecolor','k');
        theta=theta+phi;
        len=len*cos(pi/N);
    end
    
    
end

%axis([-1 1 -1 1]) 
%axis([-1.3 1.3 -1.3 1.3]) %for N=6;
axis equal on

