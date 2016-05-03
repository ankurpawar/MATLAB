function newtonFractalRGB
% Newton fractal
% Function generates newton fractal. The coloring is based on the roots and
% number of iterations. For each root of polynomial a color is given and
% the intensity of color depends on the number of iterations taken by 
% newtons formula to reach a root . This script may take time to complete 
% the fractal depending on the number of iteratons and size of image. 
% Fractal image is saved in png format.
%
% Newtons formula is applied on each point on a 2d complex plane. Then 
% newly calculated root is searched in already calculated array of roots. 
% If match is found, then the index of array is the used to decide the
% color for that point.

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 500; %number of points in x axis
HEIGHT = 500; %number of points in y axis

fractalData = getFractalData;

[nRow, nColumn] = size(fractalData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    '\n'] , 1, nColumn);

range = fractalData(choice).range;
nIteration = fractalData(choice).iterate;
tolerance = fractalData(choice).tolerance;
func = fractalData(choice).func;
dfunc = fractalData(choice).dfunc;
zRoots = fractalData(choice).zRoots;
nRoot = length(zRoots);
colors = fractalData(choice).colors;

% Generate linearly spaced points from X_MIN to X_MAX
x = linspace(range(1), range(2), WIDTH);
% Generate linearly spaced points from Y_MIN to Y_MAX
y = linspace(range(3), range(4), HEIGHT);

% Create a linear 2d grid
% X is 2d a array, column value are varying and row values are constant
% Y is 2d a array, row value are varying and column values are constant
[X Y] = meshgrid(x, y);

% Allocate space for RGB image
img = zeros(HEIGHT, WIDTH, 3);

h_msg = msgbox(' Please Wait ',' ');
tic
for m = 1 : HEIGHT
    for n = 1 : WIDTH
        k = 1;
        z0 = X(m,n) + i*Y(m,n);
        zn = 0+ i*0;
        while k < nIteration
            zn = z0 - func(z0)/dfunc(z0);
            if abs(zn - z0) < tolerance
                break;
            end
            z0 = zn;
            k = k+1;
        end
        
        rootIndex = 0;
        for t = 1 : nRoot
            if abs(zn - zRoots(t)) < tolerance
                rootIndex = t;
                break;
            end
        end
        
        if rootIndex > 0
            img(m, n, 1) = colors(rootIndex,1) * (1-(k/nIteration));
            img(m ,n, 2) = colors(rootIndex,2) * (1-(k/nIteration));
            img(m ,n, 3) = colors(rootIndex,3) * (1-(k/nIteration));
        end
    end
end
toc
close(h_msg);
img = uint8(img * 255);
image(img);
axis square tight
comment = char(func);
imwrite(img,['newtonFractalRGB' num2str(choice) '.png'], 'png'...
    , 'Comment', comment);
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
% func, function handle to f(z)
% dfunc, function handle to f'(z)
% zRoots, array of roots
% colors, nx3 array of colors, each row is color for a root.

% f(z) = z^3-1 
newtonFracData(1).range = [-2 2 -2 2];
newtonFracData(1).iterate = 50;
newtonFracData(1).tolerance = 0.0005;
newtonFracData(1).func = @(z)(z*z*z-1);
newtonFracData(1).dfunc = @(z)(3*z*z);
newtonFracData(1).zRoots = roots([1 0 0 -1]);
newtonFracData(1).colors = [1 1 0; 1 0 1; 1 1 1];

% f(z) = z^6+(2-4*i)*z^5-z+(2-4*i)
newtonFracData(2).range = [-2 2 -2 2];
newtonFracData(2).iterate = 50;
newtonFracData(2).tolerance = 0.0005;
newtonFracData(2).func = @(z)(z^6+(2-4*i)*z^5-z+(2-4*i));
newtonFracData(2).dfunc = @(z)(6*z^5 + 5*(2-4*i)*z^4-1);
newtonFracData(2).zRoots = roots([1 2-4i 0 0 0 -1 2-4i]);
newtonFracData(2).colors = [1 1 0; 1 0.25 0; 1 1 1; 0 1 0.5; 0 0.5 1; 1 0.5 1];

% f(z) = (3+i)*z^6+ 3*z^5 + 4*z^4 + z^3 + z^2 + (8-20i)*z + (2-i)
newtonFracData(3).range = [-2 2 -2 2];
newtonFracData(3).iterate = 50;
newtonFracData(3).tolerance = 0.0005;
newtonFracData(3).func = @(z)((3+i)*z^6+ 3*z^5 + 4*z^4 ...
    + z^3 + z^2 + (8-20i)*z + (2-i));
newtonFracData(3).dfunc = @(z)((18+6i)*z^5+ 15*z^4 ...
    + 16*z^3 + 3*z^2 + 2*z + (8-20i));
newtonFracData(3).zRoots = roots([(3+i) 3 4 1 1 (8-20i) (2-i)]);
newtonFracData(3).colors = [1 1 0; 1 0 1; 1 1 1; 0 1 1; 0 0.5 1; 0 1 0];
end