function glynnset1
% Glynn set fractal
% Formula for generating Glynn set zn=(z^1.5)-0.2. This function takes few
% seconds to complete the fractal depeding on the CPU speed.

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 1024; %number of points in x axis
HEIGHT = 768; %number of points in y axis

% maximum number of iterations
MAX_ITERATION = 100;

% Glynn set fractal x y range
Y_MIN = -0.75;
Y_MAX = -0.35;
X_MIN = -0.25;
X_MAX = 0.25;

C_GLYNN = -0.2; % constant used in inner loop

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
h = waitbar(0,'Please wait...');

tic  %start timer
for n = 1:HEIGHT
    for m = 1:WIDTH
        z = Y(n,m) + i*X(n,m);
        k = 1;
        while (k < MAX_ITERATION) && (abs(z) < 2)
            z = z^1.5 + C_GLYNN;
            k = k+1;
        end
        zval(n,m) = k;
    end
    waitbar(n/HEIGHT,h);
end
toc  %stop timer

close(h);
cmap = jet(MAX_ITERATION);
colormap(cmap);
image(zval); %draw image
imwrite(zval,cmap ,'glynnset1.png','png'); %save image
end