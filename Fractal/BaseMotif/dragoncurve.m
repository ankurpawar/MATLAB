function dragoncurve
% Dragon curve
dvec = ['1'];
temp = [];
nColDvec = 1;
nIteration = 12;  %More iteration, more time and memory required.
% loop to make sequence
%       110
%     1101100
% 110110011100100
for n = 1:nIteration
    nColDvec = length(dvec);
    temp = dvec;
    temp(2^(n-1)) = '0';
    dvec = [dvec '1' temp];
end

x = 0;
y = 0;
nColDvec = length(dvec);
theta = pi/2;
x1 = 0;
y1 = 0;
x2 = 0;
y2 = 0;
x_arr = zeros(nColDvec*2,1);
y_arr = x_arr;
% length on main section and smaller section
lenM = 0.75;
lenS = sqrt(2)*0.25;

% Draw a point a add it to previous point and store it in an array. In each
% iteration change the angle based on the n'th value in the sequence.
for k = 1 : nColDvec
    [x1,y1] = pol2cart(theta, lenM);
    x = x+x1;
    y = y+y1;
    x_arr(2*k-1)=x;
    y_arr(2*k-1)=y;
    
    if dvec(k) == '1'
        theta = theta+pi/4;
        [x2,y2] = pol2cart(theta, lenS);
        x = x+x2;
        y = y+y2;
        x_arr(2*k) = x;
        y_arr(2*k) = y;
        theta = theta+pi/4;
    else
        theta = theta-pi/4;
        [x2,y2] = pol2cart(theta, lenS);
        x = x+x2;
        y = y+y2;
        x_arr(2*k) = x;
        y_arr(2*k) = y;
        theta = theta-pi/4;
    end
    
end

% black color
figure
line(x_arr,y_arr,'color','k');
axis equal off
set(gcf,'color',[1 1 1]);

% hsv color
figure
cmap = hsv(256);
colormap(cmap);
x_arr = [x_arr;nan];
y_arr = [y_arr;nan];
patch(x_arr,y_arr,sqrt(x_arr.^2+y_arr.^2)...
    ,'edgecolor', 'flat', 'facecolor', 'none');
set(gcf,'color',[1 1 1]);
axis off equal
end