%spiral tile
choice=2;
switch choice
    case 1
        upto=4*pi;
        t=linspace(0,upto,100);
        for m=0:upto:16*pi
            for n=0:upto:16*pi
                [x,y]=pol2cart([t; t-pi/2; t+pi; t+pi/2],[t; t; t; t]);
                line(2*n+x([1 3],:)',2*m+y([1 3],:)','color',[0.2 0.3 0.6]);
                line(2*n+x([2 4],:)',2*m+y([2 4],:)','color',[0.8 0.7 0.3]);
            end
        end
        axis equal off
    case 2
        upto=3*pi;
        t=linspace(0,upto,100);
        for m=0:(upto)^2:150*pi
            for n=0:(upto)^2:150*pi
                [x,y]=pol2cart([t; t-pi/2; t+pi; t+pi/2],[t; t; t; t].^2);
                line(2*n+x([1 3],:)',2*m+y([1 3],:)','color',[0.2 0.3 0.6]);
                line(2*n+x([2 4],:)',2*m+y([2 4],:)','color',[0.8 0.7 0.3]);
            end
        end
        axis equal off
    case 3
        upto=2*pi;
        t=linspace(0,upto,100);
        for m=0:sqrt(upto):5*pi
            for n=0:sqrt(upto):5*pi
                [x,y]=pol2cart([t; t-pi/2; t+pi; t+pi/2],sqrt([t; t; t; t]));
                line(2*n+x([1 3],:)',2*m+y([1 3],:)','color',[0.2 0.3 0.6]);
                line(2*n+x([2 4],:)',2*m+y([2 4],:)','color',[0.8 0.7 0.3]);
            end
        end
        axis equal off
    case 4
        t=linspace(0.1*pi,3.0*pi,100);
        r=1./(t);
        [x,y]=pol2cart([t; t-pi/2; t+pi; t+pi/2],[r; r; r; r]);
        x_min=[x(1,1);x(2,1);x(3,1);x(4,1)];
        y_min=[y(1,1);y(2,1);y(3,1);y(4,1)];
        
        x_min=repmat(x_min,1,length(t));
        y_min=repmat(y_min,1,length(t));
        
        x=x-x_min;
        y=y-y_min;
        
        [theta,r]=cart2pol(x,y);
        
        for m=0:(pi):4*pi
            for n=0:(pi):4*pi
                line(2*n+x([1 3],:)',2*m+y([1 3],:)','color',[0.2 0.3 0.6]);
                line(2*n+x([2 4],:)',2*m+y([2 4],:)','color',[0.8 0.7 0.3]);
            end
        end
        axis equal off
    case 5
        t=linspace(2*pi,8.0*pi,100);
        r=1./(t);
        [x,y]=pol2cart(t,r);
        %[x,y]=pol2cart([t; t-pi/2; t+pi; t+pi/2],[r; r; r; r]);
        %x_min=[x(1,end);x(2,end);x(3,end);x(4,end)];
        %y_min=[y(1,end);y(2,end);y(3,end);y(4,end)];
        
        %x_min=[max(x(1,:));max(x(2,:));max(x(3,:));max(x(4,:))];
        %y_min=[max(y(1,:));max(y(2,:));max(y(3,:));max(y(4,:))];
        
        %x_min=repmat(x_min,1,length(t));
        %y_min=repmat(y_min,1,length(t));
        x_min=min(x);
        y_min=min(y);
        
        x=x-x_min;
        y=y-y_min;
        
        [theta,r]=cart2pol(x,y);
        lenx=length(x);
        max_x=max(x(1,:));
        max_y=max(y(1,:));
        cmap=1-jet(15);
        for m=0:max_y:1*pi
            k=1;rough=-1;
            for n=0:max_x:1*pi
                line(n+x([1],:)',m+y([1],:)','color',[0.2 0.3 0.6]);
                %patch(n+x,m+rough*y,'r','facecolor',cmap(k,:),'edgecolor','none');
                %line(2*n+x([2 4],:)',2*m+y([2 4],:)','color',[0.8 0.7 0.3]);
                k=k+1;
                
            end
        end
        
        axis equal off
end
