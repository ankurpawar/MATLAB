A = [ -8/3 0 0; 0 -10 10; 0 28 -1 ];
y = [35 -10 -7]';
h = 0.01;
p = plot3(y(1),y(2),y(3),'.', ...
    'EraseMode','none','MarkerSize',5); % Set EraseMode to none
axis([0 50 -25 25 -25 25])
hold on
total=100000;
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

scfile=fopen('lorenz.sc','w');
particles2ScFile(points, 'particleShader', 'lorenzParticles', scfile);
fclose(scfile);
axis equal
zoom(3)


callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')'; 
sld2Hndl=uicontrol( ...
        'Style','pushbutton', ...
        'Position',[10 10 40 20], ...
        'Callback',callbackStr);
