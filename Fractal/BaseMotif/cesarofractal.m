function cesarofractal
% cesaro fractal

% Get l system data
fractalData = getFractalData;
[nRow, nColumn] = size(fractalData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    ':'] , 1, nColumn);

base = fractalData(choice).base;
motif = fractalData(choice).motif;
MAX_ITERATION = fractalData(choice).maxIteration;

nIteration = getUserInput(['Enter number of iteration from 1 to ' ...
    num2str(MAX_ITERATION) ':'], 1, MAX_ITERATION);

angle_new = [];

% Prepare motif
for n = 1 : nIteration
    angle_new = [angle_new motif(1)...
        angle_new motif(2)...
        angle_new motif(3)...
        angle_new];
end

% Prepare base
angle_new = [base(1) angle_new ...
    base(2) angle_new ...
    base(3) angle_new ...
    base(4) angle_new ...
    0];

len_angle = length(angle_new);
x_arr = zeros(len_angle,1);
y_arr = x_arr;
x = 0;
y = 0;
xn = 0;
yn = 0;
motif = 0;
%length of each section
len = 1;

for n = 1 : len_angle
    [xn,yn] = pol2cart(motif, len);
    motif = angle_new(n)+motif;
    x = x+xn;
    y = y+yn;
    x_arr(n) = x;
    y_arr(n) = y;
end

% black color
figure
line(x_arr,y_arr,'color','k');
axis equal off
set(gcf,'color',[1 1 1]);

% hsv color
figure
nColor = 128;
cmap = makeColorMap(rand(1,3), rand(1,3), rand(1,3), nColor);
colormap(cmap);
x_arr = [x_arr;nan];
y_arr = [y_arr;nan];
cIndex = mod(1:length(x_arr), nColor)+1;
patch(x_arr, y_arr, cIndex...
    ,'edgecolor', 'flat', 'facecolor', 'none');
axis equal off
set(gcf,'color',[1 1 1]);
end

function fractalData = getFractalData
% Function return structure array of base, motif and maximum iteration.
% Iteration are limited due to memory and time.
fractalData(1).base = [0 pi/2 pi/2 pi/2];
fractalData(1).motif = [85 -170 85]*pi/180;
fractalData(1).maxIteration = 5;

fractalData(2).base = [0 pi/2 pi/2 pi/2];
fractalData(2).motif = [-85 170 -85]*pi/180;
fractalData(2).maxIteration = 5;

fractalData(3).base = [0 pi/2 pi/2 pi/2];
fractalData(3).motif = [-80 160 -80]*pi/180;
fractalData(3).maxIteration = 5;
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