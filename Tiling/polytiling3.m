function Polytiling3
% rhombus tiling
cmap=1-winter(4)/1.05;
%points of rhombus
x1=[0 -cos(pi/6) -2*cos(pi/6) -cos(pi/6)];
y1=[0 -sin(pi/6)  0  sin(pi/6)];
x2=[0 sin(pi/6) 2*sin(pi/6) sin(pi/6)];
y2=[0  cos(pi/6)  0 -cos(pi/6)];

%point of square
x3=[0 -cos(pi/6)  sin(pi/6)-cos(pi/6)  sin(pi/6)];
y3=[0 -sin(pi/6) -cos(pi/6)-sin(pi/6) -cos(pi/6)];

x4=[0 sin(pi/6) sin(pi/6)-cos(pi/6) -cos(pi/6)];
y4=[0 cos(pi/6) cos(pi/6)+sin(pi/6)  sin(pi/6)];
%gap between polygon
gapx1=2*(cos(pi/6)+sin(pi/6));

gapx2=(cos(pi/6)+sin(pi/6));
gapy2=(-cos(pi/6)-sin(pi/6));

total=5;
rough=-gapx2/2;
for ky=1:total+3
    rough=-rough;
    for kx=1:total
        patch(x1+2*kx*gapx2+rough,y1+ky*gapy2,cmap(1,:)...
            ,'edgecolor','none');
        patch(x2+2*kx*gapx2+rough,y2+ky*gapy2,cmap(2,:)...
            ,'edgecolor','none');
        patch(x3+2*kx*gapx2+rough,y3+ky*gapy2,cmap(3,:)...
            ,'edgecolor','none');
        patch(x4+2*kx*gapx2+rough,y4+ky*gapy2,cmap(4,:)...
            ,'edgecolor','none');
    end
end
axis off equal
end