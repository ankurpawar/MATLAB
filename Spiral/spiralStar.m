function spiralStar
% spiral Star
% number of sides of polygon
% N = 3 triangle, N = 4 square, N = 5 penatgon, N = 6 hexagon
nSideMin = 3;
nSideMax = 6;
nPolyMin = 10;
nPolyMax = 100;

%get user input
N = getUserInput(['Enter a choice from ' num2str(nSideMin)...
    ' to ' num2str(nSideMax) ...
    '\n'] , nSideMin, nSideMax);

nPolygon = getUserInput(['Enter a choice from ' num2str(nPolyMin)...
    ' to ' num2str(nPolyMax) ...
    '\n'] , nPolyMin, nPolyMax);

theta=pi/100;
phi=pi/N;
colormap=makeColorMap(rand(1,3),[1 1 1],rand(1,3),nPolygon);

figure
drawSpiralStar1(N,theta,phi,nPolygon,colormap);
axis equal off

figure
drawSpiralStar2(N,theta,phi,nPolygon,colormap);
axis equal off
end

function [xx,yy]=trans2d(x,y,tx,ty,phi)
xx=x.*cos(phi)-y.*sin(phi)+tx;
yy=x.*sin(phi)+y.*cos(phi)+ty;
end

function drawSpiralStar1(N,theta,phi,nPolygon,colormap)
t=linspace(0,2*pi,N+1); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
for n=1:nPolygon
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    patch(len*x,-len*y,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end
end

function drawSpiralStar2(N,theta,phi,nPolygon,colormap)
t=linspace(0,2*pi,N+1); %points for triangle
len=1;
[x,y]=pol2cart(t,1);
for n=1:nPolygon
    patch(len*x,len*y,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    patch(-len*x,-len*y,'r','facecolor',colormap(n,:),'edgecolor',colormap(n,:));
    len=len*cos(phi)/cos(phi-theta);
    [x,y]=trans2d(x,y,0,0,theta); %rotate by theta
end
end

function choice = getUserInput(promptStr, minNum, maxNum)
% return the user input and check the range of input
choice = input(promptStr);
if isempty(choice) || ~isnumeric(choice)
    error('enter a number');
elseif (choice < minNum) || (choice > maxNum)
    error(['enter a number between' num2str(minNum) ' to ' num2str(maxNum)]);
elseif isfloat(choice)
    %if choice is floating point value then truncate the fractional part
    choice = choice - mod(choice,1);
end
end