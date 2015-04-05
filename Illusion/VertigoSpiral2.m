%Vertigo Spiral2
t=0:0.01:2*pi;
total=14;
r=10;
[x,y]=pol2cart(t,r);
ymin=min(y);
ymax=max(y);
cmap=1-bone(total);
for k=1:total
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,y-min(y),cmap(k,:),'edgecolor','none');
    else
        patch(x,y-min(y),cmap(k,:),'edgecolor','none')
    end
    
end

ymin=min(y);
ymax=max(y);
cmap=bone(total);
for k=1:total
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,2*ymax+y+min(y),cmap(k,:),'edgecolor','none');
    else
        patch(x,2*ymax+y+min(y),cmap(k,:),'edgecolor','none')
    end
    
end
ymin=min(2*ymax+y+min(y));
ymax=max(y);
cmap=1-bone(total);
for k=1:total
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,ymin+y+max(y),cmap(k,:),'edgecolor','none');
    else
        patch(x,ymin+y+max(y),cmap(k,:),'edgecolor','none')
    end
    
end

ymin=min(2*ymax+y+min(y));
ymax=max(y);
cmap=bone(7);
r=2;
for k=1:7
    r=r-0.2;
    [x,y]=pol2cart(t,r);
    if mod(k,2)
        patch(x,1.65*ymin+y-max(y),cmap(k,:),'edgecolor','none');
    else
        patch(x,1.65*ymin+y-max(y),cmap(k,:),'edgecolor','none')
    end
    
end

axis equal off