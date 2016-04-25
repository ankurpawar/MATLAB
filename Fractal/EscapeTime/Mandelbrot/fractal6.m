function fractal6
% Mandelbrot set fractal

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 2000; %number of points in x axis
HEIGHT = 2000; %number of points in y axis

% fractal x y range
Y_MIN = -1.26;
Y_MAX = 1.26;
X_MIN = -1.5;
X_MAX = 0.6;

% maximum number of iterations
MAX_ITERATION = 128;

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

h_msg =  msgbox(' Please Wait ',' ');
tic %start timer
for m = 1:nPoints
    a = X(m);
    b = Y(m);
    xn = 0;
    yn = 0;
    k = 1;
    while (k <= MAX_ITERATION) && ((xn^2+yn^2) < 4)
        xnew = xn^2 - yn^2 + a;
        ynew = 2*xn*yn + b;
        xn = xnew;
        yn = ynew;
        k = k+1;
    end
    zval(m) = k;
end
toc %stop
close(h_msg);
cmap = flipud(gray(MAX_ITERATION));
colormap(cmap);
image(x,y,zval); %show image
imwrite(zval,cmap,'mandelbrotset.png','png'); %save image
end