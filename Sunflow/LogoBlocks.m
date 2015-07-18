z=membrane(1,10);

zmin=min(min(z));
zmax=max(max(z));
zlevels=linspace(zmin,zmax,20+1);
[x1,y1]=meshgrid(zlevels);
gap=x1(1,2)-x1(1,1);
h=surf(x1,y1,z);
cdata=get(h,'cdata');

zunique=unique(z);
%get(h)
cmap=jet(length(zunique));
px=[0 0 1 1]*gap;
py=[0 1 1 0]*gap;
pz=[0 0 0 0];
figure
[row,col]=size(z);
scfile=fopen('logoblocks.sc','w');
instCount=0;
for n=1:row
    for m=1:col
        
        cindex=find(zunique==z(n,m));
        patch(px+x1(n,m),py+y1(n,m),z(n,m)+pz ,cmap(cindex,:));
        writeInstance(scfile,[0 0 0],[x1(n,m) y1(n,m) z(n,m)],[gap gap 1],instCount,cmap(cindex,:));
        abs(z(n,m));
        instCount=instCount+1;
    end
end
fclose(scfile);
axis equal


callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);
