function waveinterfernce
% Animation of wave interfernce
% Taken from website of Paul Nylander
% http://nylander.wordpress.com/category/physics/waves/
% This interference pattern is the superposition of two wave sources, such
% as light passing through two narrow slits.

% ouput image resolution will be WIDTHxHEIGHT
WIDTH = 150; %number of points in x axis
HEIGHT = 150; %number of points in y axis

% Generate linearly spaced points
x = linspace(0,16,WIDTH);
y = linspace(-8,8,HEIGHT);

% Create a linear 2d grid
% X is 2d a array, column value are varying and row values are constant
% Y is 2d a array, row value are varying and column values are constant
[X, Y] = ndgrid(x, y);

cmap = colormap(gray);

t = 7;
U = 2*pi*sqrt(X.^2 + (Y - 3).^2);
V = 2*pi*sqrt(X.^2 + (Y + 3).^2);

% Allocate space for output
zval = zeros(WIDTH, HEIGHT);

h = pcolor(zval);
shading interp
axis square off

while (t >= 0) && ishandle(h)
    zval = sin(U + 2*pi*t) + sin(V + 2*pi*t);
    set(h,'CData',zval);
    pause(0.025);
    t = t-0.1;
end

end