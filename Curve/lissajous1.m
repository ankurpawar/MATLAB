function lissajous1
% Damped 2D Lissajous figures:parametric equation
% x = c*t.*sin(a*t);
% y = c*t.*sin(b*t+phi);
% a = frequency 1, b = frequency 2, phi = phase difference,
% t = time, c = constant
MAX_LISSAJOUS_CURVE = 10;
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(MAX_LISSAJOUS_CURVE) ...
    '\n'] , 1, MAX_LISSAJOUS_CURVE);

switch choice
    case 1  
            t=0:0.05:432;
            c=1.1;
            a=1.33;%frequency 1
            b=1.35;%frequency 2
            phi=pi/4 ;%phase difference
    case 2  
            t=300:0.05:500;
            c=1.1;
            a=2.4;%frequency 1
            b=3;%frequency 2
            phi=pi/4 ;%phase difference
   case 3  
            t=1:0.05:432;
            c=1.1;
            a=1.38;%frequency 1
            b=2.8;%frequency 2
            phi=0 ;%phase difference
   case 4  
            t=200:0.05:500;
            c=1;
            a=1;%frequency 1
            b=2.5;%frequency 2
            phi=pi/4 ;%phase difference
   case 5  
            t=80:0.05:499.31;
            c=1;
            a=1;%frequency 1
            b=2.006;%frequency 2
            phi=pi/4 ;%phase difference          
   case 6  
            t=80:0.03:499.31;
            c=1;
            a=1.001;%frequency 1
            b=3.006;%frequency 2
            phi=pi/4 ;%phase difference
   case 7  
            t=0:0.05:302.31;
            c=1;
            a=1.015;%frequency 1
            b=2.015;%frequency 2
            phi=pi/10 ;%phase difference
   case 8  
            t=0:0.05:302.31;
            c=1;
            a=2.9991;%frequency 1
            b=2.015;%frequency 2
            phi=pi/3 ;%phase difference
   case 9  
            t=0:0.05:400.31;
            c=1;
            a=1.999;%frequency 1
            b=1.0001;%frequency 2
            phi=pi/8 ;%phase difference         
   case 10  
            t=0:0.05:390;
            c=1;
            a=1.0001;%frequency 1
            b=2.0001;%frequency 2
            phi=pi/100 ;%phase difference                  
end
x=t.*sin(a*t);
y=t.*sin(b*t+phi);
line(x,y)
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