function dragoncurve2
% dragon curve
dvec = ['1'];
temp = [];
nColDvec = 1;
nIteration = 10;  % More iteration, more time and memory required.
%loop to make sequence
%       1
%      110
%    1101100
%110110011100100
for n = 1:nIteration
    nColDvec = length(dvec);
    temp = dvec;
    temp(2^(n-1)) = '0';
    dvec = [dvec '1' temp];
end

nColDvec = length(dvec);
% curve will start vertically
theta = pi/2;
% length of a smallest section
len = 1;

xn = 0;
yn = 0;
x = 0;
y = 0;
% Array keeps x and y coordinates of curve.
x_arr = zeros(nColDvec, 1);
y_arr = x_arr;

% Draw a point a add it to previous point and store it in an array. In each
% iteration change the angle based on the n'th value in the sequence. 
for n = 1 : nColDvec
    [x,y] = pol2cart(theta, len);
    xn = xn+x;
    yn = yn+y;
    x_arr(n,1) = xn;
    y_arr(n,1) = yn;
    if dvec(n) == '1'
        theta = theta+pi/2;
    else
        theta = theta-pi/2;
    end
end

figure 
% black color
line(x_arr,y_arr,'color','k');
axis equal off
set(gcf,'color',[1 1 1]);

figure
% many color. Each section is colored separately.
cmap = jet(256);
x_arr = [x_arr;nan];
y_arr = [y_arr;nan];
patch(x_arr,y_arr,sqrt(x_arr.^2+y_arr.^2)...
    ,'edgecolor', 'flat', 'facecolor', 'none');
set(gcf,'color',[1 1 1]);
axis off equal
end