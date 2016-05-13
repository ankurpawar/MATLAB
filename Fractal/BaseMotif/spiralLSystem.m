function spiralLSystem
% L-system made of spiral
% When prompt appear for iteration start with low iteration then increase
% it, otherwise a high value of iteration will execution run for longer
% time and take more memory. Start from 1 then increase number of iteration
% For good qaulity image,export the figure to EPS and convert it to PDF.

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

motif_len = length(motif);
motif_len_2 = motif_len+1;
% This loop expands the base motif based on the number of iterations
for n = 1:nIteration
    angle1 = zeros([4*length(angle),1]);
    for m = 1:length(angle)
        angle1(motif_len_2*m-motif_len:motif_len_2*m) = [angle(m) motif];
    end
    angle = angle1;
end

% Make a spiral, flip it and connect both of its the ends.
nPointSpiral = 100;
x = zeros(length(angle)*nPointSpiral, 1);
y = x;
phi2 = linspace(0,2*pi,nPointSpiral/2);
[sx,sy] = pol2cart(phi2,phi2);
sx = (sx - 2*pi)/(2*pi);
sx = [sx -fliplr(sx)]+1;
sy = [sy -fliplr(sy)]/(2*pi);
[sphi,rho] = cart2pol((sx)',(sy)');
xtemp = 0;
ytemp = 0;
phi = 0;
n = 1;
% Loop to replace angles with spiral
for k = 1:nPointSpiral:length(x)
    phi = phi+angle(n);
    [x1,y1] = pol2cart(sphi+phi,rho);
    x(k:(k+(nPointSpiral-1)),1) = xtemp + x1;
    y(k:(k+(nPointSpiral-1)),1) = ytemp + y1;
    xtemp = xtemp + x1(nPointSpiral,1);
    ytemp = ytemp + y1(nPointSpiral,1);
    n = n+1;
end

% black color
figure
line(x, y,'color','k');
axis equal off
set(gcf,'color',[1 1 1]);

% color
figure
nColor = 32;
cmap = makeColorMap(rand(1,3), rand(1,3), rand(1,3), nColor);
colormap(cmap);

% Color each spiral differently and when colors are over then repeat.
for n = 1:nPointSpiral:length(x)
    line(x(n:(n+(nPointSpiral-1))),y((n:(n+(nPointSpiral-1))))...
        ,'color',cmap(mod(n,nColor)+1,:));
end
axis equal off
set(gcf,'color',[1 1 1]);
end

function lSystemData = getLsystemData
% Function return structure array of base, motif and maximum iteration.
% Iteration are limited due to memory and time.
lSystemData(1).angle = [0 pi/2 pi/2 pi/2];
lSystemData(1).motif = [60 -120 60]*pi/180;
lSystemData(1).maxIteration = 3;

%inverse koch
lSystemData(2).angle = [0, -2/3*pi, -2/3*pi];
lSystemData(2).motif = [-pi/3 2*pi/3 -pi/3];
lSystemData(2).maxIteration = 3;

%koch snowflake
lSystemData(3).angle = [0, -2/3*pi, -2/3*pi];
lSystemData(3).motif = [pi/3 -2*pi/3 pi/3];
lSystemData(3).maxIteration = 3;

lSystemData(4).angle = [0 pi/2 pi/2 pi/2];
lSystemData(4).motif = [-90 90 90 0 -90 -90 90]*pi/180;
lSystemData(4).maxIteration = 3;

lSystemData(5).angle = [0 90 90 90]*pi/180;
lSystemData(5).motif = [-90 90 90 -90]*pi/180;
lSystemData(5).maxIteration = 3;

%box fractal
lSystemData(6).angle = [0 90 90 90]*pi/180;
lSystemData(6).motif = [90 -90 -90 90]*pi/180;
lSystemData(6).maxIteration = 3;
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