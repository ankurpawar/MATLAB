function generalBaravelle
%generalized baravelle spiral
N=4;
phi=pi/N; 
t=linspace(0+phi,2*pi+phi,N+1);
len=1;
cmap=1-copper(N);
theta=0;
patch([-10 10 10 -10],[-10 -10 10 10],[0.75 0.75 0.75]);
for k=1:15
    for n=1:N
        [x,y]=pol2cart([phi 2*phi 3*phi]+t(n)+theta,[len*cos(pi/N),len,len*cos(pi/N)]);
        patch(x,y,'r','facecolor',cmap(n,:),'edgecolor',cmap(n,:));
    end
    theta=theta+phi;
    len=len*cos(pi/N);
end

axis([-1 1 -1 1]) 
%axis([-1.3 1.3 -1.3 1.3]) %for N=6;
axis equal off

