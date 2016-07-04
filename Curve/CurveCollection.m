function CurveCollection
MAX_CURVE = 14;
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(MAX_CURVE) ...
    '\n'] , 1, MAX_CURVE);

switch choice
    case 1 
        %vivani curve
        t = linspace(-2*pi,2*pi);
        line(1+cos(t),sin(t),2*sin(t/2));
        view(3);
    case 2
        t = -2*pi:0.01:2*pi;
        line(2.*cos(t).^4,4.*sin(t),cos(t./2));
        view(3);
    case 3
        t = -2*pi:0.01:2*pi;
        line(cos(2*pi*t)./sqrt(1+4*t.^2)...
            ,sin(2*pi*t)./sqrt(1+4*t.^2)...
            ,-t./sqrt(1+t.^2));
        view(3);
    case 4
        t = -1.01*pi:0.01:pi;
        x = 3*cos(t);
        y = 3*sin(t);
        z = sin(5*t);
        line(x,y,z);
        view(3);
    case 5
        t = -pi:0.01:pi;
        line(sin(2*pi*t),t,sin(pi*t));
        view(3);
    case 6
        t = -2*pi:0.01:2*pi;
        line(t.*cos(2*pi*t),t.*sin(2*pi*t),t);
        view(3);
    case 7
        t=-5*pi:0.01:5*pi;
        line(5*t.*(cos(t)).^2 ...
            ,5*t.*cos(t)...
            ,0.1*t.^2.*(sin(t)).^3);
        view(3)
    case 8
        % modified helix
        t = -2*pi:0.01:2*pi;
        line(cos(4*pi*t)./sqrt(2+4*t.^6)...
            ,sin(4*pi*t)./sqrt(2+4*t.^6)...
            ,t./sqrt(2+t.^6));
        view(3)
    case 9
        %littus spiral
        t = linspace(0.1,14*pi,500);
        r = 1./sqrt(t);
        x = r.*cos(t);
        y = r.*sin(t);
        line(x,y);
    case 10
        h = ezplot('abs(x).^(1/2)+abs(y).^(2)-1',[-1 1],[-1 1]);
        set(h,'linewidth',2,'color',[0.4 0.3 0.7])
    case 11
        h=ezplot('abs(x).^(-2)-abs(y).^(1)-1',[-1 1],[-1 1]);
        set(h,'linewidth',2,'color',[0.4 0.3 0.7])
    case 12
        %fermats  spiral
        t1 = linspace(-15*pi,0.1,1000);
        r1 = sqrt(t1);
        x1 = -r1.*cos(t1);
        y1 = r1.*sin(t1);
        
        t2 = linspace(0,15*pi,1000);
        r2 = sqrt(t2);
        x2 = r2.*cos(t2);
        y2 = r2.*sin(t2);
        
        line(imag(x1),imag(y1),'linewidth',1)
        line(x2,y2,'linewidth',1)
    case 13
        t2 = 0:0.02:15*pi;
        r2 = 2*(t2);
        x2 = r2.*cos(t2);
        y2 = r2.*sin(t2);
        line(x2,y2);
    case 14
        theta = 0:0.01:45*2*pi;
        rad = (0.8*theta./(2*pi)+3);
        r = rad.*(8 + sin(theta*6+rad./3));
        x = r.*cos(theta);
        y = r.*sin(theta);
        line(x,y);
end
axis equal
set(gcf,'color',[1 1 1]);
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