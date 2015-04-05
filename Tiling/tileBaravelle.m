function tileBaravelle
%square baravelle spiral
N=4;
phi=pi/N;
t=linspace(0+phi,2*pi+phi,N+1);
len=1;
cmap=pink(N);

theta=0;

px=[-0.707 0.707 0.707 -0.707];
py=[-0.707 -0.707 0.707 0.707];

for row=1:4
    for col=1:4
        len=1;
        theta=0;
        xoff=1.414*row;
        yoff=1.414*col;
        
        for k=1:20
            for n=1:N
                [x,y]=pol2cart([phi 2*phi 3*phi]+t(n)+theta,[len*cos(pi/N),len,len*cos(pi/N)]);
                patch(x+xoff,y+yoff,'r','facecolor',cmap(n,:)/sqrt(k),'edgecolor',cmap(n,:)/sqrt(k));
            end
            theta=theta+phi;
            len=len*cos(pi/N);
        end
    end
end

axis equal off

