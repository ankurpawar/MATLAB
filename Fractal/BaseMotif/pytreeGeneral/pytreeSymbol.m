% Pythagoras tree with symbols
level = 6; % draw upto 6 level
alpha = pi/4;
beta = pi/2-alpha;
flip = false;

dat = textread('symbols.txt','%s'); %file with list of symbols
pyTreeSym = pythGeneral(level,alpha,beta,flip);
nRow = size(pyTreeSym,1);
colmap = hsv(nRow);
for n = 1:nRow
    sqPoint = pyTreeSym(n).points;
    squareX = [sqPoint(1).x sqPoint(2).x sqPoint(3).x sqPoint(4).x];
    squareY = [sqPoint(1).y sqPoint(2).y sqPoint(3).y sqPoint(4).y];
    patch(squareX,squareY,'r','facecolor','none','edgecolor',colmap(n,:));
    xpos = max(squareX)-(max(squareX)-min(squareX))/2;
    ypos = max(squareY)-(max(squareY)-min(squareY))/2;
    text('interpreter','latex'...
        ,'string',['${' dat{n} '}$']...
        ,'verticalalignment','middle'...
        ,'horizontalalignment','center'...
        ,'FontName','FixedWidth'...
        ,'fontsize',10,'color',1-colmap(n,:)...
        ,'position',[xpos ypos]);
end
set(gcf,'color',[1 1 1])
axis off equal