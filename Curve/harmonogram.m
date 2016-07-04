function harmonogram
% harmonogram

% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(2) ...
    '\n'] , 1, 2);
t=0:0.01:20*pi;
switch(choice)
    case 1
        f1=3.001; f2=2; f3=3; f4=2;
        d1=0.004; d2=0.0065; d3=0.008; d4=0.019;
        p1=0; p2=0 ;p3=pi/2; p4=3*pi/2;
    case 2
        f1=2; f2=6; f3=1.002; f4=3 ;
        d1=0.02; d2=0.0315; d3=0.02; d4=0.02 ;
        p1=pi/16; p2=3*pi/2; p3=13*pi/16; p4=pi;
end
x=exp(-d1*t).*sin(t.*f1+p1) + exp(-d2*t).*sin(t*f2+p2);
y=exp(-d3*t).*sin(t.*f3+p3) + exp(-d4*t).*sin(t*f4+p4);

line(x,y);
axis equal off
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