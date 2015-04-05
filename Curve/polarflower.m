%polarflower

choice=3;
switch choice
    case 1
        theta=0:0.008:45*2*pi;
        rad=(0.8*theta/(2*pi)+3);
        r = rad.*(8 + sin(theta*6+rad/3));
        [x,y]=pol2cart(theta,r);
        plot(x,y,'color',rand(1,3));
        axis equal on
    case 2
        
        theta=0:0.008:45*2*pi;
        rad = (0.8*theta/(2*pi)+1);
        r = rad.*(8 + sin(theta*7+rad/1.8));
        %rad=(0.8*theta/(2*pi)+3);
        %r = rad.*(8 + sin(theta*6+rad/3));
        [x,y]=pol2cart(theta,r);
        plot(x,y,'color',rand(1,3));
        axis equal off
    case 3
        colmap=1-hsv(61-5);
        for rad=5:60;
            theta=0:0.007:2.001*pi;
            r = rad.*(8 + sin(theta*5+rad/10));
            [x,y]=pol2cart(theta,r);
            plot(x,y,'color',colmap(rad-4,:)),hold on
        end
        axis equal off
    case 4
        colmap=jet(61-5);
        for rad=5:4:60;
            theta=0:0.007:2.001*pi;
            r = rad*8+(16*sin(theta*6+rad*pi/4));
            [x,y]=pol2cart(theta,r);
            plot(x,y,'color',colmap(rad-4,:)),hold on
        end
        axis equal off
    case 5
        colmap=hsv(61-5);
        for rad=5:60;
            theta=0:0.007:2.001*pi;
            r =rad.*(8 + cos(theta*5+rad*pi));
            [x,y]=pol2cart(theta,r);
            plot(x,y,'color',colmap(rad-4,:)),hold on
        end
        axis equal
end