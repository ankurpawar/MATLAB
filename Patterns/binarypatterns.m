function binarypatterns
% binary patterns
% from the book Java Complete Reference
HEIGHT = 512;
WIDTH = 512;
MAX_PATTERN = 9;
% get user input from command window
choice = getUserInput(['Enter a choice from 1 to ' num2str(MAX_PATTERN) ...
    '\n'] , 1, MAX_PATTERN);
img = zeros(HEIGHT,WIDTH,3);
switch choice
    case 1
        func1 = @(m,n)(bitand(bitxor(n,m),255));
        func2 = @(m,n)(bitand(bitxor(n,m),255));
        func3 = @(m,n)(bitand(bitxor(m,n),255));
    case 2
        func1 = @(m,n)(bitand(bitxor(n,m),255));
        func2 = @(m,n)(bitand(bitxor(m ,n),255));
        func3 = @(m,n)(bitand(bitxor(2*m,2*n),255));
    case 3
        func1 = @(m,n)(bitand(bitxor(2*n,2*m),255));
        func2 = @(m,n)(bitand(bitxor(m,n),255));
        func3 = @(m,n)(bitand(bitxor(4*m,4*n),255));
    case 4
        func1 = @(m,n)(bitand(bitxor(n,m),255));
        func2 = @(m,n)(bitand(bitxor(m,n),255));
        func3 = @(m,n)(bitand(bitxor(4*n,4*m),255));
    case 5
        func1 = @(m,n)(bitand(bitor(abs(m-n),abs(-n-m)),255));
        func2 = @(m,n)(bitand(bitor(2*abs(n-m),2*abs(m+n)),255));
        func3 = @(m,n)(bitand(bitor(4*abs(m+n),4*abs(n-m)),255));
    case 6
        func1 = @(m,n)(bitand(bitor(abs(m-n),abs(-n-m)),255));
        func2 = @(m,n)(bitand(bitor(abs(n-m),abs(m+n)),255));
        func3 = @(m,n)(bitand(bitxor(2*abs(m+n),2*abs(n-m)),255));
    case 7
        func1 = @(m,n)(bitand(bitor(m,abs(-m+n)),255));
        func2 = @(m,n)(bitand(bitor(m,abs(m+n)),255));
        func3 = @(m,n)(bitand(bitxor(n,abs(n-m)),255));
    case 8
        func1 = @(m,n)(bitand(bitor(m,n),255));
        func2 = @(m,n)(bitand(bitor(2*m,2*n),255));
        func3 = @(m,n)(bitand(bitor(4*m,4*n),255));
    case 9
        func1 = @(m,n)(bitand(bitxor(m,n),255));
        func2 = @(m,n)(bitand(bitxor(2*m,2*n),255));
        func3 = @(m,n)(bitand(bitxor(4*m,4*n),255));
end

for m = 1:HEIGHT
    for n = 1:WIDTH
        a = m-1;
        b = n-1;
        img(m,n,1) = func1(a,b);
        img(m,n,2) = func2(a,b);
        img(m,n,3) = func3(a,b);
    end
end
img8 = uint8(img);
image(img8);
axis image off
set(gcf,'color',[1 1 1]);
imwrite(img8,['texture' num2str(choice) '.png'],'png');
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