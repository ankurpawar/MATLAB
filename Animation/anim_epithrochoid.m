function anim_epithrochoid
% Epitrochoid animation
% There are no input and output arguments for this function.
% Run this function and a prompt will appear asking values of
% r1 = radius of inner circle
% r2 = radius of rolling circle
% len = length of line connected to centre of rolling circle
% Always keep r1 > r2
% When r2 = len then it becomes epicycloid
% Some good choices are
% r1=17, r2=7, len=7 
MIN_R1 = 10;
MAX_R1 = 100;
MIN_R2 = 1;
MAX_R2 = 100;
MIN_LEN = 1;
MAX_LEN = 100;

%radius of fixed circle, on which smaller circle rolls
r1 = getUserInput(['Enter r1 from ' ...
    num2str(MIN_R1) ' to ' num2str(MAX_R1) '\n'] , MIN_R1, MAX_R1);

%radius of rolling circle
r2 = getUserInput(['Enter r2 from ' ...
    num2str(MIN_R2) ' to ' num2str(MAX_R2) '\n'] , MIN_R2, MAX_R2);

%length of line connected to centre of rolling circle
len = getUserInput(['Enter len from ' ...
    num2str(MIN_LEN) ' to ' num2str(MAX_LEN) '\n'] , MIN_LEN, MAX_LEN);

dtheta = pi/10;  %increase in angle, per iteration

draw_epi(r1,r2,len,dtheta);

end

function draw_epi(r1,r2,len,dtheta)
% function to animate rolling circle.

% nRotations is the number of rotation the outer circle will do to 
% complete the epitrochoid. r1/r2 give the number of rotation only when r2 
% completely divides r1. lcm(r1,r2)/r2 gives the number rotation for any
% positive integer where r1 > r2.
nRotation = lcm(r1,r2)/r2; 
maxTheta = 2*pi*nRotation + dtheta; % rotate upto this much radian
t = linspace(0,2*pi,75);

%trochoid trace points
trocPointx = [];
trocPointy = [];

[x_roll,y_roll] = pol2cart(t,r2);
h_roll = patch(x_roll,y_roll,'r'); %draw rolling circle

h_line = line(0,0); %draw line connected to centre of rolling circle

[x_fix,y_fix] = pol2cart(t,r1);
line(x_fix,y_fix); %draw inner circle only once because it is fixed

axis equal
box on
axis((r1+r2+len)*[-1.2 1.2 -1.2 1.2]) %fix axis

h3 = line([0 0],[0 0]);%trace trochoid

n = 0;
while n < maxTheta && ishandle(h_roll)
    [xl,yl] = transform2d([-len 0],[0 0],0,0,-n,0,0);
    [x2,y2] = transform2d(xl,yl,0,-(r1+r2),-n*r2/r1,0,r1+r2);
    set(h_line,'xdata',x2,'ydata',y2);%draw line
    
    [x3,y3] = transform2d(x_roll,y_roll,0,-(r1+r2),-n*r2/r1,0,r1+r2);
    set(h_roll,'xdata',x3,'ydata',y3);%draw rolling circle
    
    trocPointx = [trocPointx x2(1)];
    trocPointy = [trocPointy y2(1)];
    set(h3,'xdata',trocPointx,'ydata',trocPointy);
    
    pause(0.025);
    n = n+dtheta;
end
end

function [xd,yd] = transform2d(x,y,tx,ty,phi,xr,yr)
% 2d transformation without scaling
% [xd,yd] = transform2d(x,y,tx,ty,phi,xr,yr)
xd=x.*cos(phi)-y.*sin(phi)+xr.*(1-cos(phi))+yr.*sin(phi)+tx;
yd=x.*sin(phi)+y.*cos(phi)+yr.*(1-cos(phi))-xr.*sin(phi)+ty;
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