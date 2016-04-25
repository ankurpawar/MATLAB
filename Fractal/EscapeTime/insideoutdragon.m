function insideoutdragon
% Inside out dragon
% Formula take from Paul Bourke website
% zn+1 = zn2 + f(|zn|) + i g(|zn|)
% f(r) = r*(1 + 2*r + r^2)*(r^2 - 1) / (1 + r^3)^2
% g(r) = r*(1 - 2*r + r^2)*(r^2 - 1) / (1 + r^3)^2

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 500; %number of points in x axis
HEIGHT = 500; %number of points in y axis

% maximum number of iterations
MAX_ITERATION = 100;

% fractal x y range
Y_MIN = -2;
Y_MAX = 2;
X_MIN = -2;
X_MAX = 2;

% Generate linearly spaced points from X_MIN to X_MAX
x = linspace(X_MIN, X_MAX, WIDTH);
% Generate linearly spaced points from Y_MIN to Y_MAX
y = linspace(Y_MIN, Y_MAX, HEIGHT);

% Create a linear 2d grid
% X is 2d a array, column value are varying and row values are constant
% Y is 2d a array, row value are varying and column values are constant
[X Y] = meshgrid(x, y);

% Allocate space for output
zval = zeros(HEIGHT, WIDTH);
xn =  0;
yn =  0;
nPoints = WIDTH * HEIGHT;
h_msg =  msgbox(' Please Wait ',' ');

tic %start timer
for m = 1:nPoints
    z = 1/(X(m)+i*Y(m));
    xn = 0;
    yn = 0;
    k = 1;
    r = abs(z);
    while (k < MAX_ITERATION) && (r < 2)
        r = abs(z);
        f = r*(1 + 2* r + r^2)*(r^2-1)/(1 + r^3)^2;
        g = r*(1 - 2* r + r^2)*(r^2 - 1)/(1 + r^3)^2;
        z = z^2 + f + i*g;
        k = k+1;
    end
    zval(m) = k;
end

toc %stop timer
close(h_msg);
cmap = fliplr(colormap(pink(MAX_ITERATION)));
colormap(cmap);
imagesc(zval)
axis equal off
imwrite(zval,cmap ,'insideoutDragon.png','png') ;
end