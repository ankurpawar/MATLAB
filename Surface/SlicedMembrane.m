% Sliced Membrane surfacetest

membraneZ = membrane(1,17);
[membNrow,membNcol] = size(membraneZ);
[X,Y]=meshgrid(1:membNrow,1:membNrow);

maxZ = max(membraneZ(:));
minZ = min(membraneZ(:));

nLevel = 11;

[color_cont, handle_contour] = contourf(X,Y,membraneZ,nLevel);

h_group = findobj('type','patch');
nHandle = length(h_group);
cmap = flipud(jet(nHandle));

z = 10*linspace(maxZ,minZ,nLevel);
vertCell=cell(nHandle,1);
faceCell=cell(nHandle,1);
for n=1:nLevel
    v = get(h_group(n),'vertices');
    v = [v z(n)*ones(size(v,1),1)];
    f = get(h_group(n),'faces');
    vertCell{n,1} = v;
    faceCell{n,1} = f;
end

figure
for n = 1:nLevel
    v = vertCell{n,1};
    f = faceCell{n,1};
    patch('faces',f,'vertices',v,'facecolor',cmap(n,:));
end
axis equal
view(3)