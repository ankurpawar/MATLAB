% Pythagoras tree
level = 8; % draw upto 8 level
alpha = pi/3; 
beta = pi/2-alpha;
flip = true;
pyTreeSquare = pythGeneral(level,alpha,beta,flip);
nRow = size(pyTreeSquare,1);
colmap = hsv(nRow);
for n = 1:nRow
    sqPoint = pyTreeSquare(n).points;
    squareX = [sqPoint(1).x sqPoint(2).x sqPoint(3).x sqPoint(4).x];
    squareY = [sqPoint(1).y sqPoint(2).y sqPoint(3).y sqPoint(4).y];
    patch(squareX,squareY,'r','facecolor','none','edgecolor',colmap(n,:));
end
set(gcf,'color',[1 1 1])
axis equal off