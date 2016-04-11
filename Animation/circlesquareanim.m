function circlesquareanim

MAX_FUNC = 2;
choice = input(['Enter a choice from 1 to ' num2str(MAX_FUNC) ' ']);
if choice > MAX_FUNC || choice < 1
    error('choice out of range');
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
zval = zeros(WIDTH, HEIGHT);

cmap = colormap(makeColorMap([1 1 1],[0.2 0.5 0.4],[1 0.9 0.5],64));

switch choice
    case 1
        anim_func = @(x,y,n)(sin(x.*y - 0.05*pi*n));
    case 2
        anim_func = @(x,y,n)(sin(sin(x-0.01*pi*n).*cos(y).*y...
            +cos(y-0.01*pi*n).*sin(x).*x-0.01*pi*n));
end

cmap = colormap(makeColorMap([1 1 1],[0.2 0.5 0.4],[1 0.9 0.5],64));

h = pcolor(zval);
shading interp
axis square off

n = 1;
while (n < MAX_FRAME) && ishandle(h)
    zval = anim_func(X,Y,n);
    set(h,'CData',zval);
    pause(0.025);
    n = n + 1;
end

end