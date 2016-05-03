function novafractal
% Nova fractal
% This script may take time to complete the fractal depending on the number
% of iteratons and size of image.

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 700; %number of points in x axis
HEIGHT = 700; %number of points in y axis

% Fractal x y range
Y_MIN = -1.15;
Y_MAX = 0.94;
X_MIN = -0.8;
X_MAX = 0.8;

% maximum number of iterations
MAX_ITERATION = 60;

TOLERANCE = 0.005;

% Generate linearly spaced points from X_MIN to X_MAX
x = linspace(X_MIN, X_MAX, WIDTH);
% Generate linearly spaced points from Y_MIN to Y_MAX
y = linspace(Y_MIN, Y_MAX, HEIGHT);

% Create a linear 2d grid
% X is 2d a array, column value are varying and row values are constant
% Y is 2d a array, row value are varying and column values are constant
[X Y] = meshgrid(x, y);

% Allocate space for output
img = zeros(HEIGHT, WIDTH);
h = msgbox(' Please Wait ',' ');
nPoint = HEIGHT * WIDTH;
tic
for m = 1:nPoint
    const = i*X(m) + Y(m);
    k = 1;
    z0 = -1;
    zn = 0+0*i;
    while k < MAX_ITERATION
        zn = z0 - (z0^3+1)/(3*z0^2) + const;
        if abs(z0 - zn) < TOLERANCE
            break;
        end
        z0 = zn;
        k = k+1;
    end
    img(m) = k;
end
toc
close(h);
imgMin = min(img(:));
imgMax = max(img(:));
cmap = flipud(bone(imgMax));
colormap(cmap);
hImg = imagesc(img,[imgMin imgMax]);
imwrite(img, cmap, 'novafractal.png', 'png');
end