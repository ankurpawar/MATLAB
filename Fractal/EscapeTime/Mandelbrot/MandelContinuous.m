function continuousDwell
% Continuous dwell mandelbrot set. This script generates mandelbrot set
% with continuous coloring.

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 1000; %number of points in x axis
HEIGHT = 1000; %number of points in y axis

% fractal x y range
Y_MIN = -1.26;
Y_MAX = 1.26;
X_MIN = -1.5;
X_MAX = 0.6;

% maximum number of iterations
MAX_ITERATION = 500;

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
xnew = 0;
ynew = 0;
a =  0;
b =  0;
nPoints = WIDTH * HEIGHT;


iter = 500;
len_x =  length(x);
len_y =  length(y);
xnew =  0;
ynew =  0;
a =  0;
b =  0;
xn =  0;
yn =  0;
rough =  0;
c =  zeros(len_y,len_x);
zval =  zeros(len_y,len_x);
h_msg =  msgbox(' Please Wait ',' ');
tic
for m = 1:nPoints
    a = X(m);
    b = Y(m);
    xn = 0;
    yn = 0;
    k = 1;
    while (k <= MAX_ITERATION) && ((xn^2+yn^2) < 400)
        xnew = xn^2 - yn^2 + a;
        ynew = 2*xn*yn + b;
        xn = xnew;
        yn = ynew;
        k = k+1;
    end
        
    magZ2 = xn^2 + yn^2;
    logCount = log( k + 1 - log( log( max(magZ2,400) ) / 2 ) / log(2) );
    zval(m) = logCount;
end
toc
close(h_msg);

minCount = min(zval(:));
zval = (zval - minCount)./(log(MAX_ITERATION+1)-minCount);
img = uint8(zval * 255);
cmap = 1-gray(255);
colormap(cmap);
image(img)
axis square
imwrite(img,cmap,'mandel.png','png');