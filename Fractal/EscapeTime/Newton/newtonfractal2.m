function newtonfractal2
% Newton fractal
% Function generates newton fractal. The coloring is based on the number of
% iterations. Images generated are indexed color images where the a
% particular color represent a iteration number where the formula found the
% root within the tolerance. This script may take time to complete the 
% fractal depending on the number of iteratons and size of image. Fractal 
% image is saved in png format. This script may take time to complete the 
% fractal depending on the number of iteratons and resolution of image.

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 700; %number of points in x axis
HEIGHT = 700; %number of points in y axis

fractalData = getFractalData;

[nRow, nColumn] = size(fractalData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    '\n'] , 1, nColumn);

range = fractalData(choice).range;
nIteration = fractalData(choice).iterate;
tolerance = fractalData(choice).tolerance;
func = fractalData(choice).func;

% Generate linearly spaced points from X_MIN to X_MAX
x = linspace(range(1), range(2), WIDTH);
% Generate linearly spaced points from Y_MIN to Y_MAX
y = linspace(range(3), range(4), HEIGHT);

% Create a linear 2d grid
% X is 2d a array, column value are varying and row values are constant
% Y is 2d a array, row value are varying and column values are constant
[X Y] = meshgrid(x, y);

% Allocate space for output
img = zeros(HEIGHT, WIDTH);

nPoint = HEIGHT * WIDTH;
h_msg = msgbox(' Please Wait ',' ');
tic
for n = 1 : nPoint
    k = 1;
    z0 = X(n) + i*Y(n);
    zn = 0+ i*0;
    while k < nIteration
        zn = func(z0);
        if abs(zn - z0) < tolerance
            break;
        end
        z0 = zn;
        k = k+1;
    end
    img(n) = k;
end
toc
close(h_msg);

imgMin = min(img(:));
imgMax = max(img(:));

colors = fractalData(choice).cmap(imgMax);
colormap(colors);
imagesc(img);
axis tight equal
imwrite(img, colors, ['newtonFractal' num2str(choice) '.png']);

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

function newtonFracData = getFractalData
% Function returns a struture array containing range, maximum iterations,
% tolerance, complex function and colormap required to generate fractal
% range, x,y limits for the fractal it is 1d array,[xmin xmax ymin ymax]
% nIteration, maximum iterations for newton formula
% tolerance, difference between this and previous root. If difference is
%            very small and iteration is large then more time is required
%            for calculating fractal.
% func, function handle to z-f(z)/f'(z)

newtonFracData(1).range = [-0.5 0.5 -0.5 0.5];
newtonFracData(1).iterate = 64;
newtonFracData(1).tolerance = 0.025;
newtonFracData(1).func = @(z)(z-(z*z*z*z-cos(z))/(4*z*z*z+sin(z)));
newtonFracData(1).cmap = @(n)(1-pink(n));

newtonFracData(2).range = [-1 1 -1 1];
newtonFracData(2).iterate = 64;
newtonFracData(2).tolerance = 0.025;
newtonFracData(2).func = @(z)(z-(z^4 + 3*z^3 + 2*z^2 +0.2*z+ 1)...
            /(4*z^3 + 9*z^2 + 4*z +0.2));
newtonFracData(2).cmap = @(n)(1-bone(n));

newtonFracData(3).range = [-5 5 -5 5];
newtonFracData(3).iterate = 50;
newtonFracData(3).tolerance = 0.0005;
newtonFracData(3).func = @(z)(z - 1 /((0.4+0.9*i)...
    /(z-1)+1/(z+0.5 - 0.866i)...
    +1/(z+0.5 + 0.866i)));
newtonFracData(3).cmap = @(n)(1-bone(n));

newtonFracData(4).range = [-1.5 1.5 -1.5 1.5];
newtonFracData(4).iterate = 30;
newtonFracData(4).tolerance = 0.05;
newtonFracData(4).func = @(z)(z-1/((0.7+0.9*i)/(z-1)...
    +1/(z+0.5 - 0.866i)+1/(z+0.5 + 0.866i)));
newtonFracData(4).cmap = @(n)(hot(n));

newtonFracData(5).range = [-1.5 1.5 -1.5 1.5];
newtonFracData(5).iterate = 30;
newtonFracData(5).tolerance = 0.0005;
newtonFracData(5).func = @(z)(z - 1/((0.5...
    +0.3*i)/(z-1)+1/(z+0.5 - 0.866i)+1/(z+0.5 + 0.866i)));
newtonFracData(5).cmap = @(n)(hot(n));

newtonFracData(6).range = [-0.4 0.4 -0.4 0.4];
newtonFracData(6).iterate = 64;
newtonFracData(6).tolerance = 0.0005;
newtonFracData(6).func = @(z)(z - cos(z)/(-sin(z)));
newtonFracData(6).cmap = @(n)(1-pink(n));

newtonFracData(7).range = [-5 5 -5 5];
newtonFracData(7).iterate = 40;
newtonFracData(7).tolerance = 0.0005;
newtonFracData(7).func = @(z)(z - 1/(0.5/(z-1)...
    +1/(z+0.5 - 0.866i)+1/(z+0.5 + 0.866i)));
newtonFracData(7).cmap = @(n)(1-bone(n));

newtonFracData(8).range = [-1 1 -1 1];
newtonFracData(8).iterate = 50;
newtonFracData(8).tolerance = 0.0005;
newtonFracData(8).func = @(z)(z-(z^3 -2*z+2)/(3*z^2-2));
newtonFracData(8).cmap = @(n)(flipud(bone(n)));

newtonFracData(9).range = [-2 2 -2 2];
newtonFracData(9).iterate = 64;
newtonFracData(9).tolerance = 0.0005;
newtonFracData(9).func = @(z)(z - 1/((-0.5+1.0*i)/(z+1)+1/(z-1)));
newtonFracData(9).cmap = @(n)(flipud(hot(n)));

newtonFracData(10).range = [-0.08 0.08 -0.08 0.08];
newtonFracData(10).iterate = 50;
newtonFracData(10).tolerance = 0.0005;
newtonFracData(10).func = @(z)(z - 1/((1+i)/(z+1)+(1+i)/(z-1)));
newtonFracData(10).cmap = @(n)(bone(n));

newtonFracData(11).range = [-2 2 -2 2];
newtonFracData(11).iterate = 40;
newtonFracData(11).tolerance = 0.0005;
newtonFracData(11).func = @(z)(z - (z^3-1)/(3*z^2));
newtonFracData(11).cmap = @(n)(flipud(hot(n)));

newtonFracData(12).range = [-2 2 -2 2];
newtonFracData(12).iterate = 50;
newtonFracData(12).tolerance = 0.0005;
newtonFracData(12).func = @(z)(z - (z^4-1)/(4*z^3));
newtonFracData(12).cmap = @(n)(flipud(bone(n)));
end