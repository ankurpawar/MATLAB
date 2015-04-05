frontImg=imread('aaa.png','png');
sideImg=imread('ccc.png','png');
topImg=imread('bbb.png','png');

[height,width]=size(frontImg);
frame=height;

z=ones(height,width,frame);

for m=1:height
    z(:,:,m)=flipud(topImg)';
    for n=1:width
        
        if(frontImg(m,n)==1)
            z(:,n,m)=1;
        end
        
        if(sideImg(m,n)==1)
            z(n,:,m)=1;
        end
    end
end

for n=1:height
    img=z(:,:,n);
    
    image(im2bw(img)),colormap(gray(2));
    drawnow
    %image(img),colormap(map);
end

Ds = smooth3(z);
hiso = patch(isosurface(Ds),'FaceColor',[1,.75,.65],'EdgeColor','none');
clear z
vert=get(hiso,'vertices');
face=get(hiso,'faces');
clf
h=patch('vertices',vert,'faces',face,...
      'facecolor',[0.8 0.8 0.8],'FaceLighting','phong',...
      'edgecolor','none','facevertexcdata',[0.8 0.7 0.1]);
set(gcf,'Renderer','zbuffer');
material([0.1 0.6 0.5 20 0])
camlight(-32,-32); 
lighting phong
axis equal
%target[50 50 50]
%eye[-617 -400 -433]
set(gca,'CameraPosition',[-617 -400 -433]);
set(gca,'CameraTarget',[50 50 50]);
