function hafermanCarpet(S)
% Haferman Carpet. Function generates and save haferman carpet image.
% Input:
%   hafermanCarpet, binary image is drawn if no input argument are given.
%   hafermanCarpet(S), where S an integer, if S = 0 then binary(B/W) 
%   image is drawn else colored image is drawn.
% Output:
%   Function has no output. Image drawn is saved in current directory.
if nargin == 0
    S = 0;
end

nIteration = 5;
if S == 0
    x = 0;
else
    x = 1;
end

% generator matrix
a0 = [1 1 1;1 1 1;1 1 1];
b0 = [0 1 0;1 0 1;0 1 0];

for n = 1:nIteration
    an = x + [b0 b0 b0; b0 b0 b0; b0 b0 b0];
    b0 = [a0 b0 a0; b0 a0 b0; a0 b0 a0];
    a0 = an;
end

if S == 0
    colormap(gray(2));
    imagesc(b0);
    imwrite(b0,'hafermanCarpetBW.png','png','bitdepth',1);
else
    % min is 0 so number of colors required max + 1
    maxb0 = max(b0(:));
    colors = bone(maxb0 + 1);
    colormap(colors);
    imagesc(b0);
    imwrite(uint8(b0),colors,'hafermanCarpetColor.png','png');
end
end