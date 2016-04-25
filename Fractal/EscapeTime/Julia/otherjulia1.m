function otherjulia1
% Julia set fractal
% formula zn=(z^2+c)/(z^2-c), where c=0.7

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 1000; %number of points in x axis
HEIGHT = 1000; %number of points in y axis

% fractal x y range
Y_MIN = -2;
Y_MAX = 2;
X_MIN = -2;
X_MAX = 2;

MAX_ITERATION = 200;

% Generate linearly spaced points from X_MIN to X_MAX
x = linspace(X_MIN, X_MAX, WIDTH);
% Generate linearly spaced points from Y_MIN to Y_MAX
y = linspace(Y_MIN, Y_MAX, HEIGHT);

% Allocate space for output
zval = zeros(HEIGHT, WIDTH);
z = 0+0i;
c = 0.7;
h_wait = waitbar(0,'Please  wait...');

tic %start timer
for m = 1:WIDTH
    for n = 1:HEIGHT
         k = 1;
         z = x(m)+y(n)*i;
         while (k < MAX_ITERATION) && (abs(z) < 2)
            z = (z^2+c)/(z^2-c);
            k = k+1;
         end
         zval(n,m) = k;    
    end
    waitbar(m/WIDTH, h_wait);
end 
toc  %stop timer

close(h_wait);
min_z = min(zval(:));
max_z = max(zval(:));
cmap = hot(max_z);
colormap(cmap);
imagesc(zval);
imwrite(zval,cmap,'otherjulia1.png','png');
end