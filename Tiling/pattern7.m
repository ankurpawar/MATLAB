function pattern7
cmap=[0.9 0.8 0.2;
    0.9 0.2 0.8];
for m=1:8
    for n=1:8
        [x,y]=tile(1);
        patch(x+2*n,y+2*m,cmap(1,:),'edgecolor','none');
        [x,y]=tile(2);
        patch(x+2*n+1,y+2*m+1,cmap(2,:),'edgecolor','none');
    end
end
axis equal off
end

function [xb,yb]=tile(choice)
switch choice
    case 1
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x+1,y+1);
        [xb,yb]=polybool('subtraction',xa,ya,x-1,y-1);
    case 2
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x-1,y+1);
        [xb,yb]=polybool('subtraction',xa,ya,x+1,y-1);     
end
end