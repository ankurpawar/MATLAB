function pattern7_b
colmap=hsv(20);
for m=1:10
    for n=1:10
        c=1+mod(floor(4*rand),4);
        [x,y]=tile(c);
        patch(x+2*n,y+2*m,colmap(m+n,:),'edgecolor','none')
    end
    
end
axis equal off
end

function [xa,ya]=tile(choice)
switch choice
    case 1
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x-1,y+1);
        [xa,ya]=polybool('subtraction',xa,ya,x-1,y-1);
        [xa,ya]=polybool('subtraction',xa,ya,x+1,y-1);
        
    case 2
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x-1,y+1);
        [xa,ya]=polybool('subtraction',xa,ya,x+1,y+1);
        [xa,ya]=polybool('subtraction',xa,ya,x+1,y-1);
    case 3
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x+1,y+1);
        [xa,ya]=polybool('subtraction',xa,ya,x+1,y-1);
        [xa,ya]=polybool('subtraction',xa,ya,x-1,y-1);
    case 4
        t=2*pi:-1/(10*pi):0;
        r=1;
        [x,y]=pol2cart(t,r);
        [xa,ya]=polybool('subtraction',x,y,x+1,y+1);
        [xa,ya]=polybool('subtraction',xa,ya,x-1,y-1);
        [xa,ya]=polybool('subtraction',xa,ya,x+1,y-1);
end
end