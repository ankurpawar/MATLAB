%dragon curve
dvec=[1];
rough=[];
len_dvec=1;
iters=5;  %dont exceed 12
for loop_count=1:iters
    len_dvec=length(dvec);
    rough=dvec;
    rough(len_dvec*0.5+0.5)=0;
    dvec=[dvec 1 rough];
end

x=0;y=0;
len_dvec=length(dvec);
theta=0;

phi=linspace(0,2*pi,50);
[sx,sy]=pol2cart(phi,phi);
sx=(sx-2*pi)/(2*pi);
sx=[sx -fliplr(sx)]+1;
sy=[sy -fliplr(sy)]/(2*pi);

%line(sx,sy)
[sphi,rho]=cart2pol((sx)',(sy)');

x1=0;y1=0;x=0;y=0;
x_arr=zeros(100*len_dvec,1);
y_arr=zeros(100*len_dvec,1);
n=1;
for k=1:100:len_dvec*100
    if dvec(n)==1
        [x1,y1]=pol2cart(sphi+theta,rho);
        x_arr(k:k+99,1)=x+x1;
        y_arr(k:k+99,1)=y+y1;
        x=x+x1(100,1);y=y+y1(100,1);
        theta=theta+pi/2;
        
    else
        [x1,y1]=pol2cart(sphi+theta,rho);
        x_arr(k:k+99,1)=x+x1;
        y_arr(k:k+99,1)=y+y1;
        x=x+x1(100,1);y=y+y1(100,1);
        theta=theta-pi/2;
        
    end
    n=n+1;
end

choice=1;
if choice
    line(x_arr,y_arr,'color','k'),axis equal on
else
    cmap=makeColorMap([0.6 0.6 0.1],[0.6 0.3 0.8],[0 0 0],500);
    
    for n=1:100:length(x_arr)
        line(x_arr(n:n+99),y_arr(n:n+99),'color',cmap(mod(n,500)+1,:));
    end
    axis off equal
    
end