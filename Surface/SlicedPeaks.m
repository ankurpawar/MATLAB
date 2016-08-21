% Sliced Peaks
[x,y,z] = peaks(100);
x = 5*x;
y = 5*y;
zmin = min(z(:));
zmax = max(z(:));
nLevel = 20;
[color_cont, handle_contour] = contour3(x,y,z,nLevel);
axis equal
view(3)

nHandle = length(handle_contour);
cmap = jet(nHandle);

figure
for n = 1:nHandle
    vertices = get(handle_contour(n),'vertices');
    % Remove the nan from the last row
    vertices = vertices(1:end-1,:);
    [vertices(:,1), vertices(:,2)] = poly2cw(vertices(:,1),vertices(:,2));
    
    faces = get(handle_contour(n),'faces');
    faces = faces(1:end-1);
    [f,v] = poly2fv(vertices(:,1),vertices(:,2));
    v = [v vertices(1,3)*ones(size(v,1),1)];
    patch('faces',f,'vertices',v,'facecolor',cmap(n,:),'FaceAlpha',0.6...
        ,'edgecolor','none');
end

axis equal
view(3)
set(gcf,'renderer','zbuffer');