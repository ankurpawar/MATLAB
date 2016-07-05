function trigonometricPattern
% Function generate colorful pattern using 2d trigonometric function. There
% is no input and output argument for this function. This function also
% saves the generated image as png image in the current working directory.
% The image saved is indexed image.
%
% To visualize 1d trigonometric function a=sin(2pi*t) 2d space is required.
% First dimension(i.e. x axis) will represent time t and second dimension
% (i.e. y axis) will represent amplitude a of the function. If the
% trigonometric function has 2 variables z = sin(t+k) then 3d space is
% required to visualize it. Third dimension will represent the amplitude of
% the function. The 3rd dimension can be replaced by colors. A linear
% colormap can be used to represent the amplitude of 2d function. Using
% approach results in an image rather than 3d surface.
%
% The ouptut is saved as indexed image because RGB image is big.
%
% This matlab function has 2 parts one for user input and saving the image,
% second for generating the amplitude using trigonometric function. It also
% return a 2x3 array of color range that can be used to generate a linear
% color map
%
MAX_PATTERN = 117; %there are 117 different pattern for now
WIDTH = 1000; %x axis resolution
HEIGHT = 1000; %y axis resolution
MAX_LIM = 2*pi; %range of 2d grid, x [-2pi,2pi], y [-2pi,pi]
OUT_IMAGE_TYPE = 3; %this value decides the output image type

% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(MAX_PATTERN) ...
    '\n'] , 1, MAX_PATTERN);

imgPromptStr = ['Enter output image type from 1 to ' ...
    num2str(OUT_IMAGE_TYPE) ',\n'...
    '1. 256 color indexed,\n'...
    '2. indexed image with ditehring \n'];
outImage = getUserInput(imgPromptStr, 1, OUT_IMAGE_TYPE);

% get the amplitude based on the choice
[zval,colorRange] = calculatePattern(choice, WIDTH, HEIGHT, MAX_LIM);

% zval vary from negative to positive
% to show indexed image get min and max value in array
zval_min = min(zval(:));
zval_max = max(zval(:));

clims = [zval_min zval_max];
caxis(clims);
imagesc(zval,clims);
axis equal
axis([0 WIDTH 0 HEIGHT]);

switch outImage
    case 1 % indexed image with 256 color
        %number of colors to represent the amplitude of function.
        nColor = 256;
        cmap = getColors(colorRange, nColor);
        colormap(cmap);
        %scale zval values in range of 0-255
        zval2 = (zval - zval_min);
        zval2 = zval2./max(zval2(:));
        zval2 = uint8((nColor-1)*zval2);
        imwrite(zval2, cmap, ['trig1pattern_' num2str(choice) '.png'], 'png');
        
    case 2 %indexed image with dithering
        nColor = 256;
        cmap = getColors(colorRange, nColor);
        colormap(cmap);
        %scale zval values in range of 0-255
        zval2 = (zval - zval_min);
        zval2 = zval2./max(zval2(:));
        zval2 = uint8((nColor-1) * zval2);
        
        % values in zval is in a range of 0-255. 0 the first color in
        % colormap. MATLAB has no inbuilt function that can dither indexed
        % images. So convert to rgb first, then apply dithering then back
        % to indexed again.
        rgb = ind2rgb(zval2, cmap);
        [X,map] = rgb2ind(rgb, nColor); %apply dithering to RGB
        imwrite(X, map, ['trig2pattern' num2str(choice) '.png'],'png');
        [X,map] = rgb2ind(rgb, cmap); %apply dithering to RGB
        imwrite(X, map, ['trigpattern' num2str(choice) '.png'],'png');
end
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

function cmap = getColors(colorRange, nColor)
% A wrapper function for makeColorMap. It will return color map based on
% the colorRange array and nColors.
if size(colorRange,1) == 2
    cmap = makeColorMap(colorRange(1,:), colorRange(2,:), nColor);
else
    cmap = makeColorMap(colorRange(1,:)...
        , colorRange(2,:)...
        , colorRange(3,:)...
        , nColor);
end
end %getColor ends

function [zval,colorRange] = calculatePattern(type, width, height, lim)
if nargin ~= 4
    error('incorrect number of argument');
end
theta = lim;
%Generate linearly spaced points from -theta to theta
x = linspace(-theta, theta, width);
y = linspace(-theta, theta, height);

% Create a linear 2d grid
% X is 2d a array, column value are varying and row values are constant
% Y is 2d a array, row value are varying and column values are constant
[X, Y] = meshgrid(x, y);

