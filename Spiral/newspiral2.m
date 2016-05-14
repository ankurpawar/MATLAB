function newspiral2
%newspiral2
% get user input from command window
choice = getUserInput('Enter a choice from 1 to 16:', 1, 16);

switch(choice)
    case 1
        t = 0:1/4:15*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(summer))
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{4}: 15\pi$'};
    case 2
        t = 0:1/6:20*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(hot))
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{6}: 20\pi$'};
    case 3
        t = 0:1/pi:20*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(autumn))
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{pi}: 20\pi$'};
    case 4
        t = 0:exp(1)/pi:40*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(copper)
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{e}{\pi}: 40\pi$'};
    case 5
        t = 0:0.01:2*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        plot(x,y,x2,y2,'linewidth',3);
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
    case 6
        t = 0:pi/exp(pi):10*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,((x(:)').^2+(y(:)').^2),'filled');
        colormap(fliplr(winter))
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{pi}{e^{\pi}}: 10\pi$'};
    case 7
        t = 0:10*exp(-pi):30*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap((hot))
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:10e^{-\pi}: 30\pi$'};
    case 8
        t = 0:exp(1)/exp(pi):10*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(spring)
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{e}{e^\pi}: 10\pi$'};
    case 9
        t = 1:1/(sqrt(pi)*pi):10*pi;r =log(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(cool)
        str1(1) = {['$r(\theta)=log{\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{\pi \sqrt{\pi}}: 10\pi$'};
    case 10
        t = 1:pi/exp(pi):10*pi;
        r = log(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(autumn)
        str1(1) = {['$r(\theta)=log{\theta} $']};
        str1(2) = {'$\theta = 0:\frac{\pi}{e^\pi}: 10\pi$'};
    case 11
        t = 1:1/(sqrt(2*pi)):50*pi;
        r = log(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap hsv
        str1(1) = {['$r(\theta)=log{\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{\sqrt{2\pi}}: 50\pi$'};
    case 12
        t = 1:1/(4*exp(1)):5*pi;
        r = log(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s=scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap((fliplr(copper)))
        str1(1) = {['$r(\theta)=log{\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{4e}: 5\pi $'};
    case 13
        t = 0:1/sqrt(2):40*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        colormap(summer)
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{\sqrt{2}}: 40\pi$'};
    case 14
        t = 0:1/sqrt(5)/pi:10*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        
        colormap(fliplr(jet))
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{\pi\sqrt{5}}: 10\pi$'};
    case 15
        t = 0:pi/20:5*pi;
        r = sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        
        colormap(flipud(winter))
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{1}{20\pi}:5\pi$'};
    case 16
        t = 1:2/pi:5*pi;
        r = 1./sqrt(t);
        [x,y,x2,y2] = getxy(r,t);
        h_s = scatter(x(:)',y(:)',25,...
            ((x(:)').^2+(y(:)').^2),'filled');
        
        colormap(cool)
        str1(1) = {['$r(\theta)=\sqrt {\theta} $']};
        str1(2) = {'$\theta = 0:\frac{2}{\pi}:5\pi$'};
end
axis equal off
text('Interpreter','latex',...
    'String',str1,...
    'Position',[max(max(x))-0.1 max(max(y))],...
    'FontSize',20)
end

function [x,y,x2,y2] = getxy(r,t)
%function to convert catesian to polar
lent = length(t);
x = zeros(lent,8);
y = zeros(lent,8);
x2 = zeros(lent,8);
y2 = zeros(lent,8);
pd = -0.75:0.25:1;
for n = 1:8
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