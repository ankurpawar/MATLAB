%% Colorful leaves
% Find the intersection of two circle placed at some distance
% Then rotate it and apply different colors.
t = 0:pi/20:2*pi;
x = sin(t);
y = cos(t);
[x, y] = polybool('intersection', x, y+1, x+1, y);

total = 30; %number of leaf
cont = 1/total;
colmap = hsv(total);
[theta,r] = cart2pol(x,y);

%% Draw the leaves
%
for t = 1:total
    [x,y] = pol2cart(theta+t*2*cont*pi,r);  
    h = patch(x,y,'r','edgecolor','none','facecolor',colmap(t,:),'facealpha',0.3,'linewidth',2);
end
axis off equal 
set(gcf,'color',[1 1 1]); %set background color to white

%% Export to PNG file
% If export_fig function is available the click this button.
% An antialased PNG image will be saved in current working
% directory with name colorLeaves
callbackStr='export_fig(''png'',''colorLeaves'')'; 
sld2Hndl=uicontrol( ...
          'Style','pushbutton', ...
          'Position',[10 10 40 20], ...
          'Callback',callbackStr);
