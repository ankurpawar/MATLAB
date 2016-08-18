function isosurfExample
% Isosurface example
s=0.025;
[x,y,z]=meshgrid(-2:s:2,-2:s:2,-2:s:2);
t = 0.5*(1 + sqrt(5));
u= 4*(t^2* x.^2 - y.^2).*(t^2.* y.^2 - z.^2).*(t^2 .* z.^2 - x.^2)...
    - (1+2*t)*(x.^2 + y.^2 + z.^2 - 1).^2;

fv=isosurface(u,0);
patch(fv,'FaceColor','b','EdgeColor','none');
axis equal off
camlight headlight
material dull
set(gcf,'color',[1 1 1]);
view(-67,40)
end