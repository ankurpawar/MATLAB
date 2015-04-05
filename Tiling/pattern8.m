%pattern8
function pattern8
cmap=pink(4);
rough=-1;
for m=1:10
    for n=1:6
        [x,y]=piece_(1);
        patch(x+4*n-rough,y+2*m,cmap(1,:),'edgecolor','none');
        [x,y]=piece_(2);
        patch(x+4*n+2-rough,y+2*m,cmap(2,:),'edgecolor','none');
        [x,y]=piece_(3);
        patch(x+4*n+1-rough,y+2*m+1,cmap(3,:),'edgecolor','none');
        [x,y]=piece_(4);
        patch(x+4*n+1-rough,y+2*m-1,cmap(4,:),'edgecolor','none');
    end
    rough=-rough;
end
axis equal off


function [xb,yb]=piece_(choice)
switch choice
    case 1
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x+1,y+1);
        [xb,yb]=polybool('subtraction',xa,ya,x+1,y-1);
    case 2
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x-1,y-1);
        [xb,yb]=polybool('subtraction',xa,ya,x-1,y+1);    
    case 3
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x+1,y+1);
        [xb,yb]=polybool('subtraction',xa,ya,x-1,y+1);
    case 4
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x-1,y-1);
        [xb,yb]=polybool('subtraction',xa,ya,x+1,y-1);        
    
        
end