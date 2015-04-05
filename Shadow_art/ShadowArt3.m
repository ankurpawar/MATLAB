frontImg=imread('aaa2.png','png');
sideImg=imread('bbb2.png','png');
topImg=imread('ccc2.png','png');

[height,width]=size(frontImg);
frame=height;

z=zeros(height,width,frame);


    
for m=1:height
     z(:,:,m)=topImg; 
    for n=1:width
        %z(m,n,k)=topImg(m,n);
        
        for k=1:height  
            a=frontImg(m,k);
            if(topImg(m,k)>0) 
               z(n,k,m)=a;
            end
        end
        
        
        for k=1:width
            a=sideImg(n,k);
            if(topImg(k,n)>0) 
               z(k,n,m)=a;
            end
        end
          
    end

end



for n=1:height
    img=z(:,:,n);
    
    %image(img),colormap(gray(256));
    imshow(img,[0 255]);
    drawnow
    %image(img),colormap(map);
end

Ds = smooth3(z);
hiso = patch(isosurface(z),'FaceColor',[1,.75,.65],'EdgeColor','none');
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
