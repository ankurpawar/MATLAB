function Lsystem
% L system
% When prompt appear for iteration start with low iteration then increase
% it, otherwise a high value of iteration will execution run for longer
% time and take more memory. Start from 3 then increase number of iteration

% Get l system data
lSystemData = getLsystemData;
[nRow, nColumn] = size(lSystemData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    ':'] , 1, nColumn);

base = lSystemData(choice).base;
motif = lSystemData(choice).motif;
phi = lSystemData(choice).phi;
MAX_ITERATION = lSystemData(choice).maxIteration;

nIteration = getUserInput(['Enter number of iteration from 1 to ' ...
    num2str(MAX_ITERATION) ':'], 1, MAX_ITERATION);

old_exp = base;
new_exp = [];

% expansion of string
for n = 1 : nIteration
    new_exp = [];
    len_old_exp = length(old_exp);
    for nn = 1:len_old_exp
        if old_exp(nn) == 'F'
            new_exp = [new_exp motif];
        else
            new_exp = [new_exp old_exp(nn)];
        end
    end
    clear('old_exp');
    old_exp = new_exp;
    clear('new_exp');
    
    if length(old_exp) >= 50000
        disp('No more iterations');
        break;
    end
end

%calculations for points of string
len_old_exp = length(old_exp);
fIndex = strfind(old_exp,'F');
xx = zeros(length(fIndex)+1,1);
yy = zeros(length(fIndex)+1,1);
xn = 0;
yn = 0;
xold = 0;
yold = 0;
theta = 0;
k = 2;
for n = 1:len_old_exp
    switch (old_exp(n))
        case 'F'   %only draw forward
            [xn,yn] = pol2cart(theta,1);
            xx(k) = xn+xx(k-1);
            yy(k) = yn+yy(k-1);
            k = k+1;
        case '-'
            theta = theta+phi; %anticlockwise
        case '+'
            theta = theta-phi; %clockwise
    end
end

% black color
figure
line(xx, yy,'color','k');
axis equal off
set(gcf,'color',[1 1 1]);

% color
figure
nColor = 32;
cmap = makeColorMap(rand(1,3), rand(1,3), rand(1,3), nColor);
colormap(cmap)
xx = [xx ; nan];
yy = [yy ; nan];
cIndex = mod(1:length(xx), nColor)+1;
patch(xx, yy, cIndex,'edgecolor','flat','facecolor','none');
axis equal off
set(gcf,'color',[1 1 1]);
end

function lSystemData = getLsystemData
% Function return structure array of base, motif, angle and maximum
% iteration. Iteration are limited due to memory,time and zoom level.
% More number of iteration, then more bigger images are generated.
% So to see spiral properly each time zoom is required.
lSystemData(1).base = 'F';
lSystemData(1).motif = '-F++F-';
lSystemData(1).phi = pi/4;
lSystemData(1).maxIteration = 10;

%Koch curve
lSystemData(2).base = 'F';
lSystemData(2).motif = 'F+F-F-F+F';
lSystemData(2).phi = pi/2;
lSystemData(2).maxIteration = 4;

%Pentaflake
lSystemData(3).base = 'F++F++F++F++F';
lSystemData(3).motif = 'F++F++F+++++F-F++F ';
lSystemData(3).phi = 36*pi/180;
lSystemData(3).maxIteration = 4;

lSystemData(4).base = 'F+F+F+F';
lSystemData(4).motif = 'FF+F++F+F';
lSystemData(4).phi = pi/2;
lSystemData(4).maxIteration = 4;

lSystemData(5).base = 'F+F+F+F';
lSystemData(5).motif = 'FF+F+F+F+F+F-F';
lSystemData(5).phi = pi/2;
lSystemData(5).maxIteration = 3;

lSystemData(6).base = 'F+F+F+F';
lSystemData(6).motif = 'FF+F+F+F+FF';
lSystemData(6).phi = pi/2;
lSystemData(6).maxIteration = 3;

%Pentigree
lSystemData(7).base = 'F-F-F-F-F';
lSystemData(7).motif = 'F-F++F+F-F-F';
lSystemData(7).phi =  72*pi/180;
lSystemData(7).maxIteration = 3;

%Koch curve2
lSystemData(8).base = 'F';
lSystemData(8).motif = 'F+F-F-F+F';
lSystemData(8).phi = 85*pi/180;
lSystemData(8).maxIteration = 4;
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