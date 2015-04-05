%wallpaper
choice=1;
if choice==1
    total=100;
    x1=linspace(1,12.8,total);
    y1=ones(1,length(x1));
    y2=linspace(1,8,total);
    x2=12.8*ones(1,length(y2));
    colmap=hot(total);
    k=1;
    for k=1:total
        plot([x1(k) x2(k)],[y1(k) y2(k)],'color',colmap(k,:),'linewidth',1),hold on
    end
    
    set(gca,'color',[0 0 0]);
    axis([0 12.8 0 8])
    axis equal tight
else
    t=0.2:0.01:2.5*pi;
    %[x,y]=pol2cart(t,t);
    x=cos(t);y=sin(3*t);
    t2=(0:0.01:0.5)*pi;
    [x2,y2]=pol2cart(t2,0.5*sin(2*t2)/2);
    %x2=-x2+x2(26);y2=-y2+y2(26);
    %[theta,r]=cart2pol(0.05+x2,0.05+y2);
    [theta,r]=cart2pol(0.025+x2,0.025+y2);
    total=20;
    cmap=hsv(total);
    for k=1:total
        [x2,y2]=pol2cart(theta-2*pi*k/total,r);
        patch(x2,y2,'r','facecolor','none',...
            'edgecolor',cmap(k,:));
        
    end
    axis equal
end


