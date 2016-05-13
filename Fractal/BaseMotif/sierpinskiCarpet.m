function sierpinskiCarpet(S)
% Sierpinski Carpet. Function generates and save sierpinski carpet image.
% Input:
%   sierpinskiCarpet, binary image is drawn if no input argument are given.
%   sierpinskiCarpet(S), where S an integer, if S = 0 then binary(B/W)
%   image is drawn else colored image is drawn.
% Output:
%   Function has no output. Image drawn is saved in current directory.
if nargin == 0
    S = 0;
end
nIteration = 5;

if S == 0
    b0 = logical([1 1 1;1 0 1;1 1 1]);
    for n = 1 : nIteration
        x = logical(zeros(3^n));
        b0 = [b0 b0 b0;b0 x b0;b0 b0 b0];
    end
    imagesc(b0,[0 1]);colormap gray
    imwrite(b0,'sierpinskiBW.png','png','bitdepth',1);
else
    b0 = uint8([1 1 1;1 0 1;1 1 1]);
    for n = 1 : nIteration
        x = zeros(3^n,'uint8');
        a0 = [b0 b0 b0;b0 x b0;b0 b0 b0];
        b0 = 1+a0;
    end
    % Index in PNG image start at 0 but MATLAB index start at 1. Value in
    % matrix a0 range from 0 to 5, total 6 unique values. So nIteration+1
    % is passed in pink() to give 6 different colors required to display 
    % image.
    colors = pink(nIteration+1);
    colormap(colors);
    imagesc(a0);
    imwrite(a0,colors,'sierpinskiColor.png','png');
end
end