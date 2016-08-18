function loxodrome
%% Loxodrome
% Script to generate loxodrome
%
% $$u = [-3\pi\ 3\pi]$$ 
%
% $$v = [0\ 3\pi]$$ 
%
% $$a = 1$$
%
% $$b = \sqrt{1+(au)^2}$$
%
% $$x = {sin(u+v)}/b$$
%
% $$y = {cos(u+v)}/b$$
%
% $$z = {-au}/b$$
%

% Define the range
num_points = 150;
u = linspace (-3*pi,3*pi, num_points);
v = linspace (0, pi/3, num_points);
[U, V] = meshgrid (u, v);

% Calculate x,y,z coordinates
a = 1;
b = sqrt(1 + (a.*U).^2);
x = sin(U + V)./b;
y = cos(U + V)./b;
z = -a.*U./b;

[f,v]=surf2patch(x, y, z);
cmap=jet(4);

%% Draw loxodrome
% In each iteration,vertices are rotated by pi/2 and drawn.
% Doing this will give 4 surfaces.
for k=1:4
    [xd,yd]=transform2d(v(:,1),v(:,2),0,0,pi/2,0,0);
    v(:,1)=xd;
    v(:,2)=yd;
    h=patch('vertices',v,'faces',f,...
        'facecolor',cmap(k,:),'FaceLighting','phong',...
        'edgecolor','none','facevertexcdata',[0.8 0.7 0.1],...
        'BackFaceLighting','reverselit');

end

%% View and material setting
material([0.1 0.6 0.5 20 0])
camlight
lighting phong
light('Position',[0.5 -10 0.2])
light('Position',[-10 2 0.2])
set(gcf,'color',[1 1 1]);
set(gcf,'Renderer','zbuffer');
axis equal on tight
view(3)

% export_fig function is available then save figure as png file. Create a
% button with callback that will save the figure as antialiased image.
if exist('export_fig') > 0
    export_fig('png','-nocrop','-a2','loxodrome');
end
end