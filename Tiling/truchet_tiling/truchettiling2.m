%truchet tiling
function truchettiling2

total=30;
cmap=hsv(total*2);
colors=pink(4);
for n=1:total
    for m=1:total
        r=rand;
        if r>0.75
            [x,y]=truchet(1);
        elseif r>0.5
            [x,y]=truchet(2);
        elseif r>0.25
            [x,y]=truchet(3);
        else
            [x,y]=truchet(4);
        end
        %patch(x+n,y+m,'k','facecolor',cmap(n+m,:),'edgecolor',cmap(n+m,:));
        patch(x+n,y+m,'k','facecolor',colors(randi(4),:),'edgecolor','none');
    end
end
axis equal off

function [x,y]=truchet(choice)
switch(choice)
    
    case 1
        x=[0 1 0];
        y=[0 0 1];
    case 2
        x=[0 1 1];
        y=[0 0 1];
    case 3
        x=[0 1 0];
        y=[0 1 1];
    case 4
        x=[1 1 0];
        y=[0 1 1];
end