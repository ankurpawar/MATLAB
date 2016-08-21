function voronoiPlane

x = -2+4*rand(40,1);
y = -2+4*rand(40,1);
x(1:4,1)=2*[-1 1 1 -1];
y(1:4,1)=2*[-1 -1 1 1];

X=[x y];
[v,c]=voronoin(X);

v=restrictPoints(v,-1);
v=restrictPoints(v,1);

for i = 1:length(c)
    % If at least one of the indices is 1,
    % then it is an open region and we can't
    % patch that.
    if all(c{i}~=1)
        patch(v(c{i},1),v(c{i},2),i); % use color i.
    end
end
axis equal
end

function newpoints=restrictPoints(points,bound)
newpoints=points;
if bound<0
    [row,col]=find(points<bound);
elseif bound>0
    [row,col]=find(points>bound);
end
for n=1:length(row)
    rowIdx=row(n);
    colIdx=col(n);
    newpoints(rowIdx,colIdx)=bound;
end
end