%truchet tiling
function truchettiling4

%cmap=hsv(total^2);

choice=1;
check_arr=repmat([1 0;0 1],16,10);
[row column]=size(check_arr);
for n=1:row
    for m=1:column
        
        choice=check_arr(n,m);
        r=rand;
        
        [x,y]=truchet(choice,r);
        patch(x+n,y+m,[0 0.5 1],'edgecolor',[0 0.5 1]);
        %patch(x+n,y+m,'k','facecolor',cmap(n*m,:),'edgecolor','none');
        
    end
end
axis equal off

function [x,y]=truchet(choice,ran)
noofpoints=15;
r=0.5;
if choice==0
    if ran>0.5
        t1=linspace(0,pi/2,noofpoints)';
        t2=linspace(pi,3*pi/2,noofpoints)';
        [x,y]=pol2cart([t1 t2],r);
        x=[x;0 0];
        y=[y;0 0];
        
        x(:,2)=x(:,2)+1;
        y(:,2)=y(:,2)+1;
    else
        t1=linspace(pi,pi/2,noofpoints);
        t2=linspace(2*pi,3*pi/2,noofpoints);
        [x1,y1]=pol2cart(t1,r);
        [x2,y2]=pol2cart(t2,r);
        
        x1=x1+1;
        y2=y2+1;
        x=[0 x1 1 x2];
        y=[0 y1 1 y2];
    end
elseif choice==1
    if ran>0.5
        t1=linspace(pi/2,pi,noofpoints)';
        t2=linspace(3*pi/2,2*pi,noofpoints)';
        [x,y]=pol2cart([t1 t2],r);
        x=[x;0 0];
        y=[y;0 0];
        
        x(:,1)=x(:,1)+1;
        y(:,2)=y(:,2)+1;
    else
        t1=linspace(pi/2,0,noofpoints);
        t2=linspace(3*pi/2,pi,noofpoints);
        [x1,y1]=pol2cart(t1,r);
        [x2,y2]=pol2cart(t2,r);
        
        x2=x2+1;
        y2=y2+1;
        x=[x1 1 x2 0];
        y=[y1 0 y2 1];
    end
end