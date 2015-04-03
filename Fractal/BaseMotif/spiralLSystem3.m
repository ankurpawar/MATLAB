%L system
% 'F' draw forward
% phi angle
% '+' clockwise turn by phi angle,'-' anticlockwise turn by phi angle
% 'X' do nothing,'Y'do nothing
% 'A' draw forward,'B' draw forward
prompt = {'Enter choice:','Iterations'};
dlg_title = 'Number';
num_lines = 1;
def = {'1','2'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
choice=str2num(answer{1});
iters=str2num(answer{2});
switch(choice)
    case 1 %Sierpinski triangle
        base='A';
        rule1='B-A-B';
        rule2='A+B+A';
        phi=pi/3;  %8 iterations
    case 2 %Dragon curve
        base='FX';
        rule1='X+YF';
        rule2='FX-Y';
        phi=pi/2;  %13 iterations
    case 3
        base='F+XF+F+XF';
        rule1='XF-F+F-XF+F+XF-F+F-X';
        rule2='Y';
        phi=pi/2;  %4 iterations
    case 4
        base='Y';
        rule1='XF+F+XF-F-F-XF-F+F+F-F+F+F-X';
        rule2='XF+F+XF+F+XF+F';
        phi=pi/3;  %4 iterations
    case 5    %Pentant  %3 iterations
        base='X-X-X-X-X';
        rule1='FX-FX-FX+FY+FY+FX-FX';
        rule2='FY+FY-FX-FX-FY+FY+FY';
        phi=72*pi/180;
    case 6    %Hilbert curve
        % L ? +RF?LFL?FR+
        % R ? ?LF+RFR+FL?
        base='Y';
        rule1='-YF+XFX+FY-';
        rule2='+XF-YFY-FX+';
        phi=90*pi/180;
    case 7 %Dragon curve 2
        base='-X';
        rule1='X+F+Y';
        rule2='X-F-Y';
        phi=pi/4;  %7 iterations
    case 8   %sirepinski 6 iterations
        base='Y--F--Y--F';
        rule1='-Y+F+Y-';
        rule2='+X-F-X+';
        phi =pi/4;
end
old_exp=base;
new_exp=[];

%expansion of string
for n=1:iters
    new_exp=[];
    len_old_exp=length(old_exp);
    for nn=1:len_old_exp
        if old_exp(nn)=='A'
            new_exp=[new_exp rule1];
        elseif old_exp(nn)=='B'
            new_exp=[new_exp rule2];
        elseif old_exp(nn)=='X'
            new_exp=[new_exp rule1];
        elseif old_exp(nn)=='Y'
            new_exp=[new_exp rule2];
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
        case 'A'   %only draw forward
            [xn,yn]=pol2cart(sphi+theta,rho);
            xx(k:k+99,1)=xtemp+xn;
            yy(k:k+99,1)=ytemp+yn;
            xtemp=xtemp+xn(100,1);
            ytemp=ytemp+yn(100,1);
            k=k+100;
        case 'B'   %only draw forward
            [xn,yn]=pol2cart(sphi+theta,rho);
            xx(k:k+99,1)=xtemp+xn;
            yy(k:k+99,1)=ytemp+yn;
            xtemp=xtemp+xn(100,1);
            ytemp=ytemp+yn(100,1);
            k=k+100;
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
        otherwise
            %do nothing
    end
end

choice=0;
if choice
    line(xx,yy);
else
    cmap=makeColorMap(rand(1,3),rand(1,3),rand(1,3),300);
    x=xx(1);
    y=yy(1);
    for n=2:length(xx)
        line([x xx(n)],[y yy(n)],'color',cmap(mod(n,300)+1,:));
        x=xx(n);
        y=yy(n);
    end
    
end
axis off equal