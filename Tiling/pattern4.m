function pattern4

len=10;


x=1.5*rand(100,2); 
[v,c]=voronoin(x); 
cmap=summer(30);
for i = 1:length(c) 
if all(c{i}~=1)   % If at least one of the indices is 1, 
                  % then it is an open region and we can't 
                  % patch that.
patch(v(c{i},1),v(c{i},2),cmap(randindex(30),:),'edgecolor','none'); % use color i.
%patch(v(c{i},1),v(c{i},2),length(v(c{i},2)):-1:1,'edgecolor','none','facecolor','interp','facealpha',0.5);
%[xx,yy]=bezier2(v(c{i},1)',v(c{i},2)',30);
%patch(xx,yy,cmap(randindex(30),:));
end
end
axis equal off
axis([0 1 0 1])

%whos
function ind=randindex(len)
    ind = ceil(len*rand);
%randindex end here    