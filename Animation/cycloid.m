function cycloid
% Cycloid animation
MIN_R = 1;
MAX_R = 10;
MIN_LEN = 1;
MAX_LEN = 10;
% Circle will rotate 2 times.
MAX_ROTATION = 4*pi;

%radius of rolling circle
r = getUserInput(['Enter r from ' ...
    num2str(MIN_R) ' to ' num2str(MAX_R) '\n'] , MIN_R, MAX_R);

%length of line connected to centre of rolling circle
len = getUserInput(['Enter length of line from ' ...
    num2str(MIN_LEN) ' to ' num2str(MAX_LEN) '\n'] , MIN_LEN, MAX_LEN);

%if len = r then it becomes cycloid, else it is trochoid.
theta = 0;
cycloidPointsX = [];
cycloidPointsY = [];
dtheta = pi/25;
t = linspace(0,2*pi,50);

[x,y] = pol2cart(t,r);
hRollCircle = patch(x,y,'r'); %draw the circle

lineX = [0 0];
lineY = [-len 0];%coordinates of line
hLine = line(0,0);%draw line connected to centre of rolling circle

axis equal
box on
if r >= len
    axis([-r r*4*pi+r -1 r+len+1]);
else
    axis([-len-1 r*4*pi+r+len -len+r-1 r+len+1]);
end

line([-pi/2 r*4*pi],[0 0])%base line
h3 = line([0 0],[0 0]);%trace trochoid

while (theta < MAX_ROTATION) && ishandle(hLine)
    % move circle
    set(hRollCircle,'xdata',x+theta*r,'ydata',y+r); 
    
    % rotate and translate line. n*r is length covered by circle when
    % rotated by n
    [lineXt,lineYt] = transform2d(lineX, lineY, theta*r, r, -theta, 0, 0);
    set(hLine,'xdata',lineXt,'ydata',lineYt);
    cycloidPointsX = [cycloidPointsX lineXt(1)];
    cycloidPointsY = [cycloidPointsY lineYt(1)];
    
    % draw cycloid
    set(h3,'xdata',cycloidPointsX,'ydata',cycloidPointsY);
    
    pause(0.025)
    theta = theta+dtheta;
end
end

function [xd,yd] = transform2d(x,y,tx,ty,phi,xr,yr)
%2d transform without scaling
xd = x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd = x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;
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