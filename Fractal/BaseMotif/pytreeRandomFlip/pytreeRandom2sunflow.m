% Pythagoras tree with random angle and flip at each level
level = 7;
flip = true;
pyTreeSquare = pythRandom(level,flip);
scfile = fopen('rpytree.sc','w');

nRow = size(pyTreeSquare,1);
colmap = hsv(nRow);
for n = 1:nRow
    sqPoint = pyTreeSquare(n).points;
    squareX = [sqPoint(1).x sqPoint(2).x sqPoint(3).x sqPoint(4).x];
    squareY = [sqPoint(1).y sqPoint(2).y sqPoint(3).y sqPoint(4).y];
    patch(squareX,squareY,'r','facecolor',colmap(n,:),'edgecolor','none');
    rot = pi+atan2(squareY(1)-squareY(2),squareX(1)-squareX(2));
    sca = sqrt((squareY(1)-squareY(2))^2+(squareX(1)-squareX(2))^2);
    writeInstance(scfile,[0 0 rot],[squareX(1) squareY(1) 0]...
        ,[sca sca sca],n,colmap(n,:));
end
set(gcf,'color',[1 1 1])
axis equal off
fclose(scfile);