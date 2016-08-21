%typography2
%typography
%read svg coordinates

fid=fopen('engg.txt','r');
counter=1;
counter2=1;
counterM=0;
height=750;

xcord=[];ycord=[];
L=[0 0];
M=[0 0];
x=zeros(1,3);
y=zeros(1,3);

cmap=hsv(17);

scfile=fopen('typograph2.sc','w');

while ~feof(fid)
dat=fscanf(fid,'%c',1);
    switch dat
        case 'M'
           m1   =fscanf(fid,'%g',1);
           rough=fscanf(fid,'%c',1);
           m2   =fscanf(fid,'%g',1);
           
           M=[m1 m2];
                                          
           if ~isempty(xcord)
              [vertices,faces]=polyStrip(xcord,ycord,10);
              shader2ScFile('diffuse',['letter' num2str(counterM)],cmap(counterM+1,:),scfile);
              mesh2ScFile(vertices,faces-1,['letter' num2str(counterM)],['mesh' num2str(counterM)],scfile); 
              patch('faces',faces,'vertices',vertices,'facecolor','none'); 
           end
           clear xcord ycord
           xcord=[];
           ycord=[];
           xcord=[xcord;m1];
           ycord=[ycord;height-m2];
           
           counterM=counterM+1;
           counter2=counter2+1;
           
        case 'C'     
           for k=1:3
            x(k) =fscanf(fid,'%g',1);
            rough=fscanf(fid,'%c',1);
            y(k) =fscanf(fid,'%g',1);
           end
           [a,b]=bezier([M(1) x],height-[M(2) y],20);
           counter2=counter2+1;
           %line(a,b,'color','k');           
           M=[x(3) y(3)];
           counter2=counter2+1;
           
           xcord=[xcord;a'];
           ycord=[ycord;b'];
        case 'L'
           l1   =fscanf(fid,'%g',1);
           rough=fscanf(fid,'%c',1);
           l2   =fscanf(fid,'%g',1);
           L=[l1 l2];  
           %line([M(1) L(1)],height-[M(2) L(2)],'color',[0 0 0]);
           xcord=[xcord;l1];
           ycord=[ycord;height-l2];
           
           M=L;
           counter2=counter2+1;
        otherwise
            %do nothing
    end
    counter=counter+1;
    
end

[vertices,faces]=polyStrip(xcord,ycord,10);
shader2ScFile('diffuse',['letter' num2str(counterM)],cmap(counterM+1,:),scfile);
mesh2ScFile(vertices,faces-1,['letter' num2str(counterM)],['mesh' num2str(counterM)],scfile); 
patch('faces',faces,'vertices',vertices,'facecolor','none'); 

axis equal,view(3)

%eofstat = feof(fid);
fclose(scfile);
fclose(fid);

