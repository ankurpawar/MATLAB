function modifiedcode
% modified code for base motif fractal
% When prompt appear for iteration start with low iteration then increase
% it, otherwise a high value of iteration will execution run for longer
% time and take more memory. Start from 3 then increase number of iteration

% Get l system data
lSystemData = getLsystemData;
[nRow, nColumn] = size(lSystemData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    ':'] , 1, nColumn);

angle = lSystemData(choice).angle;
motif = lSystemData(choice).motif;
MAX_ITERATION = lSystemData(choice).maxIteration;

nIteration = getUserInput(['Enter number of iteration from 1 to ' ...
    num2str(MAX_ITERATION) ':'], 1, MAX_ITERATION);

%length of a section
len = 1;
motif_len = length(motif);
motif_len_2 = motif_len+1;
for i = 1:nIteration
    len = len/3;
    angle1 = zeros([4*length(angle),1]);
    for j = 1:length(angle)
        angle1((motif_len_2*j - motif_len) : motif_len_2*j) =...
            [angle(j) motif];
    end
    angle = angle1;
end

x = zeros([length(angle)+1, 1]);
y = x;
x(1) = 0;
y(1) = 0;
phi = 0;

for i = 1:length(angle);
    phi = phi+angle(i);
    x(i+1) = x(i) + len * cos(phi);
    y(i+1) = y(i) + len * sin(phi);
end

% black color
figure
line(x, y,'color','k');
axis equal off
set(gcf,'color',[1 1 1]);

% jet color
figure
nColor = 32;
cmap = makeColorMap(rand(1,3), rand(1,3), rand(1,3), nColor);
colormap(cmap);
x = [x ; nan];
y = [y ; nan];
cIndex = mod(1:length(x), nColor)+1;
patch(x, y, cIndex,'edgecolor','flat','facecolor','none');
axis equal off
set(gcf,'color',[1 1 1]);
end

function lSystemData = getLsystemData
% Function return structure array of base, motif and maximum iteration.
% Iteration are limited due to memory and time.
lSystemData(1).angle = [0 pi/2 pi/2 pi/2];
lSystemData(1).motif = [60 -120 60]*pi/180;
lSystemData(1).maxIteration = 4;

%inverse koch
lSystemData(2).angle = [0, -2/3*pi, -2/3*pi];
lSystemData(2).motif = [-pi/3 2*pi/3 -pi/3];
lSystemData(2).maxIteration = 4;

%koch snowflake
lSystemData(3).angle = [0, -2/3*pi, -2/3*pi];
lSystemData(3).motif = [pi/3 -2*pi/3 pi/3];
lSystemData(3).maxIteration = 4;

lSystemData(4).angle = [0 pi/2 pi/2 pi/2];
lSystemData(4).motif = [-90 90 90 0 -90 -90 90]*pi/180;
lSystemData(4).maxIteration = 3;

lSystemData(5).angle = [0 90 90 90]*pi/180;
lSystemData(5).motif = [-90 90 90 -90]*pi/180;
lSystemData(5).maxIteration = 4;

%box fractal
lSystemData(6).angle = [0 90 90 90]*pi/180;
lSystemData(6).motif = [90 -90 -90 90]*pi/180;
lSystemData(6).maxIteration = 4;

lSystemData(7).angle=[0 pi/2 pi/2 pi/2];
lSystemData(7).motif=[85 -170 85]*pi/180;
lSystemData(7).maxIteration = 5;

%cesaro fractal2
lSystemData(8).angle  =[0 pi/2 pi/2 pi/2];
lSystemData(8).motif=[-85 170 -85]*pi/180;
lSystemData(8).maxIteration = 5;

lSystemData(9).angle= [0 90 90 90]*pi/180;
lSystemData(9).motif = [-45 -135 225 -45]*pi/180;
lSystemData(9).maxIteration = 5;

lSystemData(10).angle = [0 90 90 90]*pi/180;
lSystemData(10).motif = [45 135 -225 45]*pi/180;
lSystemData(10).maxIteration = 5;

lSystemData(11).angle = [30 60 60 60 60 60]*pi/180;
lSystemData(11).motif = [85 -170 85]*pi/180;
lSystemData(11).maxIteration = 5;
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