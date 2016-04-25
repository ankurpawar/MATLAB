function juliaset3
% Julia set fractal

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 1000; %number of points in x axis
HEIGHT = 1000; %number of points in y axis

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
xnew = 0;
ynew = 0;
nPoints = WIDTH * HEIGHT;

juliaData = getJuliaSetData;
[nRow, nColumn] = size(juliaData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    '\n'] , 1, nColumn);

MAX_ITERATION = juliaData(choice).iterate;
a = real(juliaData(choice).const);
b = imag(juliaData(choice).const);
cmapFunc = juliaData(choice).cmapFunc;

h_msg = msgbox(' Please Wait ',' ');

tic %timer on
for n = 1:nPoints
    k = 1;
    xn = X(n);
    yn = Y(n);
    while (k < MAX_ITERATION) && ((xn*xn + yn*yn) < 4)
        xnew = xn*xn-yn*yn + a;
        ynew = 2*xn*yn + b;
        xn = xnew;
        yn = ynew;
        k = k+1;
    end
    zval(n) = k;
end
toc  %timer off

close(h_msg);
cmap = cmapFunc(MAX_ITERATION);
colormap(cmap);
imagesc(x,y,zval);
axis square
imwrite(zval,cmap,['julia' num2str(choice) '.png']...
    ,'png','Source',num2str(a+i*b));
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

function juliaSetData = getJuliaSetData
% function returns structure array of constant value, iterations and
% colormap

juliaSetData(1).const = -0.7500-0.3500i;
juliaSetData(1).iterate = 100;
juliaSetData(1).cmapFunc = @(n)(1-gray(n));

juliaSetData(2).const = -0.4000+0.6000i;
juliaSetData(2).iterate = 160;
juliaSetData(2).cmapFunc = @(n)(1-gray(n));

juliaSetData(3).const = +0.2850+0.0100i;
juliaSetData(3).iterate = 128;
juliaSetData(3).cmapFunc = @(n)(1-gray(n));

juliaSetData(4).const = +0.4500+0.1428i;
juliaSetData(4).iterate = 75;
juliaSetData(4).cmapFunc = @(n)(1-gray(n));

juliaSetData(5).const = -0.7017+0.3842i;
juliaSetData(5).iterate = 128;
juliaSetData(5).cmapFunc = @(n)(1-bone(n));

juliaSetData(6).const = -0.8350-0.2321i;
juliaSetData(6).iterate = 64;
juliaSetData(6).cmapFunc = @(n)(1-hot(n));

juliaSetData(7).const = -0.8000+0.1560i;
juliaSetData(7).iterate = 150;
juliaSetData(7).cmapFunc = @(n)(fliplr(1-hot(n)));

juliaSetData(8).const = -0.2365-0.6721i;
juliaSetData(8).iterate = 128;
juliaSetData(8).cmapFunc = @(n)(1-gray(n));

juliaSetData(9).const = +0.2311+0.6068i;
juliaSetData(9).iterate = 50;
juliaSetData(9).cmapFunc = @(n)(1-hot(n));

juliaSetData(10).const = -0.7322-0.2628i;
juliaSetData(10).iterate = 128;
juliaSetData(10).cmapFunc = @(n)(1-bone(n));

juliaSetData(11).const = -0.79543+0.17308i;
juliaSetData(11).iterate = 128;
juliaSetData(11).cmapFunc = @(n)(1-bone(n));

juliaSetData(12).const = -0.51251+0.52129i;
juliaSetData(12).iterate = 200;
juliaSetData(12).cmapFunc = @(n)(bone(n));

juliaSetData(13).const = -0.81000-0.17950i;
juliaSetData(13).iterate = 128;
juliaSetData(13).cmapFunc = @(n)(bone(n));

juliaSetData(14).const = 0.36237+0.32i;
juliaSetData(14).iterate = 200;
juliaSetData(14).cmapFunc = @(n)(1-fliplr(hot(n)));

juliaSetData(15).const = -0.4959345-0.52287731i;
juliaSetData(15).iterate = 256;
juliaSetData(15).cmapFunc = @(n)(1-(bone(n)));

juliaSetData(16).const = -0.4942345+0.52287731i;
juliaSetData(16).iterate = 256;
juliaSetData(16).cmapFunc = @(n)(1-fliplr(hot(n)));

juliaSetData(17).const = -0.11+0.6556999999999999i;
juliaSetData(17).iterate = 256;
juliaSetData(17).cmapFunc = @(n)(flipud(bone(n)));

juliaSetData(18).const = -0.7708-0.1363i;
juliaSetData(18).iterate = 128;
juliaSetData(18).cmapFunc = @(n)(flipud(bone(n)));

juliaSetData(19).const = -0.3420+0.6349i;
juliaSetData(19).iterate = 90;
juliaSetData(19).cmapFunc = @(n)(1-(hot(n)));

juliaSetData(20).const = -0.0284-0.7145i;
juliaSetData(20).iterate = 128;
juliaSetData(20).cmapFunc = @(n)(flipud(bone(n)));

juliaSetData(21).const = 0.28685134248957+0.48848536810956i;
juliaSetData(21).iterate = 100;
juliaSetData(21).cmapFunc = @(n)(1-fliplr(hot(n)));

juliaSetData(22).const = 0.37568367799540-0.30544619694366i;
juliaSetData(22).iterate = 128;
juliaSetData(22).cmapFunc = @(n)(1-gray(n));

juliaSetData(23).const = -0.03802150108227+0.68253188890436i;
juliaSetData(23).iterate = 115;
juliaSetData(23).cmapFunc = @(n)(flipud(bone(n)));

juliaSetData(24).const = 0.23712524838792+0.51713719804576i;
juliaSetData(24).iterate = 200;
juliaSetData(24).cmapFunc = @(n)(flipud(bone(n)));
end