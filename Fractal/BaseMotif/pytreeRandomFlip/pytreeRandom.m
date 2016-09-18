% Pythagoras tree with random angle and flip at each level
level = 7;
flip = true;
pyTreeSquare = pythRandom(level,flip);
nRow = size(pyTreeSquare,1);
colmap = hsv(nRow);
for n = 1:nRow
    sqPoint = pyTreeSquare(n).points;
    squareX = [sqPoint(1).x sqPoint(2).x sqPoint(3).x sqPoint(4).x];
    squareY = [sqPoint(1).y sqPoint(2).y sqPoint(3).y sqPoint(4).y];
    patch(squareX,squareY,'r','facecolor',colmap(n,:),'edgecolor','none');
end
set(gcf,'color',[1 1 1])
axis equal off