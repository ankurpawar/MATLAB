%typography
%read svg coordinates

fid=fopen('courier.txt','r');
count=1;
count2=1;

L=[0 0];
M=[0 0];

x=zeros(1,3);
y=zeros(1,3);

height=750;

cmap=hsv(256);

xcord=[];ycord=[];

while ~feof(fid)
    dat=fscanf(fid,'%c',1);
    switch dat
        case 'M'
            m1   =fscanf(fid,'%g',1);
            rough=fscanf(fid,'%c',1);
            m2   =fscanf(fid,'%g',1);
            
            M=[m1 m2];
            count2=count2+1;
            
            xcord=[xcord;m1];
            ycord=[ycord;height-m2];
        case 'C'
            for k=1:3
                x(k) =fscanf(fid,'%g',1);
                rough=fscanf(fid,'%c',1);
                y(k) =fscanf(fid,'%g',1);
            end
            [a,b]=bezier([M(1) x],height-[M(2) y],20);
            count2=count2+1;
            %line(a,b,'color','k');
            M=[x(3) y(3)];
            count2=count2+1;
            
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
            count2=count2+1;
        otherwise
            %do nothing
    end
    count=count+1;
    
end

[vertices,faces]=polyStrip(xcord,ycord,10);
%patch2OBJ(vertices,faces,'typo2');
patch('faces',faces,'vertices',vertices,'facecolor','none');
axis equal,view(3)

eofstat = feof(fid);
fclose(fid);