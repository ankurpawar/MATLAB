function daisyspiral
% daisy spiral
% get user input from command window
choice = getUserInput('Enter a choice from 1 to 9:', 1, 9);

switch(choice)
    case 1
        t = 0:sqrt(2)/pi:5*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s=scatter(x(:)',y(:)',50+25*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap hsv
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\sqrt{2}: 5\pi$'};
    case 2
        t = 0:sqrt(pi)/pi^2:5*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',50+10*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap( fliplr(hsv) );
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{\sqrt{\pi}}{\pi^2}: 5\pi$'};
    case 3
        t = 0:sqrt(5*pi)/pi:10*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',50+10*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap winter
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{\sqrt{5\pi}}{\pi}: 10\pi$'};
    case 4
        t = 0:1/sqrt(pi):5*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',50+30*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(copper));
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{\sqrt{\pi}}: 5\pi$'};
    case 5
        t = 0:1/sqrt(pi*pi*pi):5*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',40+10*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(autumn));
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{\pi \sqrt{\pi}}: 5\pi$'};
    case 6
        t = 0:1/sqrt(2*pi*pi):5*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',50+4*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(spring));
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{\pi \sqrt{2}}: 5\pi$'};
    case 7
        t = 0:exp(1)/sqrt(2*pi):15*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',50+5*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(summer));
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{e}{\sqrt{2 \pi}}: 15\pi$'};
    case 8
        golden = 1.618033988749894848204586;
        t = 0:1./exp(1)*golden:10*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',50+10*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(hsv));
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{e}{\sqrt{2 \pi}}: 15\pi$'};
    case 9
        t = 0:(1.414):5*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',1+1*((x(:)').^2+(y(:)').^2),...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(summer));
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{e}{\sqrt{2 \pi}}: 15\pi$'};
end

axis equal off
text('Interpreter','latex',...
    'String',str1,...
    'Position',[max(max(x))-0.1 max(max(y))],...
    'FontSize',20)
end

function [x,y,x2,y2] = getxy(r,t)
lent = length(t);
x = zeros(lent,8);
y = zeros(lent,8);
x2 = zeros(lent,8);
y2 = zeros(lent,8);
pd = -0.75:0.25:1;
for n=1:8
    x(:,n) = r.*cos(t+pd(n)*pi);
    y(:,n) = r.*sin(t+pd(n)*pi);
    x2(:,n) = -r.*cos(t+pd(n)*pi);
    y2(:,n) = r.*sin(t+pd(n)*pi);
end
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