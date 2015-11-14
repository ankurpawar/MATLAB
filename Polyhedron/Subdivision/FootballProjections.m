function FootballProjections
%projections of bucky ball
phi=(1+sqrt(5))/2; %golden ratio

[b,vert] = bucky;

face=[3  2  1  5  4
    8   7   6  10   9
    13  12  11  15  14
    18  17  16  20  19
    23  22  21  25  24
    28  27  26  30  29
    34  33  32  31  35
    39  38  37  36  40
    44  43  42  41  45
    49  48  47  46  50
    55  54  53  52  51
    60  59  58  57  56];

faceList2=[10   6   1   2  11  12
    30  26   5   1   6   7
    15  11   2   3  16  17
    20  16   3   4  21  22
    25  21   4   5  26  27
    43  29  30   7   8  42
    41  42   8   9  38  39
    38   9  10  12  13  37
    36  37  13  14  33  34
    33  14  15  17  18  32
    31  32  18  19  53  54
    53  19  20  22  23  52
    51  52  23  24  48  49
    48  24  25  27  28  47
    46  47  28  29  43  44
    56  35  31  54  55  60
    57  40  36  34  35  56
    58  45  41  39  40  57
    59  50  46  44  45  58
    60  55  51  49  50  59];


a = meshgrid(1:12,1:3);
numFace = length(face);
numVert = length(vert);
cmap = repmat([0.75 0.75 0.95],[12 1]);
modVert = cell(numFace,1);
modFace = cell(numFace,1);

tic
for n=1:numFace
    vertNew = vert(face(n,:),:);
    faceNew = [1 2 3;4 5 1;3 4 1];
    
    for m = 1:4
        [vertNew, faceNew] = subdivisionLinear3(vertNew, faceNew);
    end
    modVert{n,1} = vertNew;
    modFace{n,1} = faceNew;
    
    clear vertNew faceNew
end
toc

c = [1 0 -0.5 -1];
offset = [-3 -1 1.25 3.75];
minZ = [-0.8507 -0.8507 -1.0000 -1.2146];

for k = 1:4
    for n = 1:numFace
        vertNew = modVert{n,1};
        faceNew = modFace{n,1};
        [vertNew(:,1),vertNew(:,2),vertNew(:,3)] = onSphere(vertNew(:,1),vertNew(:,2),vertNew(:,3),c(k));
        if n == 1
            dis = sqrt( sum((vertNew(1,:)).^2) );
        end
        vertNew = vertNew/dis;
        vertNew(:,1) = vertNew(:,1)+offset(k);
        h=patch('vertices',vertNew,...
                'faces',faceNew,...
                'facecolor',cmap(n,:),...
                'edgecolor','none');
    end
end


a = meshgrid(1:12,1:3);
numFace = length(faceList2);
numVert = length(vert);
cmap = repmat([0.5 0.5 0.5;0.75 0.25 0.25],[10 1]);
cmap = spring(20);
modVert = cell(numFace,1);
modFace = cell(numFace,1);

%subdivide each face of bucky ball
for n = 1:numFace
    vertNew = vert(faceList2(n,:),:);
    faceNew = [1 2 3;4 5 1;3 4 1;1 6 5];
    
    for m = 1:4
        [vertNew, faceNew] = subdivisionLinear3(vertNew, faceNew);
    end
    modVert{n,1} = vertNew;
    modFace{n,1} = faceNew;
end

c = [1 0 -0.5 -1];
offset = [-3 -1 1.25 3.75];
minZ = [-0.8507 -0.8507 -1.0000 -1.2146];

%calculate the projected coordinates of bucky ball and place it on 
%four different positions
for k = 1:4
    for n = 1:numFace
        vertNew = modVert{n,1};
        faceNew = modFace{n,1};
        [vertNew(:,1),vertNew(:,2),vertNew(:,3)] = onSphere(vertNew(:,1),vertNew(:,2),vertNew(:,3),c(k));
        if n == 1
            dis = sqrt( sum((vertNew(1,:)).^2) );
        end
        vertNew = vertNew/dis;
        vertNew(:,1) = vertNew(:,1) + offset(k);
        h = patch('vertices',vertNew,'faces',faceNew,'facecolor',cmap(n,:),'edgecolor','none');
    end
end

view(3)
axis equal off
lighting phong
camlight headlight
material dull
set(gca,'cameraposition',[0 -20 10])
set(gcf,'position',[100 100 700 500],'color',[1 1 1]);
camva(14);
callbackStr='export_fig(''png'',''poly.png'',''-nocrop'',''-a4'')';

sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);


function [xnew,ynew,znew] = onSphere(x,y,z,c)
S = (x.^2+y.^2+z.^2).^(c);
xnew = x.*S;
ynew = y.*S;
znew = z.*S;
return