% Allocate space for output
zval = zeros(height, width);
colorRange = [1 1 1;0 0 0];
switch type
    case 1
        %calculate points using function
        zval = cos(X.*(Y.^2));
        colorRange = [1 1 1;0 0 0];
        
    case 2
        zval = abs((sin(2*(X.^2+Y.^2))));
        colorRange = [1 1 1; 0.57 0.8 0.96; 0 0 0];
        
    case 3
        zval =  cos(X.^3+Y.^3);
        colorRange =[1 1 1; 0.27 0.68 0.86; 0 0 0];
        
    case 4
        zval = sin((X.^4+Y.^4));
        colorRange = [0.27 0.168 0.2; 1 1 1; 0 0 0];
        
    case 5
        zval = sin(sin(cos(X+Y).*sin(Y-X).*Y)...
            -cos(sin(Y-X).*cos(X+Y).*X))...
            .*cos(sin(cos(X+Y).*sin(Y-X).*Y)...
            -cos(sin(Y-X).*cos(X+Y).*X));
        colorRange = [1 1 1; 0.27 0.168 0.2; 0.76 0.81 0.4];
        
    case 6
        zval = cos(X./Y+Y./X);
        colorRange = [1 1 1; 0.27 0.168 0.2; 0.76 0.81 0.4];
        
    case 7
        zval = cos((Y).*sin(X).*cos(Y)).^3+sin((X).*sin(Y).*sin(X)).^3;
        colorRange = [0.127 0.2368 0.32; 1 1 1; 0.176 0.181 0.174];
        
    case 8
        zval =  cos(cos(X.^2).*sin(Y)).^2-sin(sin(X).*cos(Y.^2)).^2;
        colorRange = [1 1 1; 0.17 0.368 0.32; 0.46 0.81 0.84];
        
    case 9
        zval =  cos(cos(X.^2)+sin(Y.^2)).*sin(sin(X).*cos(Y));
        colorRange =[1 1 1; 0.127 0.2368 0.32; 0.276 0.81 0.74];
        
    case 10
        zval = cos(cos(X.^2)+sin(Y.^2));
        colorRange = [0.127 0.2368 0.32; 1 1 1; 0.176 0.181 0.174];
        
    case 11
        zval = sin(sin(Y.^2-X.^2)-Y.^2+cos(X.^2-Y.^2)-X.^2);
        colorRange = [0.127 0.228 0.26; 1 1 1; 0.176 0.341 0.374];
        
    case 12
        zval = sin(sin(Y.^2+X.^2)-Y+cos(X.^2+Y.^2)+X);
        colorRange = [0 0 0; 0.4375 0.5625 0.5625;1 1 1];
        
    case 13
        zval = sin(sin(Y.^2+X.^2)-Y.^2+sin(X.^2+Y.^2)+X.^2);
        colorRange = [1 1 1; 0 0 0];
        
    case 14
        zval = sin(sin(X).*cos(Y).*Y+cos(Y).*sin(X).*X);
        colorRange = [1 1 1; 0.127 0.2368 0.32; 0.176 0.781 0.874];
        
    case 15
        zval = sin(tan(2.*X)./Y + tan(2.*Y)./X);
        colorRange = [0 0 0; 0.4375 0.5625 0.5625;1 1 1];
        
    case 16
        zval = sin(cos(X)./cos(Y)+cos(Y)./cos(X));
        colorRange = [1 1 1; 0.5625 0.4375 0.4375; 0 0 0];
        
    case 17
        zval = sin(sin(X).^3./sin(X).^1.*sin(Y).^3./cos(Y).^1);
        colorRange = [1 1 1; 0.5625 0.4375 0.4375; 0 0 0];
        
    case 18
        zval = sin(sin(2*X).*cos(2*Y).^2.*Y+cos(2*Y).^2.*sin(2*X).*X-X);
        colorRange = [1 1 1; 0.2368 0.32 0.127; 0.176 0.874 0.781];
        
    case 19
        zval = sin(sin(cos(X+Y).*sin(Y-X).*Y)...
            -cos(sin(Y-X).*cos(X+Y).*X))...
            .*cos(sin(cos(X+Y).*sin(Y-X).*Y)...
            -cos(sin(Y-X).*cos(X+Y).*X));
        colorRange = [1 1 1; 0.7 0.5 0.6; 1 0.9 0.7];
        
    case 20
        zval = sin(sin(cos(X+Y).*sin(Y-X).*Y.^2)...
            -cos(sin(Y-X).*cos(X+Y).*X.^2))...
            +cos(sin(cos(X+Y).*sin(X-Y).*Y.^2)...
            -cos(sin(X-Y).*cos(X+Y).*X.^2));
        colorRange = [1 1 1; 0.7 0.5 0.6; 0.9 0.5 0.2];
        
    case 21
        zval = sin(6.*(cos(X+Y)-sin(X-Y))...
            +(sin(Y-X)+cos(X+Y)))...
            -cos(4.*(cos(X+Y)+sin(X-Y))...
            -(sin(X-Y)+cos(X+Y)));
        colorRange = [1 1 1; 0.27 0.35 0.26; 0.39 0.8 0.87];
        
    case 22
        zval = sin((3.*cos(X+Y).*sin(X+Y).*X)...
            +(2.*sin(Y-X).*cos(X-Y).*Y))...
            +cos((2.*cos(X+Y).*sin(X+Y).*Y)...
            -(3.*sin(X-Y).*cos(Y-X).*X));
        colorRange = [1 1 1; 0.28 0.13 0.34; 1 0.9 0.7];
        
    case 23
        zval = cos(2-18.*cos(X-Y).*sin(X+Y).^9) ...
            -sin(2+18.*sin(X+Y).*cos(Y-X).^8);
        colorRange = [1 1 1; 0.18 0.23 0.24; 0.45 0.77 0.89];
        
    case 24
        zval = cos(sin(Y-X).*cos((sin(X-Y).^2) ...
            .*(sin(X+Y)).*X).^2).^2 ...
            +sin(cos(X-Y).*sin((cos(X-Y).^2) ...
            .*(cos(X+Y)).*Y).^2).^2;
        colorRange = [1 1 1; 0.28 0.3 0.34; 0.66 0.7 0.87];
        
    case 25
        zval = cos(sin(Y-X).^2.*cos((sin(X-Y).^2) ...
            .*(sin(X+Y)).*X)) ...
            -sin(cos(X-Y).^2.*sin((cos(X-Y).^2) ...
            .*(cos(X+Y)).*Y));
        colorRange = [0.7 0.825 0.26; 0.29 0.34 0.38; 1 1 1];
        
    case 26
        zval = cos(sin(Y-X).^3.*cos((sin(X-Y).^3) ...
            .*(sin(X+Y)).*Y)).^2 ...
            -sin(cos(X-Y).^3.*sin((cos(X-Y).^3) ...
            .*(cos(X+Y)).*X)).^2;
        colorRange = [0.33 0.45 0.24; 1 1 1; 0.19 0.25 0.36];
        
    case 27
        zval =  cos(4.*sin(6.*(sin(X-Y).^5).*(cos(Y-X))).^3) ...
            -sin(4.*cos(6.*(cos(X+Y).^3).*(sin(Y-X))).^5);
        colorRange = [1 1 1; 0.43 0.3 0.324; 0.86 0.6 0.88];
        
    case 28
        zval = cos(3.*(sin(X-Y).^3.*(cos(X+Y).^3).*Y)) ...
            -sin(3.*(cos(X+Y).^3.*(sin(Y-X).^3).*X));
        colorRange = [1 1 1; 0.3 0.4 0.4; 1 1 0.5];
        
    case 29
        zval = cos(3.*sin(X).*sin(Y).*sin(X+Y) .*cos(Y-X).*Y) ...
            -sin(3.*cos(Y).*cos(X).*cos(X-Y) .*sin(X+Y).*X);
        colorRange = [1 1 1; 0.385 0.2681 0.4704; 0.7027 0.7466 0.8449];
        
    case 30
        zval = cos(2.*sin(X+Y).^2.*cos(Y-X).^2.*X).^3 ...
            -sin(2.*cos(X-Y).^2.*sin(X+Y).^2.*Y).^3;
        colorRange = [1 1 1; 0.13 0.24 0.34; 0.3 0.93 0.85];
        
    case 31
        zval = cos(cos(X-Y).*(sin(X+Y).*sin(Y).^2)).^2 ...
            -sin(sin(Y-X).*(cos(X+Y).*cos(X).^2)).^2;
        colorRange = [0.7901 0.7889 0.387; 1 1 1; 0.4983 0.32140 0.435];
        
    case 32
        zval = cos(sin(X-Y).*(sin(X+Y).*cos(Y-X).*X).^2) ...
            -sin(cos(Y-X).*(cos(X+Y).*sin(X-Y).*Y).^2);
        colorRange = [1 1 1; 0.24 0.34 0.28; 0.87 0.758 0.424];
        
    case 33
        zval = cos(sin(X-Y)-(sin(X+Y).*cos(Y-X).*X).^2) ...
            -sin(cos(Y-X)+(cos(X+Y).*sin(X-Y).*Y).^2);
        colorRange = [1 1 1; 0.7027 0.5466 0.84449; 0.385 0.25681 0.3704];
        
    case 34
        zval = cos(sin(X-Y)-(sin(X+Y).^2.*cos(Y-X).^2.*Y)).^2 ...
            -sin(cos(Y-X)+(cos(X+Y).^2.*sin(X-Y).^2.*X)).^2;
        colorRange = [1 1 1; 0.21 0.34 0.37; 0.9 0.85 0.56];
        
    case 35
        zval = cos(sin(X-Y).^2-(sin(X+Y).^2.*cos(Y-X).^2.*Y)).^2 ...
            -sin(cos(Y-X).^2+(cos(X+Y).^2.*sin(X-Y).^2.*X)).^2;
        colorRange = [1 1 1; 0.385 0.25681 0.23704; 0.8385 0.81 0.3704];
        
    case 36
        zval = cos(sin(X-Y).^3-(sin(X+Y).^3.*cos(Y-X).^3.*Y)).^2 ...
            -sin(cos(Y-X).^3+(cos(X+Y).^3.*sin(X-Y).^3.*X)).^2;
        colorRange = [1 1 1; 0.385 0.23 0.3704; 0.78 0.381 0.84];
        
    case 37
        zval = cos(2.5.*sin(X-Y).^3.*(sin(X+Y).^2)).^2 ...
            -sin(cos(Y-X).^2.*(2.5.*cos(X+Y).^3)).^4;
        colorRange = [0.21 0.35 0.43; 1 1 1; 0.584 0.481 0.65];
        
    case 38
        zval = cos(sin(X-Y).^3.*(sin(X+Y).^3.*X)).^2 ...
            -sin(cos(Y-X).^3.*(cos(X+Y).^3.*Y)).^2;
        colorRange = [0.383 0.85 0.85; 0.355 0.350 0.129; 1 1 1];
        
    case 39
        zval = cos(sin(X-Y).^3.*(sin(X+Y).^3.*X)).^3 ...
            -sin(cos(Y-X).^3.*(cos(X+Y).^3.*Y)).^3;
        colorRange = [1 1 1; 0.14 0.321 0.34; 0.265 0.865 0.8];
        
    case 40
        zval = cos(sin(X-Y).^2.*(sin(X+Y).^3.*X)).^3 ...
            -sin(cos(Y-X).^3.*(cos(X+Y).^2.*Y)).^3;
        colorRange = [1 1 1; 0.285 0.2681 0.1704; 0.7027 0.65 0.12];
        
    case 41
        zval = cos(6.*sin(X-Y).^5.*(cos(X+Y).^5.*sin(X+Y).*X)) ...
            -sin(6.*cos(Y-X).^4.*(sin(X+Y).^4.*cos(X+Y).*Y));
        colorRange = [1 1 1; 0.23 0.34 0.124; 0.78 0.839 0.319];
        
    case 42
        zval = cos(sin(X-Y).^2-(cos(Y-X).^2.*sin(X+Y).^2.*X)).^3 ...
            -sin(cos(X+Y).^2+(sin(X+Y).^2.*cos(X-Y).^2.*Y)).^3;
        colorRange = [1 1 1; 0.12 0.281 0.2804; 0.385 0.81 0.764];
        
    case 43
        zval = cos(sin(X-Y).^3-(cos(Y-X).^3.*sin(X+Y).^3.*X)).^2 ...
            -sin(cos(X+Y).^3+(sin(X+Y).^3.*cos(X-Y).^3.*Y)).^2;
        colorRange = [1 1 1; 0.13 0.34 0.24; 0.37 0.83 0.79];
        
    case 44
        zval = cos(sin(X-Y).*(X+Y).*(cos(Y-X).*sin(X+Y))).^2 ...
            -sin(cos(X+Y).*(X-Y).*(sin(X+Y).*cos(X-Y))).^2;
        colorRange = [0.13 0.24 0.34; 1 1 1; 0.37 0.28 0.19];
        
    case 45
        zval = cos(X.^2.*sin(X-Y).^2.*cos(X+Y).*(cos(Y-X).*sin(X+Y))).^2 ...
            -sin(Y.^2.*cos(X+Y).^2.*sin(X-Y).*(sin(X+Y).*cos(X-Y))).^2;
        colorRange = [0.47 0.8 0.29; 1 1 1; 0.35 0.47 0.15];
        
    case 46
        zval = sin(X.*cos(X-Y)+Y.*sin(X+Y)).^2 ...
            -cos(X.*cos(X+Y)-Y.*sin(X-Y)).^2;
        colorRange = [1 1 1; 0.1 0.4 0.4; 0.6 0.8 0.8];
        
    case 47
        zval = sin(X.*(1+cos(X-Y)).*(1-sin(X+Y))).^3 ...
            -cos(Y.*(1+sin(X+Y)).*(1-cos(X-Y))).^3;
        colorRange = [1 1 1; 0.25 0.261 0.37; 0.38 0.766 0.849];
        
    case 48
        zval = sin(X.*(1-cos(X-Y).^2).*(1-sin(X+Y).^2)).^3 ...
            -cos(Y.*(1+sin(X+Y).^2).*(1+cos(X-Y).^2)).^3;
        colorRange = [1 1 1; 0.2847 0.2796 0.2972; 0.9933 0.9758 0.5909];
        
    case 49
        zval = sin(-6.*sin(X-Y).^2.*cos(X+Y).^3 ...
            +6.*cos(X+Y).^2.*sin(X-Y).^3 ...
            -6.*cos(Y-X).^6-6.*sin(X+Y).^6 );
        colorRange = [1 1 1; 0.23 0.14 0.24; 0.78 0.67 0.49];
        
    case 50
        zval = sin(5.*sin(2.*(1-cos(X-Y)).*(1-sin(X+Y))) ...
            -5.*sin(2.*(1+sin(X+Y)).*(1+cos(X-Y))));
        colorRange = [1 1 1; 0.350 0.3147 0.21; 0.8619 0.81 0.2];
        
    case 51
        zval = sin(4.*sin(1.*(1-cos(X-Y)).*(1-sin(X+Y))).^2 ...
            -3.*cos(2.*(1+sin(X+Y)).*(1+cos(X-Y))).^2).^2;
        colorRange = [1 1 1; 0.4 0.5 0.7; 1 0.9 0.5];
        
    case 52
        zval = sin(2.*sin(3.*(1-cos(2-X-Y)).*(1-sin(1+X+Y))).^2 ...
            -2.*cos(3.*(1+sin(1-X+Y)).*(1+cos(2+X-Y))).^2).^3;
        colorRange = [0.24 0.23 0.34; 1 1 1; 0.37 0.26 0.27];
        
    case 53
        zval = sin(2.*sin(3.*(1-cos(2-X-Y)).*(1-sin(1+X+Y))).^2 ...
            -3.*cos(2.*(1+sin(1-X+Y)).*(1+cos(2+X-Y))).^2);
        colorRange = [1 1 1; 0.34 0.3 0.28; 0.73 0.79 0.37];
        
    case 54
        zval = sin(2.*sin(3.*(1-cos(X-Y).^3).*(1-sin(X+Y).^2)) ...
            -3.*cos(2.*(1+sin(X+Y).^2).*(1+cos(X-Y).^3))).^2;
        colorRange = [1 1 1; 0.47 0.350 0.2221; 0.619 0.7551 0.82];
        
    case 55
        zval = sin(sin((2-cos(X-Y)).*(2+sin(X+Y))).*Y ...
            -cos((2+sin(X+Y)).*(2-cos(X-Y))).*X);
        colorRange = [1 1 1; 0.3810 0.2449 0.1800; 0.750 0.56 0.37779];
        
    case 56
        zval = sin(sin(2.5.*(3-cos(X-Y)).*(3+sin(X+Y))).*sin(Y-X) ...
            -cos(2.5.*(3+sin(X+Y)).*(3-cos(X-Y))).*cos(X+Y));
        colorRange = [1 1 1; 0.36 0.3 0.1; 0.9 0.7 0.15];
        
    case 57
        zval = sin(4.*sin((3-cos(X-Y)).*(3+sin(X+Y)))-(X-sin(Y).^2) ...
            -4.*cos((3+sin(X+Y)).*(3-cos(X-Y)))+(Y-cos(X).^2));
        colorRange = [1 1 1; 0.37 0.25 0.37; 0.63 0.47 0.81];
        
    case 58
        zval = sin(3.*sin(5.*(cos(X-Y)).*(sin(X+Y)))-(Y-sin(Y)) ...
            -3.*cos(5.*(sin(X+Y)).*(cos(X-Y)))+(X-cos(X)));
        colorRange = [1 1 1; 0.45 0.213 0.37; 0.87 0.69 0.65];
        
    case 59
        zval = sin(5.*sin(3.*(cos(X-Y).^3.*sin(X+Y).^2))+(3.*sin(Y-X).^3) ...
            -5.*cos(3.*(sin(X+Y).^2.*cos(X-Y).^3))-(3.*cos(X+Y).^3));
        colorRange = [1 1 1; 0.33 0.14 0.44; 0.87 0.79 0.19];
        
    case 60
        zval = sin(0.5.*X.*sin(1.5.*(1+cos(X-Y).*sin(X+Y)).^2) ...
            -0.5.*Y.*cos(1.5.*(1-sin(X+Y).*cos(X-Y)).^2));
        colorRange = [1 1 1; 0.3 0.4 0.4; 0.7 0.9 0.8];
        
    case 61
        zval = sin(5.*(sin(3.*cos(X-Y).^2)-cos(3.*sin(X-Y).^3)) ...
            +5.*(cos(3.*sin(X+Y).^3)+sin(3.*cos(X-Y).^2)));
        colorRange = [1 1 1; 0.3 0.4 0.24; 0.57 0.78 0.59];
        
    case 62
        zval = sin(3.*sin(2-X.*(sin(X).*cos(Y))) ...
            -3.*cos(2-Y.*(cos(Y).*sin(X)))) ;
        colorRange = [1 1 1; 0.3 0.4 0.4; 0.7 0.8 0.9];
        
    case 63
        zval = sin(2.*sin(4-X.*(sin(X).*cos(Y))) ...
            - 2.*sin(4-Y.*(cos(Y).*sin(X))));
        colorRange = [1 1 1; 0.33 0.24 0.24; 0.74 0.68 0.89];
        
    case 64
        zval = sin(cos(3.*(2.*sin(X).^2+2.*cos(Y).^2)).^2-...
            sin(3.*(2.*cos(Y).^3-2.*sin(X).^3)).^2) ;
        colorRange = [1 1 1; 0.33 0.34 0.24; 0.85 0.61 0.579];
        
    case 65
        zval =sin(5.*cos(X+Y).^2-5.*sin(X-Y).^3).*...
            cos(5.*sin(X+Y).^3+5.*cos(Y-X).^2);
        colorRange = [0.812 0.736 0.645; 0.28 0.15 0.25; 1 1 1];
        
    case 66
        zval = sin(12.5.*cos(X-Y).^2-11.9.*sin(X+Y).^3)+...
            cos(12.5.*sin(X+Y).^2+11.9.*cos(X-Y).^3);
        colorRange = [1 1 1; 0.2 0.3 0.14; 0.736 0.812 0.645];
        
    case 67
        zval = cos(4.5.*(sin(X-1.5.*Y).^2 .*(cos(Y+1.5.*X).^3).*Y)) ...
            -sin(1.5.*(cos(1.5.*X+Y).^3 .*(sin(1.5.*Y-X).^2).*X));
        colorRange = [0.33 0.33 0.14; 1 1 1; 0.35 0.128 0.45];
        
    case 68
        zval = sin(12.*cos(X-Y).^4-11.*sin(X+Y).^5)+...
            cos(12.*sin(X+Y).^4+11.*cos(X-Y).^5);
        colorRange = [0.86 0.8 0.5; 0.24 0.3 0.28; 1 1 1];
        
    case 69
        zval = sin(10.*(sin(X+Y).^2.*cos(X-Y).^4)-10.*sin(cos(X+Y).^4))+...
            cos(10.*(cos(X-Y).^2.*sin(X+Y).^4)+10.*cos(sin(X-Y).^4));
        colorRange = [1 1 1; 0.37 0.35 0.26; 0.72 0.77 0.34];
        
    case 70
        zval = sin(2.51.*cos(X-Y).^3-5.1.*cos(X+Y).^4+1.59.*sin(X+Y).^2)+...
            cos(2.51.*sin(X+Y).^3+5.1.*sin(X-Y).^4-1.59.*cos(X-Y).^2);
        colorRange = [1 1 1; 0.169 0.294 0.2575; 0.820 0.892 0.6118];
        
    case 71
        zval = sin(1.*cos(cos(X-Y).^3-cos(X+Y).^2)+10.*sin(X+Y))+...
            cos(1.*sin(sin(X+Y).^3+sin(X-Y).^2)-10.*cos(X-Y));
        colorRange = [1 1 1; 0.385 0.3681 0.2704; 0.8027 0.85466 0.64449];
        
    case 72
        zval = sin(10.*cos(cos(X-Y).^3-cos(X+Y).^2)+sin(X+Y).^4)+...
            cos(10.*sin(sin(X+Y).^3+sin(X-Y).^2)-cos(X-Y).^4);
        colorRange = [1 1 1; 0.3 0.25 0.35; 0.42 0.79 0.8];
        
    case 73
        zval = sin(10.*cos(cos(X-Y).^3)+10.*cos(sin(X+Y).^3))+...
            cos(10.*sin(sin(X+Y).^3)-10.*sin(cos(X-Y).^3));
        colorRange = [1 1 1; 0.33 0.45 0.31; 0.82 0.9 0.48];
        
    case 74
        zval = sin(20.*sin(sin(cos(X+Y).^5)+cos(sin(X-Y).^3))...
            .*cos(cos(sin(X-Y).^3)+sin(cos(X+Y).^5)) );
        colorRange = [1 1 1; 0.23 0.3 0.35; 0.73 0.58 0.83];
        
    case 75
        zval = sin(sin(10.*(cos(X-Y)).*(sin(X+Y))).*sin(Y-X) ...
            - cos(10.*(sin(X+Y)).*(cos(X-Y))).*cos(X+Y));
        colorRange = [0.74 0.63 0.84; 0.27 0.15 0.37; 1 1 1];
        
    case 76
        zval = sin(10.*cos(sin(X+Y).^3+cos(Y-X).^3).^5 ...
            - 10.*sin(cos(Y-X).^3-sin(X+Y).^3).^5);
        colorRange = [1 1 1; 0.5 0.5 0.13; 0.8 0.7 0.23];
        
    case 77
        zval = cos(pi*sin(X-pi*Y).^2 - pi*cos(Y+pi*X).^2)...
            + sin(pi*cos(Y-pi/2*X).^2 + pi*sin(X+pi/2*Y).^2);
        colorRange = [0.5155 0.3340 0.4329; 1 1 1; 0.538 0.428 0.35];
        
    case 78
        zval = cos(2*sin(X-Y)+ 2*cos(pi*Y-X)).^2 ...
            + sin(2*sin(X+Y)- 2*sin(pi*X+Y)).^2;
        colorRange = [1 1 1; 0.28 0.13 0.38; 0.89 0.9 0.87];
        
    case 79
        zval = sin(2*cos((X+Y) - 8*sin(X).*cos(Y)).^2 ...
            + 2*sin((X-Y)-8*sin(Y).*sin(X)).^3);
        colorRange = [1 1 1; 0.34 0.26 0.49; 0.78 0.69 0.87];
        
    case 80
        zval = cos(Y.*sin(X).*cos(Y)).^2 + sin(X.*sin(Y).*sin(X)).^2;
        colorRange = [1 1 1; 0.34 0.24 0.18; 0.89 0.69 0.27];
        
    case 81
        zval = cos(7*sin(X-Y).^4 - 7*sin(X+Y).^3)...
            +sin(7*cos(Y-X).^3 + 7*cos(X+Y).^4);
        colorRange = [1 1 1; 0.28 0.27 0.48; 0.7 0.89 0.267];
        
    case 82
        zval = cos(4*Y.*sin(X-Y).^2.*cos(X+Y).^2)...
            + sin(4*X.*sin(X+Y).^2.*cos(X-Y).^2);
        colorRange = [1 1 1; 0.38 0.34 0.35; 0.73 0.69 0.85];
        
    case 83
        zval = sin(cos(7*sin(X-Y).^2.*cos(X+Y).^2).^4 ...
            +sin(7*cos(Y-X).^2.*sin(X+Y).^2).^4);
        colorRange = [1 1 1; 0.32 0.24 0.235; 0.81 0.59 0.767];
        
    case 84
        zval = cos(3*cos(Y-8*sin(X-Y).^3.*cos(X+Y).^3)...
            +3*sin(X+8*cos(Y-X).^3.*sin(X+Y).^3));
        colorRange = [1 1 1; 0.42 0.36 0.247; 0.785 0.576 0.27];
        
    case 85
        zval = sin(7*cos(5*sin(X+Y).*cos(Y-X)).^2 ...
            .* sin(5*sin(Y-X).*cos(X+Y)).^2 - sin(Y-X)+cos(X+Y));
        colorRange = [1 1 1; 0.15 0.26 0.47; 0.8 0.7 0.79];
        
    case 86
        zval = cos(2*cos(3*sin(X+Y).^3.*4.*cos(Y-X).^3)...
            + 2*sin(3*cos(X+Y).^3*4.*sin(X-Y).^3));
        colorRange = [1 1 1; 0.26 0.15 0.37; 0.8 0.7 0.79];
        
    case 87
        zval = sin(sin(2*cos(X+Y).*sin(X+Y).*cos(Y-X).*X)...
            - cos(2*sin(X+Y).*cos(X+Y).*sin(X-Y).*Y));
        colorRange = [0.9 0.89 0.9; 0.28 0.3 0.24; 0.25 0.71 0.79];
        
    case 88
        zval = sin(sin(cos(X+Y)-sin(X+Y).*cos(Y-X).*X)...
            - cos(sin(X+Y)-cos(X+Y).*sin(X-Y).*Y));
        colorRange = [1 1 1; 0.6 0.3 0.8; 0.89 0.89 0.7];
        
    case 89
        zval = sin(sin(cos(X+Y)+sin(X-Y).*cos(X+Y).*X)...
            + cos(sin(X-Y)+cos(X+Y).*sin(X-Y).*Y));
        colorRange = [1 1 1; 0.56 0.35 0.25; 0.97 0.88 0.8];
        
    case 90
        zval = cos(sin(cos(X+Y).*sin(X-Y).*cos(X+Y).*X)...
            + cos(sin(X-Y).*cos(X+Y).*sin(X-Y)*Y));
        colorRange = [1 0.9 0.7; 0.6 0.3 0.2; 1 0.9 1];
        
    case 91
        zval = sin(sin(cos(Y-X).*cos(X+Y).*X)+sin(sin(X+Y).*sin(X-Y).*Y));
        colorRange = [1 1 1; 0.25 0.4 0.32; 0.59 0.8 0.68];
        
    case 92
        zval = sin(6*sin(2*cos(Y-X)+2*cos(X+Y)).^4 ...
            + 6*cos(3*sin(X+Y).*sin(X-Y)).^4+cos(Y).^2);
        colorRange = [1 1 1; 0.2 0.45 0.45; 0.85 0.9 0.55];
        
    case 93
        zval = cos(3*sin(cos(Y-X).*cos(X+Y).*sin(X+Y).*Y)...
            +3*cos(sin(X+Y).*sin(X-Y).*sin(Y-X).*X));
        colorRange = [1 1 1; 0.2 0.3 0.55; 0.7 0.85 0.85];
        
    case 94
        zval = cos(5*sin(5*cos(Y-X)+4*sin(X+Y)).^2 ...
            +5*cos(5*sin(X+Y)-4*cos(Y-X)).^2);
        colorRange = [1 1 1; 0.3 0.4 0.3; 0.6 0.85 0.87];
        
    case 95
        zval = cos(sin(cos(Y-X).*cos(X+Y).*X).*Y...
            +cos(sin(X+Y).*sin(X-Y).*Y).*X);
        colorRange = [1 1 1; 0.36 0.34 0.35; 0.67 0.74 0.85];
        
    case 96
        zval = sin(cos(cos(Y-X).*sin(X+Y).*cos(Y-X).*X)...
            -sin(sin(X-Y).*cos(X+Y).*sin(X-Y).*Y));
        colorRange = [1 1 1; 0.28 0.3 0.4; 0.41 0.76 0.87];
        
    case 97
        zval = sin(2*cos(2*cos(Y-X).*sin(X+Y).*cos(Y-X).*X).^2 ...
            -2*sin(2*sin(X-Y).*cos(X+Y).*sin(X-Y).*Y).^2);
        colorRange = [1 1 1; 0.23 0.13 0.34; 0.9 0.78 0.7];
        
    case 98
        zval = sin(cos(cos(Y-X)-sin(X+Y).*cos(Y-X).*X)...
            +sin(sin(X-Y)+sin(X+Y).*sin(X-Y).*Y));
        colorRange = [0.35 0.3 0.27; 1 1 1; 0.6 0.6 0.57];
        
    case 99
        zval = cos((X+Y).*sin(X-Y).*cos(X+Y))...
            +sin((X-Y).*cos(X+Y).*sin(X-Y));
        colorRange = [1 1 1; 0.345 0.35 0.27; 0.9 0.87 0.45];
        
    case 100
        zval = sin(5*(Y.*cos(X+Y).*sin(X-Y)).*sin(X-Y).*cos(X+Y))...
            + cos(5*(X.*sin(X+Y).*cos(Y-X)).*cos(X+Y).*sin(X-Y));
        colorRange = [1 1 1; 0.55 0.35 0.43; 0.9 0.7 1];
        
    case 101
        zval = sin(3*(3*cos(X)+3*sin(Y)).*sin(X-Y).*cos(X+Y))...
            +cos(3*(3*sin(Y)-3*cos(X)).*cos(X+Y).*sin(X-Y));
        colorRange = [1 1 1; 0.35 0.35 0.16; 0.89 0.87 0.27];
        
    case 102
        zval = sin((Y.*cos(X).*X.*sin(Y)).*sin(X-Y).^3.*cos(X+Y).^2)...
            +cos((X.*sin(Y).*Y.*cos(X)).*cos(X+Y).^3.*sin(X-Y).^2);
        colorRange = [1 1 1; 0.35 0.35 0.43; 0.9 0.87 0.89];
        
    case 103
        zval = cos(2*(Y.*cos(X).*sin(Y)).*sin(Y-X).^2.*cos(X+Y).^2)...
            - sin(2*(X.*sin(Y).*cos(X)).*cos(Y-X).^2.*sin(X+Y).^3);
        colorRange = [1 1 1; 0.24 0.34 0.3; 0.8 0.79 0.85];
        
    case 104
        zval = cos((Y.*cos(X+Y)-X.*sin(Y-X)).*sin(Y-X).^4.*cos(X+Y).^2)....
            +sin((X.*sin(X+Y)+Y.*cos(X-Y)).*cos(Y-X).^2.*sin(X+Y).^4);
        colorRange = [1 1 1; 0.34 0.24 0.23; 0.8 0.7 0.9];
        
    case 105
        zval = cos(6*sin(X+Y).^2-10*(cos(X+Y).*sin(Y-X)).^4 ...
            + 7*sin(Y-X).*cos(X+Y))...
            + sin(6*cos(X-Y).^2+10*(sin(X+Y).*cos(X-Y)).^4 ...
            -7*cos(Y-X).*sin(X+Y));
        colorRange = [1 1 1; 0.4 0.4 0.5; 0.9 0.8 1];
        
    case 106
        zval = cos(sin(X+Y).^2+(Y.*cos(X+Y).^2 ...
            -X.*sin(Y-X).^2).*sin(X-Y).^3.*cos(X+Y).^3) ...
            +sin(cos(X-Y).^2-(X.*sin(X+Y).^2 ...
            +Y.*cos(X-Y).^2).*cos(Y-X).^3.*sin(X+Y).^3);
        colorRange = [1 1 1; 0.4 0.4 0.5; 0.9 0.8 1];
        
    case 107
        zval = cos((Y.*cos(X-Y).^2.*X.*sin(Y-X).^2)...
            - (sin(X-Y).^3.*cos(X-Y).^3)) ...
            + sin((X.*sin(X+Y).^2.*Y.*cos(X+Y).^2)...
            + (cos(X+Y).^3.*sin(X+Y).^3));
        colorRange = [1 1 1; 0.2 0.3 0.35; 0.79 0.89 0.57];
        
    case 108
        zval =(cos(X.*sin(X-Y).^2.*cos(X+Y).^2+Y.*cos(Y).*sin(Y))...
            +sin(Y.*cos(X+Y).^2.*sin(Y-X).^2-X.*sin(X).*cos(X)));
        colorRange = [1 1 1; 0.25 0.35 0.2; 0.7 0.87 0.68];
        
    case 109
        zval = sin(sin(cos(X+Y).*sin(X-Y).*cos(Y-X).*X)...
            - cos(sin(X-Y).*cos(X+Y).*sin(X-Y).*Y));
        colorRange = [1 1 1; 0.25 0.15 0.42; 0.487 0.568 0.86];
        
    case 110
        zval = sin(sin(cos(X+Y).^2.*sin(X-Y).*cos(Y-X).*Y)...
            - cos(sin(X-Y).^2.*cos(X+Y).*sin(X+Y).*X));
        colorRange = [1 1 1; 0.25 0.14 0.36; 0.67 0.58 0.8];
        
    case 111
        zval = sin(sin(cos(X+Y).*sin(X-Y).*cos(Y-X).*Y.^2)...
            - cos(sin(X-Y).*cos(X+Y).*sin(X+Y).*X.^2));
        colorRange = [1 1 1; 0.28 0.23 0.34; 0.4 0.58 0.8];
        
    case 112
        zval = sin(sin(cos(X+Y).^3.*sin(Y-X).^4.*Y)...
            -cos(sin(X-Y).^4.*cos(X+Y).^3.*X));
        colorRange = [1 1 1; 0.28 0.23 0.34; 0.79 0.8 0.47];
        
    case 113
        zval = sin(sin(cos(X+Y).*cos(X.^2).*sin(Y-X).*Y)...
            -cos(sin(X-Y).*sin(Y.^2).*cos(X+Y).*X));
        colorRange = [1 1 1; 0.15 0.25 0.34; 0.7 0.8 0.379];
        
    case 114
        zval = sin(3*sin(3*cos(X).^3-4*sin(Y).^2)...
            -3*cos(3*sin(Y).^3+4*cos(X).^2));
        colorRange = [1 1 1; 0.38 0.23 0.4; 0.8 0.69 0.47];
        
    case 115
        zval = sin(X.*sin(cos(X+Y).^3.*sin(Y-X).^2)...
            -Y.*cos(sin(Y-X).^2.*cos(X+Y).^3));
        colorRange = [1 1 1; 0.25 0.3 0.3; 0.47 0.78 0.79];
        
    case 116
        zval = sin(X.*sin(cos(X+Y).*sin(Y-X).*Y)...
            -Y.*cos(sin(Y-X).*cos(X+Y).*X));
        colorRange = [1 1 1; 0.3 0.5 0.5; 0.7 0.8 0.9];
        
    case 117
        zval = sin(sin(cos(X+Y).*sin(Y-X).*Y)...
            -cos(sin(Y-X).*cos(X+Y).*X))...
            .*cos(sin(cos(X+Y).*sin(Y-X).*Y)...
            -cos(sin(Y-X).*cos(X+Y).*X));
        colorRange = [1 1 1; 0.8 0.3 0.4; 1 0.9 0.7];
end %switch type end
end %calculatePattern end