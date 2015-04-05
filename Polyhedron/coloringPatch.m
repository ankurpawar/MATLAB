%coloringPatch
vert=[1 0 0
     -1 0 0
      0 1 0
      0 -1 0
      0 0 1
      0 0 -1];
face=[3 5 2
       5 3 1
       6 3 2
       3 6 1
       4 5 1
       5 4 2
       4 6 2
       6 4 1];

colors=hsv(length(vert));
h=patch('faces',face,'vertices',vert,'facecolor',[0 0 1]); %draw patch

axis equal
view(3)      

%flat coloring , one color per face
%set(h,'facecolor','flat','facevertexcdata',colors);

%flat coloring , one color per vertex
%set(h,'facecolor','flat','facevertexcdata',colors);

%interpolated coloring
%set(h,'facecolor','interp','facevertexcdata',colors);

%indexed color
set(h,'facecolor','flat','Cdata',1:8);
colormap(copper(8))

%alpha(0.5)
set(gcf,'color',[1 1 1]);

callbackStr=['export_fig(''png'',''nocrop'',''a2'',''octa' num2str(45) ''')'];
sld2Hndl=uicontrol( ...
          'Style','pushbutton', ...
          'Position',[10 10 40 20], ...
          'Callback',callbackStr);