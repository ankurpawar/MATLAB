function mengerSponge

vert=[1 1 1
    1 1 -1
    1 -1 1
    1 -1 -1
    -1 1 1
    -1 1 -1
    -1 -1 1
    -1 -1 -1];

face=[1 2 4 3
    1 5 6 2
    5 6 8 7
    7 8 4 3
    1 3 7 5
    2 4 8 6];

%offset points
offPoints=[1 1 1;1 1 -1;1 -1 1;1 -1 -1
    -1 1 1;-1 1 -1;-1 -1 1;-1 -1 -1
    0 1 1;0 1 -1;0 -1 1;0 -1 -1
    1 0 1;1 0 -1;-1 0 1;-1 0 -1
    1 1 0;1 -1 0;-1 1 0;-1 -1 0];

sca=1/3;%scale factor
level=2;%level of recursion
drawFractal(vert,face,offPoints,sca,level)
axis equal on
shading faceted
%lighting phong
set(gcf,'color',[1 1 1])
callbackStr='export_fig(''png'',''menger'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);
view(3)

function drawFractal(vert,face,offPoints,sca,n)

if n>0
    off2=sca*offPoints*2;
    v = sca*vert;
    vnew=v;
    for k=1:length(offPoints)
        vnew(:,1)=v(:,1)+off2(k,1);
        vnew(:,2)=v(:,2)+off2(k,2);
        vnew(:,3)=v(:,3)+off2(k,3);
        if n==1
            h=patch('vertices',vnew,'faces',face,'facecolor','flat','edgecolor','flat');
            set(h,'facevertexcdata',1-copper(length(vert)));
        end
        drawFractal(vnew,face,offPoints,sca,n-1);
    end
    
end
return