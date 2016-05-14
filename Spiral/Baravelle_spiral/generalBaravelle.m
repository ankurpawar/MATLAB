function generalBaravelle
%generalized baravelle spiral
% N = 3 triangle, N = 4 square, N = 5 penatgon, N = 6 hexagon
% get user input from command window
nSideMin = 3;
nSideMax = 8;
N = getUserInput(['Enter a choice from ' num2str(nSideMin)...
    ' to ' num2str(nSideMax) ...
    '\n'] , nSideMin, nSideMax);

phi = pi/N;
t = linspace(0+phi,2*pi+phi,N+1);
len = 1;
cmap = 1-copper(N);
theta = 0;
for k = 1:15
    for n = 1:N
        [x,y] = pol2cart([phi 2*phi 3*phi]+t(n)+theta...
            ,[len*cos(pi/N),len,len*cos(pi/N)]);
        patch(x,y,'r','facecolor',cmap(n,:),'edgecolor',cmap(n,:));
    end
    theta = theta+phi;
    len = len*cos(pi/N);
end
axis equal off
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