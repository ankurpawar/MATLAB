function logspiralanim
% Animation of log spiral
MAX_FUNC = 5;
choice = getUserInput(['Enter choice from 1 to ' num2str(MAX_FUNC) '\n']...
    , 1, MAX_FUNC);

switch choice
    case 1
        anim_func = @(r,n,t)(sin(6*cos(r-0.04*n*pi)+t));
    case 2
        anim_func = @(r,n,t)(sin(5*r+t-0.11*pi*n)...
            .*sin(5*r+t+pi*0.01*n));
    case 3
        anim_func = @(r,n,t)(sin(-2.5*log(r)+t+0.1*pi*n));
    case 4
        anim_func = @(r,n,t)(sin(3.1*(r)+(t-0.11*pi*n)));
    case 5
        anim_func = @(r,n,t)(sin(10*r.^2+t-0.11*pi*n));
end

% Maximum number of frames in animation
MAX_FRAME = 150;

%ouput image resolution will be WIDTHxHEIGHT
WIDTH = 150; %number of points in x axis
HEIGHT = 150; %number of points in y axis
lim = 2*pi;

%Generate linearly spaced points from -theta to theta
x = linspace(-lim, lim, WIDTH);
y = linspace(-lim, lim, HEIGHT);

% Create a linear 2d grid
% X is 2d a array, column value are varying and row values are constant
% Y is 2d a array, row value are varying and column values are constant
[X, Y] = ndgrid(x, y);

% Allocate space for output
zval = zeros(HEIGHT,WIDTH);

cmap = colormap(makeColorMap([1 1 1],[0.2 0.5 0.4],[1 0.9 0.5],64));

t = atan2(Y,X);
r = sqrt(X.^2 + Y.^2);
h = pcolor(zval);
shading interp
axis square off
n = 1;
while (n < MAX_FRAME) && ishandle(h)
    zval = anim_func(r,n,t);
    set(h,'CData',zval);
    pause(0.025);
    n = n + 1;
end
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