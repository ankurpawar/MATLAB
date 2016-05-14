function spiraltile1
%spiral tile
choice = getUserInput(['Enter a choice from 1 to 5:'], 1, 5);
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
        
    case 5
        t=linspace(2*pi,8.0*pi,100);
        r=1./(t);
        [x,y]=pol2cart(t,r);
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
                k=k+1;
            end
        end
end
axis equal off
end

function choice = getUserInput(promptStr, minNum, maxNum)
% return the user input and check the range of input
choice = input(promptStr);
if isempty(choice) || ~isnumeric(choice)
    error('enter a number');
elseif (choice < minNum) || (choice > maxNum)
    error(['enter a number between 1 to ' num2str(maxNum)]);
elseif isfloat(choice)
    %if choice is floating point value then truncate the fractional part
    choice = choice - mod(choice,1);
end
end