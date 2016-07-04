function epitrochoid
% epitrochoid
% Maximise the figure window to get the complete annotated plot
MAX_EPI = 4;
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(MAX_EPI) ...
    '\n'] , 1, MAX_EPI);
t=0:0.025:2*pi;
switch choice
    case 1
        a = 9;
        b = 3;
        h = 3;
    case 2
        a = 8;
        b = 2;
        h = 5;
    case 3
        a = 10;
        b = 2;
        h = 5;
    case 4
        a = 6;
        b = 2;
        h = 3;
end
%calculate epitrochoid points
[xc,yc] = pol2cart(t,a);
x = (a+b)*cos(t)-h*cos(t*(a+b)/b);
y = (a+b)*sin(t)-h*sin(t*(a+b)/b);
% draw epitrochoid
line([x;xc],[y;yc],'linewidth',2,'color',[0.3 0.4 0.7]);
line(x,y,'marker','.','markersize',10,'color',1-[0.3 0.4 0.7]...
    ,'linestyle','none');
line(xc,yc,'marker','.','markersize',5,'color',[1-0.3 1-0.4 0.7]...
    ,'linestyle','none');
%annotation
str1(1) = {'$ x=(a+b)cos(\theta)-hcos(\theta\frac{a+b}{b})$'};
str1(2) = {'$ y=(a+b)sin(\theta)-hsin(\theta\frac{a+b}{b})$'};
str1(3) = {['$ 0 \leq \theta \leq 2\pi $']};
str1(4) = {['$ a=' num2str(a) ',b=' num2str(b) ',h=' num2str(h) '$']};
title(str1,'Interpreter','latex','FontSize',20);

axis off equal
set(gcf,'color',[1 1 1]);
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