function polarflower
%polar flower
MAX_FLOWER = 3;
choice = getUserInput(['Enter a choice from 1 to ' num2str(MAX_FLOWER) ...
    '\n'] , 1, MAX_FLOWER);

switch choice
    case 1
        theta = linspace(0,25*2*pi,3000);
        rad = (0.8*theta/(2*pi)+3);
        r = rad.*(8 + sin(theta*6+rad/3));
        [x,y] = pol2cart(theta,r);
        line(x,y,'color','m');
    case 2
        colmap = 1-hsv(61-5);
        theta = linspace(0,2*pi,1000);
        for rad = 5:60;
            r = rad.*(8 + sin(theta*5+rad/10));
            [x,y] = pol2cart(theta,r);
            line(x,y,'color',colmap(rad-4,:))
        end
    case 3
        colmap = jet(61-5);
        theta = linspace(0,2*pi,1000);
        for rad = 5:4:60;
            r = rad*8+(16*sin(theta*6+rad*pi/4));
            [x,y] = pol2cart(theta,r);
            line(x,y,'color',colmap(rad-4,:));
        end
end
axis equal off
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