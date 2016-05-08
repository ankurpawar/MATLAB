function animBall
% Simple animation of ball. The animation is not accurate.

% number of points in sphere, 3 matrices of (N+1)x(N+1)
nPointBall = 30;
[ballX, ballY, ballZ] = sphere(nPointBall);
ballRadius = 2.5;
h1=surf(ballRadius * ballX...
    , ballRadius*ballY...
    , ballRadius + ballRadius*ballZ... % keep ball above zero
    , 'Facecolor',[0 0 0]...
    , 'edgecolor','none');

camlight headlight,lighting phong
hold on

% Mesh for water like surface, dimension of surface is
% MAX_POINTS x MAX_POINTS
MAX_X = 20;
MIN_X = -20;
MAX_POINTS = 100;
x = linspace(MIN_X, MAX_X, MAX_POINTS);
[X,Y] = meshgrid(x, x);

Z = ones(size(X));
hLiquid = surf(X,Y,Z,'Facecolor','blue','edgecolor','none');
camlight headlight
lighting phong
axis([-20 20 -20 20 -20 20])
view(3)

hold off
axis off
set(gcf,'color',[1 1 1])
view(113,45)
grid off

% Function handle for creating ripples on 2d surface.
% sinc(sqrt(x^2+y^2)-pi*t), sqrt(x^2+y^2) creates 2 ripples in sinc
% function. Changing x will change position of ripples. Changing t will
% move ripple outwards.
ringFunc = @(tx,x,ty,y)(sqrt((tx+x).^2+(ty+y).^2));
rippleFunc = @(r,t)(0.4*sinc(r-0.4*t*pi));

n = 0;
while (n <= 90) && ishandle(hLiquid)
    % Set X and Z postition of ball
    % abs(exp(-t)*sin(pi*t)), this is similar to falling ball
    set(h1, 'xdata', n/5+ballRadius*ballX...
        ,'zdata',ballRadius+ballRadius*ballZ...
        +abs(9*exp(-0.03*n)*sin(0.9*pi*n)));
    
    % Calculate new ripples after some phase shift
    Z = rippleFunc(ringFunc(0,X,0,Y),n);
    for m = 2:2:12
        Z = Z + rippleFunc(ringFunc(-m,X,0,Y),n-m*5);
    end
    set(hLiquid,'zdata',Z);
    pause(0.075);
    n = n+1;
end
end