%Lorenz attractor to sunflow
A = [ -8/3 0 0; 0 -10 10; 0 28 -1 ];
y = [35 -10 -7]';
h = 0.01;
p = plot3(y(1),y(2),y(3),'.', ...
    'EraseMode','none','MarkerSize',5); % Set EraseMode to none
axis([0 50 -25 25 -25 25])
hold on
total=10000;
cmap=makeColorMap([1 1 1],[1 0.5 0],20);
points=zeros(total,3);
for i=1:total
    
    A(1,3) = y(2);
    A(3,1) = -y(2);
    ydot = A*y;
    y = y + h*ydot;
    % Change coordinates
    %set(p,'XData',y(1),'YData',y(2),'ZData',y(3))
    points(i,[1 2 3])=[y(1) y(2) y(3)];
end

line(points(:,1),points(:,2),points(:,3),'marker','o');
rot = zeros(total,3);
translate=zeros(total,3);
sca=0.1*ones(total,3);

for n=2:total
    
    xOld=points(n-1,1);
    yOld=points(n-1,2);
    zOld=points(n-1,3);
    
    xCur=points(n,1);
    yCur=points(n,2);
    zCur=points(n,3);
    dist=sqrt((xOld-xCur)^2+(yOld-yCur)^2+(zOld-zCur)^2);
    
    translate(n,1)=xCur;
    translate(n,2)=yCur;
    translate(n,3)=zCur;
    
    [tOld,pOld,rOld]=cart2sph(xOld,yOld,zOld);
    [tCur,pCur,rCur]=cart2sph(xCur,yCur,zCur);
    
    rot(n,2)=tCur;
    rot(n,3)=pCur;
    
    %dist=abs(rOld-rCur);
    sca(n,3)=dist+0.000001;
    
end
'done step 1'
scfile=fopen('lorenzColored2.sc','w');

for n=1:total
    indexFrom=(n-1)*1000+1;
    indexTo=(n-1)*1000+1000;
    %shader2ScFile('diffuse',['Shader' num2str(n)],cmap(n,:),scfile);
    writeInstance(scfile,rot(n,:),translate(n,:),sca(n,:),n,[0.85 0.85 0.85]);
end

fclose(scfile);
axis equal
zoom(3)

callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);