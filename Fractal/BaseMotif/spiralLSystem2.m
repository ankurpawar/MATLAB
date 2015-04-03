%L system
prompt = {'Enter choice:','Iterations'};
dlg_title = 'Number';
num_lines = 1;
def = {'1','2'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
choice=str2num(answer{1});
iters=str2num(answer{2});
switch(choice)
    case 1 %Levy c curve
        base='F';
        motif='-F++F-';
        phi=pi/4;
    case 2 %Koch curve
        base='F';
        motif='F+F-F-F+F';
        phi=pi/2;
    case 3 %Pentaflake   4iterations
        base='F++F++F++F++F';
        motif='F++F++F+++++F-F++F ';
        phi=36*pi/180;
    case 4
        base='F+F+F+F';
        motif='FF+F++F+F';
        phi=pi/2;  %4 iterations
    case 5
        base='F+F+F+F';
        motif='FF+F+F+F+F+F-F';
        phi=pi/2;  %4 iterations
    case 6
        base='F+F+F+F';
        motif='FF+F+F+F+FF';
        phi=pi/2;   %3 iterations
    case 7  %Pentigree
        base='F-F-F-F-F';
        motif='F-F++F+F-F-F';
        phi= 72*pi/180; %3 iterations
    case 8 %   4iterations
        base='F';
        motif='F+++F---F';
        %motif='F-FF-F-FF-F';
        phi=30*pi/180;
    case 9 %Koch curve2
        base='F';
        motif='F+F-F-F+F';
        phi=85*pi/180;
end
old_exp=base;
new_exp=[];

%expansion of string
for n=1:iters
    new_exp=[];
    len_old_exp=length(old_exp);
    for nn=1:len_old_exp
        if old_exp(nn)=='F'
            new_exp=[new_exp motif];
        else
            new_exp=[new_exp old_exp(nn)];
        end
    end
    clear('old_exp');
    old_exp=new_exp;
    clear('new_exp');
    if length(old_exp)>=50000
        disp('No more iterations');
        break;
    end
end

%spirals
phi2=linspace(0,2*pi,50);
[sx,sy]=pol2cart(phi2,phi2);
sx=(sx-2*pi)/(2*pi);
sx=[sx -fliplr(sx)]+1;
sy=[sy -fliplr(sy)]/(2*pi);
[sphi,rho]=cart2pol((sx)',(sy)');

%calculations for points of string
len_old_exp=length(old_exp);
fIndex=strfind(old_exp,'F');
xx=zeros(length(fIndex)*100,1);
yy=zeros(length(fIndex)*100,1);
xn=0;
yn=0;
xtemp=0;
ytemp=0;
theta=0;
k=1;
for n=1:len_old_exp
    switch (old_exp(n))
        case 'F'   %only draw forward
            [xn,yn]=pol2cart(sphi+theta,rho);
            xx(k:k+99,1)=xtemp+xn;
            yy(k:k+99,1)=ytemp+yn;
            xtemp=xtemp+xn(100,1);
            ytemp=ytemp+yn(100,1);
            k=k+100;
        case '-'
            theta=theta+phi; %anticlockwise
        case '+'
            theta=theta-phi; %clockwise
    end
end

choice=1;
if choice
    line(xx,yy,'color',[0.7 0.8 0.4]);
else
    cmap=makeColorMap(rand(1,3),rand(1,3),[0 0 0],500);
    x=xx(1);
    y=yy(1);
    for n=2:length(xx)
        line([x xx(n)],[y yy(n)],'color',cmap(mod(n,500)+1,:));
        x=xx(n);
        y=yy(n);
    end
    
end
axis off equal