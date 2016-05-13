function Lsystem2
% L system
% 'F' draw forward
% phi angle
% '+' clockwise turn by phi angle,'-' anticlockwise turn by phi angle
% 'X' do nothing,'Y'do nothing
% 'A' draw forward,'B' draw forward
% When prompt appear for iteration start with low iteration then increase
% it, otherwise a high value of iteration will execution run for longer
% time and take more memory. Start from 3 then increase number of iteration

% Get l system data
lSystemData = getLsystemData;
[nRow, nColumn] = size(lSystemData);
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(nColumn) ...
    ':'] , 1, nColumn);

phi = lSystemData(choice).phi;
base = lSystemData(choice).base;
rule1 = lSystemData(choice).rule1;
rule2 = lSystemData(choice).rule2;
MAX_ITERATION = lSystemData(choice).maxIteration;

nIteration = getUserInput(['Enter number of iteration from 1 to ' ...
    num2str(MAX_ITERATION) ':'], 1, MAX_ITERATION);

old_exp = base;
new_exp = [];

%expansion of string
for n = 1 : nIteration
    new_exp = [];
    len_old_exp = length(old_exp);
    for nn = 1:len_old_exp
        if old_exp(nn) == 'A'
            new_exp = [new_exp rule1];
        elseif old_exp(nn) == 'B'
            new_exp = [new_exp rule2];
        elseif old_exp(nn) == 'X'
            new_exp = [new_exp rule1];
        elseif old_exp(nn) == 'Y'
            new_exp = [new_exp rule2];
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
xn = 0;
yn = 0;
xx = [0];
yy = [0];
theta = 0;
for n = 1:len_old_exp
    switch old_exp(n)
        case {'A','B','F'}   %only draw forward
            [xn,yn] = pol2cart(theta,1);
            xx = [xx xx(end)+xn];
            yy = [yy yy(end)+yn];
        case '-'
            theta = theta+phi; %anticlockwise
        case '+'
            theta = theta-phi; %clockwise
        otherwise
            %do nothing
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
colormap(cmap);
xx = [xx nan];
yy = [yy nan];
cIndex = mod(1:length(xx), nColor)+1;
patch(xx, yy, cIndex,'edgecolor','flat','facecolor','none');
axis equal off
set(gcf,'color',[1 1 1]);
end

function lSystemData = getLsystemData

%Sierpinski triangle
lSystemData(1).base = 'A';
lSystemData(1).rule1 = 'B-A-B';
lSystemData(1).rule2 = 'A+B+A';
lSystemData(1).phi = pi/3;
lSystemData(1).maxIteration = 7;

%Dragon curve
lSystemData(2).base = 'FX';
lSystemData(2).rule1 = 'X+YF';
lSystemData(2).rule2 = 'FX-Y';
lSystemData(2).phi = pi/2;
lSystemData(2).maxIteration = 10;

lSystemData(3).base = 'F+XF+F+XF';
lSystemData(3).rule1 = 'XF-F+F-XF+F+XF-F+F-X';
lSystemData(3).rule2 = 'Y';
lSystemData(3).phi = pi/2;
lSystemData(3).maxIteration = 4;

lSystemData(4).base = 'Y';
lSystemData(4).rule1 = 'XF+F+XF-F-F-XF-F+F+F-F+F+F-X';
lSystemData(4).rule2 = 'XF+F+XF+F+XF+F';
lSystemData(4).phi = pi/3;
lSystemData(4).maxIteration = 4;

%Pentant
lSystemData(5).base = 'X-X-X-X-X';
lSystemData(5).rule1 = 'FX-FX-FX+FY+FY+FX-FX';
lSystemData(5).rule2 = 'FY+FY-FX-FX-FY+FY+FY';
lSystemData(5).phi = 72*pi/180;
lSystemData(5).maxIteration = 4;

%Hilbert curve
lSystemData(6).base = 'Y';
lSystemData(6).rule1 = '-YF+XFX+FY-';
lSystemData(6).rule2 = '+XF-YFY-FX+';
lSystemData(6).phi = 90*pi/180;
lSystemData(6).maxIteration = 5;

%Dragon curve 2
lSystemData(7).base = '-X';
lSystemData(7).rule1 = 'X+F+Y';
lSystemData(7).rule2 = 'X-F-Y';
lSystemData(7).phi = pi/4;
lSystemData(7).maxIteration = 10;

%sirepinski
lSystemData(8).base = 'Y--F--Y--F';
lSystemData(8).rule1 = '-Y+F+Y-';
lSystemData(8).rule2 = '+X-F-X+';
lSystemData(8).phi  = pi/4;
lSystemData(8).maxIteration = 8;
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