function truchettiling
%truchet tiling
total=25;
for n=1:total
    for m=1:total
        if rand>0.5
            [x,y]=truchet(2);
        else
            [x,y]=truchet(1);
        end
        line(x+n,y+m,'color','k');
    end
end
axis equal off
end

function [x,y] = truchet(choice)
noofpoints=15;
if choice==1
    t1=linspace(0,pi/2,noofpoints)';
    t2=linspace(pi,3*pi/2,noofpoints)';
    r=0.5*ones(length(t1),2);
    [x,y]=pol2cart([t1 t2],r);
    x(:,2)=x(:,2);
    y(:,2)=y(:,2)+1;
    x(:,1)=x(:,1)-1;
else
    t1=linspace(pi/2,pi,noofpoints)';
    t2=linspace(3*pi/2,2*pi,noofpoints)';
    r=0.5*ones(length(t1),2);
    [x,y]=pol2cart([t1 t2],r);
    x(:,2)=x(:,2)-1;
    y(:,2)=y(:,2)+1;
end
end