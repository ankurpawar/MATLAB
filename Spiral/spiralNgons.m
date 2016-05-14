function spiralNgons
%spiral Polygons
% N = 3 triangle, N = 4 square, N = 5 penatgon, N = 6 hexagon
nSideMin = 3;
nSideMax = 8;
nPolyMin = 10;
nPolyMax = 100;

N = getUserInput(['Enter a choice from ' num2str(nSideMin)...
    ' to ' num2str(nSideMax) ...
    '\n'] , nSideMin, nSideMax);

numPoly = getUserInput(['Enter a choice from ' num2str(nPolyMin)...
    ' to ' num2str(nPolyMax) ...
    '\n'] , nPolyMin, nPolyMax);

t = linspace(0,2*pi,N+1); %points for triangle
len = 1;
[x,y] = pol2cart(t,1);
theta = pi/70;
phi = pi/N;
colormap=makeColorMap([1 1 1],rand(1,3),numPoly);

for n = 1:numPoly
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor','none');
    len = len*cos(phi)/cos(phi-theta);
    [x,y] = trans2d(x,y,0,0,theta); %rotate by theta
end
axis equal off
end

function [xx,yy] = trans2d(x,y,tx,ty,phi)
xx = x.*cos(phi)-y.*sin(phi)+tx;
yy = x.*sin(phi)+y.*cos(phi)+ty;
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