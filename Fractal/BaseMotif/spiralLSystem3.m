function spiralLSystem3
% L-system made of spiral
% When prompt appear for iteration start with low iteration then increase
% it, otherwise a high value of iteration will execution run for longer
% time and take more memory. Start from 1 then increase number of iteration
% For good qaulity image,export the figure to EPS and convert it to PDF.
% 'F' draw forward
% phi is angle
% '+' clockwise turn by phi angle,'-' anticlockwise turn by phi angle
% 'X' do nothing,'Y'do nothing
% 'A' draw forward,'B' draw forward

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
% This loop expands the base motif based on the number of iterations
for n = 1:nIteration
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

% Make a spiral, flip it and connect both of its the ends.
nPointSpiral = 100;
phi2 = linspace(0,2*pi,50);
[sx,sy] = pol2cart(phi2,phi2);
sx = (sx-2*pi)/(2*pi);
sx = [sx -fliplr(sx)]+1;
sy = [sy -fliplr(sy)]/(2*pi);
[sphi,rho] = cart2pol((sx)',(sy)');

% Find the number of spirals to be drawn. In string 'F' is a spiral '+','-'
% are angle.
len_old_exp = length(old_exp);
fIndex = strfind(old_exp,'F');
x = zeros(length(fIndex)*100,1);
y = zeros(length(fIndex)*100,1);
xn = 0;
yn = 0;
xtemp = 0;
ytemp = 0;
theta = 0;
k = 1;
for n = 1:len_old_exp
    switch (old_exp(n))
        case {'A','B','F'}   %only draw forward
            [xn,yn] = pol2cart(sphi+theta,rho);
            x(k:k+(nPointSpiral-1),1) = xtemp+xn;
            y(k:k+(nPointSpiral-1),1) = ytemp+yn;
            xtemp = xtemp+xn(nPointSpiral,1);
            ytemp = ytemp+yn(nPointSpiral,1);
            k = k + nPointSpiral;
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

%Sierpinski triangle
lSystemData(1).base = 'A';
lSystemData(1).rule1 = 'B-A-B';
lSystemData(1).rule2 = 'A+B+A';
lSystemData(1).phi = pi/3;
lSystemData(1).maxIteration = 5;

%Dragon curve
lSystemData(2).base = 'FX';
lSystemData(2).rule1 = 'X+YF';
lSystemData(2).rule2 = 'FX-Y';
lSystemData(2).phi = pi/2;
lSystemData(2).maxIteration = 8;

lSystemData(3).base = 'F+XF+F+XF';
lSystemData(3).rule1 = 'XF-F+F-XF+F+XF-F+F-X';
lSystemData(3).rule2 = 'Y';
lSystemData(3).phi = pi/2;
lSystemData(3).maxIteration = 3;

lSystemData(4).base = 'Y';
lSystemData(4).rule1 = 'XF+F+XF-F-F-XF-F+F+F-F+F+F-X';
lSystemData(4).rule2 = 'XF+F+XF+F+XF+F';
lSystemData(4).phi = pi/3;
lSystemData(4).maxIteration = 3;

%Pentant
lSystemData(5).base = 'X-X-X-X-X';
lSystemData(5).rule1 = 'FX-FX-FX+FY+FY+FX-FX';
lSystemData(5).rule2 = 'FY+FY-FX-FX-FY+FY+FY';
lSystemData(5).phi = 72*pi/180;
lSystemData(5).maxIteration = 2;

%Hilbert curve
lSystemData(6).base = 'Y';
lSystemData(6).rule1 = '-YF+XFX+FY-';
lSystemData(6).rule2 = '+XF-YFY-FX+';
lSystemData(6).phi = 90*pi/180;
lSystemData(6).maxIteration = 4;

%Dragon curve 2
lSystemData(7).base = '-X';
lSystemData(7).rule1 = 'X+F+Y';
lSystemData(7).rule2 = 'X-F-Y';
lSystemData(7).phi = pi/4;
lSystemData(7).maxIteration = 8;

%sirepinski
lSystemData(8).base = 'Y--F--Y--F';
lSystemData(8).rule1 = '-Y+F+Y-';
lSystemData(8).rule2 = '+X-F-X+';
lSystemData(8).phi  = pi/4;
lSystemData(8).maxIteration = 7;
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