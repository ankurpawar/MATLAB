function wheelson
% Ferris wheels
curveData = getFerrisData;
[nRow, nColumn] = size(curveData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    '\n'] , 1, nColumn);

minT = curveData(choice).range(1);
maxT = curveData(choice).range(2);
t = linspace(minT,maxT,1000);
a = curveData(choice).const;
z = exp(i*a(1)*t)+exp(i*a(2)*t)/2+exp(i*a(3)*t)/3;
y = imag(z);
x = real(z);
line(x,y,'color',[0.5 0.5 0.8]);
axis equal off
set(gcf,'color',[1 1 1]);
end

function ferrisData = getFerrisData
% function return array of structure containing data and range for curve.
ferrisData(1).const = [1 7 -17];
ferrisData(1).range = [0 2*pi];

ferrisData(2).const = [4 0 -2];
ferrisData(2).range = [0 pi];

ferrisData(3).const = [0 2 -6];
ferrisData(3).range = [0 pi];

ferrisData(4).const = [1 -5 7];
ferrisData(4).range = [0 2*pi];

ferrisData(5).const = [-1 -6 2];
ferrisData(5).range = [0 2*pi];

ferrisData(6).const = [-4 3 -9];
ferrisData(6).range = [0 2*pi];

ferrisData(7).const = [-2 4 -5];
ferrisData(7).range = [0 2*pi];

ferrisData(8).const = [1 8 -5];
ferrisData(8).range = [0 2*pi];

ferrisData(9).const = [ -2 5 19];
ferrisData(9).range = [0 2*pi];

ferrisData(10).const = [2 -8 -17];
ferrisData(10).range = [0 2*pi];

ferrisData(11).const = [1 -8 -17];
ferrisData(11).range = [0 2*pi];

ferrisData(12).const = [1 -16 -17];
ferrisData(12).range = [0 2*pi];

ferrisData(13).const = [-1 -10 -10];
ferrisData(13).range = [0 2*pi];

ferrisData(14).const = [-6 2 2];
ferrisData(14).range = [0 pi];

ferrisData(15).const = [-2 7 4];
ferrisData(15).range = [0 2*pi];

ferrisData(16).const = [-4 -18 17];
ferrisData(16).range = [0 2*pi];

ferrisData(17).const = [-2 8 -10];
ferrisData(17).range = [0 pi];

ferrisData(18).const = [14 -19 0];
ferrisData(18).range = [0 2*pi];

ferrisData(19).const = [4 -3 -10];
ferrisData(19).range = [0 2*pi];

ferrisData(20).const = [-2 7 -9];
ferrisData(20).range = [0 2*pi];

ferrisData(21).const = [2 -5 -7];
ferrisData(21).range = [0 2*pi];

ferrisData(22).const = [-2 3 6];
ferrisData(22).range = [0 2*pi];

ferrisData(23).const = [-2.5 4.5 -7];
ferrisData(23).range = [-2*pi 2*pi];

ferrisData(24).const = [-5.5 9 3.5];
ferrisData(24).range = [-2*pi 2*pi];

ferrisData(25).const = [3.5 -2.5 6.5];
ferrisData(25).range = [-2*pi 2*pi];
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