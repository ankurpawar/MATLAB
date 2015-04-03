%truchet tiling
function truchettiling3

total=20;
cmap=hsv(total^2);
colors=pink(4);
for n=1:total
    for m=1:total
        
        if rand>0.5
            [x,y]=truchet(2);
            %patch(x+n,y+m,'y');
        else
            [x,y]=truchet(1);
            %patch(x+n,y+m,'r');
        end
        %patch(x+n,y+m,'k','edgecolor','k');
        %patch(x+n,y+m,'k','facecolor',cmap(n*m,:),'edgecolor',cmap(n*m,:));
        
        patch(x+n,y+m,'k','facecolor',colors(randi(4),:),'edgecolor','none');
        %line(n,m)
    end
end
axis equal off

function [x,y]=truchet(choice)
noofpoints=15;
if choice==1
    t1=linspace(0,pi/2,noofpoints)';
    t2=linspace(pi,3*pi/2,noofpoints)';
    r=0.5*ones(length(t1),2);
    [x,y]=pol2cart([t1 t2],r);
    x=[x;0 0];
    y=[y;0 0];
    
    x(:,1)=x(:,1)-1;
    y(:,2)=y(:,2)+1;
    
else
    t1=linspace(pi/2,pi,noofpoints)';
    t2=linspace(3*pi/2,2*pi,noofpoints)';
    r=0.5*ones(length(t1),2);
    [x,y]=pol2cart([t1 t2],r);
    x=[x;0 0];
    y=[y;0 0];
    
    x(:,2)=x(:,2)-1;
    y(:,2)=y(:,2)+1;
end