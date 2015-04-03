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

%calculations for points of string
len_old_exp=length(old_exp);
fIndex=strfind(old_exp,'F');
xx=zeros(length(fIndex)+1,1);
yy=zeros(length(fIndex)+1,1);
xn=0;
yn=0;
xold=0;
yold=0;
theta=0;
k=2;
for n=1:len_old_exp
   switch (old_exp(n)) 
       case 'F'   %only draw forward
           [xn,yn]=pol2cart(theta,1);
           xx(k)=xn+xx(k-1);
           yy(k)=yn+yy(k-1);
           k=k+1;
       case '-'
           theta=theta+phi; %anticlockwise
       case '+'
           theta=theta-phi; %clockwise
   end
end

cmap=makeColorMap([0.6 0.6 0.1],[0.6 0.3 0.8],[0 0 0],128); 
   x=xx(1);
   y=yy(1);
   for n=2:length(xx)
       line([x xx(n)],[y yy(n)],'color',cmap(mod(n,128)+1,:));
       x=xx(n);
       y=yy(n);
   end 
   axis off equal
axis off square equal