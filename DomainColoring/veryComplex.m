function veryComplex
% Script to test domainColoring function. 92 different images that can be
% generated. There are various complex functions that will use all the 30 
% types of coloring available in the domainColoring function.
% See testDomainColoring.m file for simple use of function.
IMG_WIDTH = 500;
IMG_HEIGHT = 500;
X_MIN = -pi;
X_MAX = pi;
Y_MIN = -pi;
Y_MAX = pi;

nFunc = 92;
choice = getUserInput(['Enter a choice from 1 to ' num2str(nFunc)], 1, 92);

X = linspace(X_MIN,X_MAX,IMG_WIDTH);
Y = linspace(Y_MIN,Y_MAX,IMG_HEIGHT);
lenx = length(X);
leny = length(Y);
Z = zeros(IMG_HEIGHT, IMG_WIDTH);
imgHSV = zeros(IMG_HEIGHT, IMG_WIDTH, 3);

for n = 1:lenx
    Z(n,:) = X(:)+i*Y(n);
end

switch choice
    case 1
        fh = @(Z)((1-Z)./(Z+1));
        type = 1;
    case 2
        fh = @(Z)(tan(Z));
        type = 2;
    case 3
        fh = @(Z)(Z.^Z);
        type = 2;
    case 4
        fh = @(Z)(Z.^2 - 1./Z);
        type = 2;
    case 5
        fh = @(Z)((Z-1)./(Z+1));
        type = 3;
    case 6
        fh = @(Z)(Z.^2 - 1./Z);
        type = 3;
    case 7
        fh = @(Z)(Z.^Z);
        type = 4;
    case 8
        fh = @(Z)(log(Z));
        type = 4;
    case 9
        fh = @(Z)(cot(Z));
        type = 4;
    case 10
        fh = @(Z)(Z.^2 - 1./Z);
        type = 4;
    case 11
        fh = @(Z)(Z.^3 - cos(Z));
        type = 4;
    case 12
        fh = @(Z)(1./(Z.^3+i));
        type = 5;
    case 13
        fh = @(Z)(sqrt(Z).^Z);
        type = 5;
    case 14
        fh = @(Z)(1./(Z).^4);
        type = 5;
    case 15
        fh = @(Z)(1./sqrt(Z).^(5+2*i));
        type = 5;
    case 16
        fh = @(Z)((Z.^3+i-1)./(Z.^3+i+1));
        type = 5;
    case 17
        fh = @(Z)(i./sqrt(Z)./log(Z));
        type = 5;
    case 18
        fh = @(Z)((Z.^3+i-1)./(Z.^3+i+1));
        type = 6;
    case 19
        fh = @(Z)(Z-1./Z+sin(Z));
        type = 6;
    case 20
        fh = @(Z)((Z-1)./(Z+1));
        type = 6;
    case 21
        fh = @(Z)(atanh(Z)-1./(1-Z+sin(Z)));
        type = 6;
    case 22
        fh = @(Z)((1./Z)+sin(Z)+log(1./Z));
        type = 7;
    case 23
        fh = @(Z)((Z-1)./(Z+1));
        type = 7;
    case 24
        fh = @(Z)((1./Z)+tan(Z)+log(1./Z));
        type = 8;
    case 25
        fh = @(Z)((Z)+Z.^2+1./Z);
        type = 9;
    case 26
        fh = @(Z)(tan(Z)+(1-Z)./(Z+1));
        type = 10;
    case 27
        fh = @(Z)((Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i));
        type = 11;
    case 28
        fh = @(Z)((1./Z)+(Z.^i)+log(1./Z));
        type = 11;
    case 29
        fh = @(Z)(Z-1./Z-tan(Z));
        type = 11;
    case 30
        fh = @(Z)((Z-2)./(1+Z));
        type = 11;
    case 31
        fh = @(Z)((1./Z)+(Z./i)+log(1./i));
        type = 12;
    case 32
        fh = @(Z)(tan(Z)+(1./Z.^(i/exp(1))));
        type = 12;
    case 33
        fh = @(Z)(tanh(Z));
        type = 13;
    case 34
        fh = @(Z)(tan(Z));
        type = 14;
    case 35
        fh = @(Z)((1./Z)+(Z./i)+log(1./i));
        type = 14;
    case 36
        fh = @(Z)(log(i-i./Z.^i)+i./Z);
        type = 15;
    case 37
        fh = @(Z)(sin(Z));
        type = 16;
    case 38
        fh = @(Z)((Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i));
        type = 17;
    case 39
        fh = @(Z)((1+Z)./(1-Z));
        type = 17;
    case 40
        fh = @(Z)((Z-1)./(Z+1));
        type = 17;
    case 41
        fh = @(Z)((Z.^1-1).^((1.5*i)/(0.5*pi)-0.1)./...
            (Z.^1+1).^((1.5*i)/(0.5*pi)-0.1));
        type = 17;
    case 42
        fh = @(Z)((Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i));
        type = 18;
    case 43
        fh = @(Z)((1+Z)./(1-Z));
        type = 18;
    case 44
        fh = @(Z)((Z-1)./(Z+1));
        type = 18;
    case 45
        fh = @(Z)(Z);
        type = 18;
    case 46
        fh = @(Z)(tan(1./i*Z)+1./(Z*0.5));
        type = 18;
    case 47
        fh = @(Z)(((1-Z.^2)./(1+Z.^2-i)).^(2*i/(pi)+1));
        type = 19;
    case 48
        fh = @(Z)(((1-Z.^2+i)./(1+Z.^2-i)).^(1./(pi)+1));
        type = 19;
    case 49
        fh = @(Z)((Z.^(1.5*i/pi-1)));
        type = 19;
    case 50
        fh = @(Z)((Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i));
        type = 19;
    case 51
        fh = @(Z)(log(1-1./Z)./(sinh(Z)));
        type = 19;
    case 52
        fh = @(Z)(1./(Z).^(1*i/(0.5*pi)-1));
        type = 19;
    case 53
        fh = @(Z)(tan(Z).^(1*i/(2*pi)-1));
        type = 19;
    case 54
        fh = @(Z)((Z-1).^((1*i)/(0.5*pi)-1)./(Z+1).^((1*i)/(0.5*pi)-1));
        type = 19;
    case 55
        fh = @(Z)(tan(i.*(Z+1))+Z);
        type = 20;
    case 56
        fh = @(Z)(Z.^sqrt(Z));
        type = 20;
    case 57
        fh = @(Z)((1-Z)./(1+Z));
        type = 20;
    case 58
        fh = @(Z)(1./log(Z).^sqrt(Z));
        type = 20;
    case 59
        fh = @(Z)(1./(Z));
        type = 20;
    case 60
        fh = @(Z)((Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i));
        type = 21;
    case 61
        fh = @(Z)(tan(2*Z+i)./(3*Z-i*3-1));
        type = 22;
    case 62
        fh = @(Z)(1./(Z).^(1*i/(1*pi)-1));
        type = 22 ;
    case 63
        fh = @(Z)((Z.^2-i)./(2*Z.^2+2*i));
        type = 22 ;
    case 64
        fh = @(Z)(tan(2.^Z)+tan(1./2.^Z));
        type = 22 ;
    case 65
        fh = @(Z)((tan(Z-1).*(Z+1))./(tanh(Z+i)./(Z-i)));
        type = 22 ;
    case 66
        fh = @(Z)(-i./atan(Z));
        type = 22 ;
    case 67
        fh = @(Z)((Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i));
        type = 23;
    case 68
        fh = @(Z)(log(Z).^asin(Z));
        type = 23;
    case 69
        fh = @(Z)((Z./(i+Z))-(1/pi));
        type = 23;
    case 70
        fh = @(Z)((Z-1)./(Z+1));
        type = 23;
    case 71
        fh = @(Z)(tan(Z)-(1*i/(3*pi)-i));
        type = 23;
    case 72
        fh = @(Z)(tan(Z)-(1*i/(3*pi)-1./Z));
        type = 24 ;
    case 73
        fh = @(Z)(Z);
        type = 24 ;
    case 74
        fh = @(Z)((1-Z)./(Z+1));
        type = 24 ;
    case 75
        fh = @(Z)((Z-1)./(Z+1));
        type = 24 ;
    case 76
        fh = @(Z)(Z);
        type = 24 ;
    case 77
        fh = @(Z)((Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i));
        type = 25;
    case 78
        fh = @(Z)((1+Z)./(1-Z));
        type = 25;
    case 79
        fh = @(Z)((Z-1)./(Z+1));
        type = 25;
    case 80
        fh = @(Z)(Z);
        type = 25;
    case 81
        fh = @(Z)(Z);
        type = 26;
    case 82
        fh = @(Z)(1./(Z));
        type = 26;
    case 83
        fh = @(Z)(1./(cos(Z)-sinh(Z)));
        type = 26;
    case 84
        fh = @(Z)(Z./sqrt(Z)-Z./log(Z));
        type = 26;
    case 85
        fh = @(Z)(tan(Z+i)+((Z+i)./(Z-i)));
        type = 26;
    case 86
        fh = @(Z)(atan((1-Z)./(1+Z)));
        type = 27;
    case 87
        fh = @(Z)((Z).^(i/(2*pi)-1));
        type = 27;
    case 88
        fh = @(Z)(1./(cos(Z)-sinh(Z)));
        type = 27;
    case 89
        fh = @(Z)(sqrt(Z)./log(Z));
        type = 27;
    case 90
        fh = @(Z)((1+Z)./(1-Z));
        type = 28;
    case 91
        fh = @(Z)((i.*Z)-i./Z);
        type = 29;
    case 92
        fh = @(Z)(sin(pi+Z)+i);
        type = 30;
end

imgHSV = domainColoring(fh(Z), type);

%convert HSV to RGB
rgb = hsv2rgb(imgHSV);
imshow(rgb);
comment = char(fh);
imwrite(rgb,['domainColor' num2str(choice) '_' ...
    'type' num2str(type) '.png'],'png', 'Comment', comment);
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