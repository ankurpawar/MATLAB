%Vertigo Spiral
t=0:0.01:2*pi;
total=14;
r=10;
[x,y]=pol2cart(t,r);
ymin=min(y);
ymax=max(y);
for k=1:total
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,y-min(y),[0 0 0],'edgecolor','none');
    else
        patch(x,y-min(y),[1 1 1],'edgecolor','none')
    end
    
end

ymin=min(y);
ymax=max(y);
for k=1:total
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,2*ymax+y+min(y),[0 0 0],'edgecolor','none');
    else
        patch(x,2*ymax+y+min(y),[1 1 1],'edgecolor','none')
    end
    
end
ymin=min(2*ymax+y+min(y));
ymax=max(y);
for k=1:total
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,ymin+y+max(y),[0 0 0],'edgecolor','none');
    else
        patch(x,ymin+y+max(y),[1 1 1],'edgecolor','none')
    end
    
end

ymin=min(2*ymax+y+min(y));
ymax=max(y);
for k=1:6
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,1.57*ymin+y-max(y),[0 0 0],'edgecolor','none');
    else
        patch(x,1.57*ymin+y-max(y),[1 1 1],'edgecolor','none')
    end
    
end

axis equal off