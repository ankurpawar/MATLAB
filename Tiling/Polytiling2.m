function Polytiling2
% rhombus tiling
x=[0 1 0 -1;0 -1 -1 0;0 0 1 1];
y=[0 -1/sqrt(3) -2/sqrt(3) -1/sqrt(3);...
    0 -1/sqrt(3)  1/sqrt(3)  1/cos(pi/6);...
    0  1/cos(pi/6)  1/sqrt(3) -1/sqrt(3)];
colmap2=1-winter(3)/1.8;
total=8;
gap=1/cos(pi/6)+1/sqrt(3);
rough=-1;
for ky=1:total
    rough=-rough;
    for kx=1:total
        patch(x(1,:)'+kx*2+rough/2,y(1,:)'+ky*gap,'r'...
            ,'facecolor',colmap2(1,:));
        patch(x(2,:)'+kx*2+rough/2,y(2,:)'+ky*gap,'r'...
            ,'facecolor',colmap2(2,:));
        patch(x(3,:)'+kx*2+rough/2,y(3,:)'+ky*gap,'r'...
            ,'facecolor',colmap2(3,:));
    end
end
axis off equal
end