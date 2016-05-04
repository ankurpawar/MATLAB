% This script demonstrate, how to use function domainColoring.

% Output image dimensions.
IMG_WIDTH = 500;
IMG_HEIGHT = 500;

% x,y range of 2d plane
X_MIN = -pi;
X_MAX = pi;
Y_MIN = -pi;
Y_MAX = pi;

% create 2d grid
x = linspace(X_MIN, X_MAX, IMG_WIDTH);
y = linspace(Y_MIN, Y_MAX, IMG_HEIGHT);
[X, Y] = meshgrid(x, y);

% create complex grid 
Z = X+i*Y;

imgRGB = zeros(IMG_HEIGHT, IMG_WIDTH, 3);
hsvImg = domainColoring(log(Z), 90);
imgRGB = hsv2rgb(hsvImg);
image(imgRGB);