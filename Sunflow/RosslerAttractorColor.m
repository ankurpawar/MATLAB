%Rossler attractor
%code generates coordinates of roosler attractor and store them in 10 
%files. Creates a sunflow file with shader. 
total=10000;
x=zeros(1,total);
y=zeros(1,total);
z=zeros(1,total);
x(1)=0.10001;
y(1)=-0.10001;
z(1)=0.10001;
dt=0.02;
a=0.2;
b=0.2;
c=8.0;
points=zeros(total,3);
cmap=1-copper(10);

for n=2:total
    x(n)=x(n-1)+ dt*(-y(n-1)-z(n-1));
    y(n)=y(n-1)+ dt*(x(n-1)+a*y(n-1));
    z(n)=z(n-1)+ dt*(b+z(n-1)*(x(n-1)-c));
end
z=20*z/max(z);
points(:,1)=x'; points(:,2)=y'; points(:,3)=z';

line(points(:,1),points(:,2),points(:,3),'marker','o');
'done step 1'
scfile=fopen('rosslerColored.sc','w');

for n=1:10
    indexFrom=(n-1)*1000+1;
    indexTo=(n-1)*1000+1000;
    shader2ScFile('diffuse',['particleShader' num2str(n)],cmap(n,:),scfile);
    particles2ScFile(points(indexFrom:indexTo,:),['particleShader' num2str(n)],['particles' num2str(n)],scfile);
end

fclose(scfile);
axis equal


callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);
