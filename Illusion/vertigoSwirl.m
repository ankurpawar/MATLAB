function vertigoSwirl
%recursive code to generate Vertigo Swirl
global COLORMAP
x=0;
y=0;
r=1;
n=5;
COLORMAP=bone(8);
circle(x,y,1,n);
axis([-1.25 1.25 -2.25 0.25])
axis equal off
return

function circle(x,y,rad,n)
global COLORMAP
if n>0
    len=rad;
    
    for k=1:8
        len=len*0.96;
        [xx yy]=pol2cart(linspace(0,2*pi,100),len);
        %line(xx(75)+x,yy(75)+y-len,'marker','o');
        if 1
            patch(xx+x,yy+y-len,'r','facecolor',COLORMAP(k,:),'edgecolor','none');
            %patch(xx+x,yy+y-len,'r','facecolor','none');
        else
            patch(xx+x,yy+y-len,'r','facecolor',COLORMAP(8-k+1,:),'edgecolor','none');
        end
    end
    rad=rad*0.95;
    [px py]=pol2cart(3*pi/2,len);
    %circle(x,yy(75)+y-len,-len,n-1);
    circle(x,py+y-len,-len,n-1);
end
return