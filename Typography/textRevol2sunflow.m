%% Text revolution
% This script generate surface of revolution from SVG path.
% Code will parse only absolute path in the file. 
function textRevol2sunflow
fid = fopen('hindi.txt','r');
scfile = fopen('typorevol.sc','w');

count = 1;
count2 = 1;
L = [0 0];
M = [0 0];
x = zeros(1,3);
y = zeros(1,3);
%Origin in SVG coordinate system lies at top left corner.
%On the other hand origin in MATLAB lies at bottom left.
%This makes the SVG y-axis inverted in MATLAB.So we can subtract
%a large value from SVG y-coorinate to make it suitable for MATLAB
height = 150;

%These blank arrays will be filled while parsing the file.x and y
%coordinates of curve and lines will be kept in these arrays.When
%an new path is encountered all the elements in these arrays are 
%removed.
xcord = [];
ycord = [];

%Counter to store total number of path in file.
counterM = 0;
rough = ' '; %character to store space between points
cmap = hsv(27);

%% Parse file
while ~feof(fid)
    dat=fscanf(fid,'%c',1);
    switch dat
        case 'M' %move to a new point
            % A new path is starting at this point.save the previously
            % stored point and start collecting new points.
            m1 = fscanf(fid,'%g',1);
            rough = fscanf(fid,'%c',1);
            m2 = fscanf(fid,'%g',1);
            M = [m1 m2];

            if ~isempty(xcord)
                %xcord=(xcord-min(xcord));
                %ycord=(ycord-min(ycord));

                %xcord=(xcord)/max(xcord);
                %ycord=(ycord)/max(ycord);

                n=20;
                t=linspace(0,-pi/2,n);
                theta=repmat(t,length(xcord),1);
                xpos=repmat(xcord,1,n);
                X=xpos;
                Z=zeros(size(xpos));
                ypos=repmat(ycord,1,n);
                [Z,Y] =transform2d(Z,ypos,0,0,theta,0,0);

                %X=(X-min(min(X)));
                %Y=(Y-min(min(Y)));
                %Z=(Z-min(min(Z)));

                %maxall=max([max(max(X)) max(max(Y)) max(max(Z))]);
                %X=X/maxall;
                %Y=Y/maxall;
                %Z=Z/maxall;
                %[faces,vertices,colmap]=surf2patch(X,Y,Z);

                [vertices,faces]=surf2tripatch(X,Y,Z);
                %shader2ScFile('diffuse',['letter' num2str(counterM)],cmap(counterM+1,:),scfile);
                %shader2ScFile('amb-occ',['letter' num2str(counterM)],cmap(counterM+1,:),[0.1 0.1 0.1],scfile);
                %mesh2ScFile(vertices,faces-1,['letter' num2str(counterM)],['mesh' num2str(counterM)],scfile);

                patch('faces',faces,'vertices',vertices,'facecolor','r');

            end
            xcord=[];
            ycord=[];
            counterM=counterM+1;
            count2=count2+1;
            xcord=[xcord;m1];
            ycord=[ycord;height-m2];
        case 'C'  %bezier curve
            for k = 1:3
                x(k) = fscanf(fid,'%g',1);
                rough = fscanf(fid,'%c',1);
                y(k) = fscanf(fid,'%g',1);
            end
            [a,b]=bezier([M(1) x],height-[M(2) y],20);
            count2=count2+1;
            %Last point in bezier curve is the new current point
            M=[x(3) y(3)];
            count2=count2+1;

            xcord=[xcord;a'];
            ycord=[ycord;b'];
        case 'L'  %line
            %Read two numbers from file. 
            l1   =fscanf(fid,'%g',1);
            rough=fscanf(fid,'%c',1);
            l2   =fscanf(fid,'%g',1);
           
            L=[l1 l2];
            xcord=[xcord;l1];
            ycord=[ycord;height-l2]; %make y upside down.
            %These two points will be the current point.
            M=L;
            count2=count2+1;
        otherwise
            %do nothing
    end
    count=count+1;
end


axis equal,view(3)

n=20;
t=linspace(0,-pi/2,n);
theta=repmat(t,length(xcord),1);
xpos=repmat(xcord,1,n);
X=xpos;
Z=zeros(size(xpos));
ypos=repmat(ycord,1,n);
[Z,Y] =transform2d(Z,ypos,0,0,theta,0,0);

%% Draw the surface
[vertices,faces] = surf2tripatch(X,Y,Z);
%shader2ScFile('amb-occ',['letter' num2str(counterM)],cmap(counterM+1,:),[0.1 0.1 0.1],scfile);
mesh2ScFile(vertices,faces-1,['letter' num2str(counterM)],['mesh' num2str(counterM)],scfile);
patch('faces',faces,'vertices',vertices,'facecolor','r');
%Close the file
fclose(fid);
fclose(scfile);