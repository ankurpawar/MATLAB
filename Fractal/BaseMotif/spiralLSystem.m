%modified code for base motif fractal
prompt = {'Enter choice:','Iterations'};
dlg_title = 'Number form 1-10';
num_lines = 1;
def = {'1','2'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
choice=str2num(answer{1});
iters=str2num(answer{2});
switch(choice)
    case 1  %cesaro fractal
        angle=[0 pi/2 pi/2 pi/2];     %base
        motif=[85 -170 85]*pi/180;  %motif
    case 2  %cesaro fractal2
        angle  =[0 pi/2 pi/2 pi/2];   %base
        motif=[-85 170 -85]*pi/180; %motif
    case 3  %cesaro fractal3
        angle  =[0 pi/2 pi/2 pi/2];   %base
        motif=[60 -120 60]*pi/180;  %motif
    case 4  %inverse koch
        angle = [0, -2/3*pi, -2/3*pi];%base
        motif=  [-pi/3 2*pi/3 -pi/3]; %motif
    case 5  %koch   snowflake
        angle = [0, -2/3*pi, -2/3*pi];%base
        motif=  [pi/3 -2*pi/3 pi/3]; %motif
    case 6  %hex cesaro
        angle  =[30 60 60 60 60 60]*pi/180;   %base
        motif  =[85 -170 85]*pi/180;         %motif
    case 7
        angle=  [0 pi/2 pi/2 pi/2];   %base
        motif  =[-90 90 90 0 -90 -90 90]*pi/180;         %motif
        iters=2;
    case 8    %Koch curve
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[-90 90 90 -90]*pi/180;         %motif
    case 9    %box fractal
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[90 -90 -90 90]*pi/180;         %motif
    case 10    %unkonown
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[-45 -135 225 -45]*pi/180;         %motif
    case 11    %
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[45 135 -225 45]*pi/180;         %motif
    case 12    %
        angle  =[0 90 90 90]*pi/180;   %base
        motif  =[45 135 -225 45]*pi/180;         %motif
        
end


l = 1;
motif_len=length(motif);
motif_len_2=motif_len+1;
for i=1:iters
    l = l/3;
    angle1 = zeros([4*length(angle),1]);
    for j=1:length(angle)
        % insert the Koch generator here
        angle1(motif_len_2*j-motif_len:motif_len_2*j) = [angle(j) motif];
        %angle1(4*j-3:4*j) = [angle(j) motif];
    end
    angle = angle1;
end

x = zeros(length(angle)*100, 1);
y = zeros(length(angle)*100, 1);

phi2=linspace(0,2*pi,50);
[sx,sy]=pol2cart(phi2,phi2);
sx=(sx-2*pi)/(2*pi);
sx=[sx -fliplr(sx)]+1;
sy=[sy -fliplr(sy)]/(2*pi);
[sphi,rho]=cart2pol((sx)',(sy)');

xtemp = 0; ytemp = 0;
phi=0;
n=1;
for k=1:100:length(x);
    phi = phi+angle(n);
    
    [x1,y1]=pol2cart(sphi+phi,rho);
    x(k:k+99,1)=xtemp+x1;
    y(k:k+99,1)=ytemp+y1;
    xtemp=xtemp+x1(100,1);
    ytemp=ytemp+y1(100,1);
    
    
    n=n+1;
end



choice=0;
if choice
    line(x,y);
else
    cmap=makeColorMap(rand(1,3),rand(1,3),[0 0 0],500);
    xtemp=x(1);
    ytemp=y(1);
    for n=2:length(x)
        line([xtemp x(n)],[ytemp y(n)],'color',cmap(mod(n,500)+1,:));
        xtemp=x(n);
        ytemp=y(n);
    end
    %set(gcf,'color',[0 0 0])
end
axis off equal

