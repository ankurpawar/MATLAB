function supershapes
% supershapes

% get spiral data.
shapeData = getShapeData;

[nRow, nColumn] = size(shapeData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    '\n'] , 1, nColumn);
tMin = shapeData(choice).range(1);
tMax = shapeData(choice).range(2);
num = shapeData(choice).const;
t = linspace(tMin, tMax, 1500);
a = num(1);
b = num(2);
m = num(3);
n1 = num(4);
n2 = num(5);
n3 = num(6);
r = 1./((abs(1/a*cos(0.25*m*t)).^n2 + ...
    abs(1/b*sin(0.25*m*t)).^n3).^(1/n1));
x = r.*cos(t);
y = r.*sin(t);
line(x,y);
axis equal off
set(gcf,'color',[1 1 1]);
end

function shapeData = getShapeData
%function return array of structure containing constant and range
shapeData(1).const = [1 1 6 0.4 0 6];
shapeData(1).range = [0 2*pi];

shapeData(2).const = [1 2 3 30 30 30];
shapeData(2).range = [-2*pi 2*pi];

shapeData(3).const = [1 1 10 0.6 0 20];
shapeData(3).range = [0 2*pi];

shapeData(4).const = [1 1 2.5 1/1.3 2.7 2.7];
shapeData(4).range = [-2*pi 2*pi];

shapeData(5).const = [1 1 2.5 5 5 5];
shapeData(5).range = [-2*pi 2*pi];

shapeData(6).const = [1 1 7/6 0.3 0.3 0.3];
shapeData(6).range = [-6*pi 6*pi];

shapeData(7).const = [0.1 2 3 0.4 5 0.6];
shapeData(7).range = [-2*pi 2*pi];

shapeData(8).const = [1 3 5 7 9 11];
shapeData(8).range = [-2*pi 2*pi];

shapeData(9).const = [2 4 6 8 10 12];
shapeData(9).range = [0 2*pi];

shapeData(10).const = [1 4 9 16 25 36];
shapeData(10).range = [-2*pi 2*pi];

shapeData(11).const = [6 5 4 3 2 1];
shapeData(11).range = [0 2*pi];

shapeData(12).const = [11 9 7 5 3 1];
shapeData(12).range = [-2*pi 2*pi];

shapeData(13).const = [12 10 8 6 4 2];
shapeData(13).range = [0 2*pi];

shapeData(14).const = [1 1 13/6 0.3 0.3 0.3];
shapeData(14).range = [-6*pi 6*pi];

shapeData(15).const = [0.1 0.1 6 12 0 8];
shapeData(15).range = [0 2*pi];

shapeData(16).const = [1 1 5 0.2 1 4];
shapeData(16).range = [-2*pi 2*pi];

shapeData(17).const = [3 2 4 3 3 3 1];
shapeData(17).range = [0 2*pi];

shapeData(18).const = [1 1 6 60 20 80 1];
shapeData(18).range = [0 2*pi];

shapeData(19).const = [1 1 32 0.3 1 9 6];
shapeData(19).range = [0 2*pi];

shapeData(20).const = [1 1 20 2 6 6 3];
shapeData(20).range = [0 2*pi];

shapeData(21).const = [1 1 9 0.8 0 1 3];
shapeData(21).range = [-2*pi 2*pi];
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