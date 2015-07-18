%lineimage
img2=imread('circles.png');
%[img2,cmap]=rgb2ind(img2,256);
[row,col]=size(img2);
H = fspecial('disk',10);
img2 = imfilter(img2,H,'replicate');
gap=3;
[xx,yy]=meshgrid([1:gap:col],[row:-gap:1]);

zz=double(img2(1:gap:row,1:gap:col));
zz=230*zz/max(max(zz));
[rowxx,colxx]=size(xx);
x=xx';
y=yy';
z=zz';
[rowz,colz]=size(z);

cmap=(cool(colz));

h=mesh(xx,yy,zz);%set(h,'edgecolor','k');
%[face,vertices,c]=surf2patch(x,y,z,z);
[v,new_faces]=surf2tripatch(xx,yy,zz);

[textureU,textureV]=meshgrid(linspace(0,1,colxx),linspace(1,0,rowxx));
UV=[reshape(textureU,rowxx*colxx,1) reshape(textureV,rowxx*colxx,1)];

colormap(gray)

scfile=fopen('circularMountain.sc','w');
shader2ScFile('diffuse','mountainShader',[0.5 0.5 0.5],scfile);
%mesh2ScFile(v,new_faces-1,'mountainShader','mountain',scfile);
%mesh2textureScFile(v,new_faces-1,UV(:,1),UV(:,2),'mountainShader','mountain',scfile);

fclose(scfile);

textureUV=fopen('mountainUV.txt','w');
for n=1:length(v)
    fprintf(textureUV,'  %g  %g \n',UV(n,:));
end
fclose(textureUV);

axis equal on
view(3)

sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,800,true});

%z=zeros(row,col);
%surf(double(img2))
%axis equal
