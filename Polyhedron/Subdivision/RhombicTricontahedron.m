function RhombicTricontahedron
%projections of RhombicTricontahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=[-1.0000    0.0000    1.6180
    -1.0000    0.0000   -1.6180
    1.0000   -0.0000    1.6180
    1.0000   -0.0000   -1.6180
    -1.6180    1.0000         0
    1.6180    1.0000         0
    -1.6180   -1.0000         0
    1.6180   -1.0000         0
    0.0000    1.6180    1.0000
    0.0000    1.6180   -1.0000
    -0.0000   -1.6180    1.0000
    -0.0000   -1.6180   -1.0000
    1.0000    1.0000    1.0000
    1.0000    1.0000   -1.0000
    1.0000   -1.0000    1.0000
    1.0000   -1.0000   -1.0000
    -1.0000    1.0000    1.0000
    -1.0000    1.0000   -1.0000
    -1.0000   -1.0000    1.0000
    -1.0000   -1.0000   -1.0000
    0    0.6180    1.6180
    0    0.6180   -1.6180
    0   -0.6180    1.6180
    0   -0.6180   -1.6180
    0.6180    1.6180         0
    0.6180   -1.6180         0
    -0.6180    1.6180         0
    -0.6180   -1.6180         0
    1.6180         0    0.6180
    1.6180         0   -0.6180
    -1.6180         0    0.6180
    -1.6180         0   -0.6180];

face=[3    23     1    21
    5    17     1    31
    31     1    19     7
    9    21     1    17
    19     1    23    11
    24     4    22     2
    18     5    32     2
    2    32     7    20
    22    10    18     2
    2    20    12    24
    29     3    13     6
    8    15     3    29
    13     3    21     9
    11    23     3    15
    4    30     6    14
    16     8    30     4
    4    14    10    22
    24    12    16     4
    5    31     7    32
    27     9    17     5
    10    27     5    18
    8    29     6    30
    6    13     9    25
    14     6    25    10
    7    19    11    28
    20     7    28    12
    26    11    15     8
    12    26     8    16
    10    25     9    27
    12    28    11    26];

face=convhulln(vert,{'Qt'});
length(face);
a=meshgrid(1:30,1:2);
numFace=length(face);
numVert=length(vert);
colors=makeColorMap([0.4 0.25 0.36],[0.78 0.9 0.58],[0.19 0.6 0.91],30);
cmap=colors(a(:),:);
modVert=cell(numFace,1);
modFace=cell(numFace,1);

for n=1:numFace
    vertNew=vert(face(n,:),:);
    faceNew=[1 2 3];
    
    for m=1:4
        [vertNew, faceNew] = subdivisionLinear3(vertNew, faceNew);
    end
    modVert{n,1}=vertNew;
    modFace{n,1}=faceNew;
    clear vertNew faceNew
end

c=[1 0 -0.5 -1];
offset=[-3 -0.75 1.5 3.75];
numS=['1234'];
minZ=[-0.8507 -0.8507 -1.0000 -1.2146];
view(3)

for k=1:4
    num=numS(k);
    for n=1:numFace
        vertNew=modVert{n,1};
        faceNew=modFace{n,1};
        [vertNew(:,1),vertNew(:,2),vertNew(:,3)]=onSphere(vertNew(:,1),vertNew(:,2),vertNew(:,3),c(k));
        if n==1
            dis=sqrt( sum((vertNew(1,:)).^2) );
        end
        vertNew=vertNew/dis;
        vertNew(:,1)=vertNew(:,1)+offset(k);
        h=patch('vertices',vertNew,'faces',faceNew,'facecolor',cmap(n,:),'edgecolor','none');
        vNorm=get(h,'vertexNormals');
    end
end

view(3)
axis equal off
lighting phong
camlight headlight
material dull
set(gca,'cameraposition',[0 -20 10])
set(gcf,'position',[100 100 700 500],'color',[1 1 1])
camva(14)
callbackStr='export_fig(''png'',''poly.png'',''-nocrop'',''-a4'')';

sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);

function  [xnew,ynew,znew]=onSphere(x,y,z,c)
S = (x.^2+y.^2+z.^2).^(c);
xnew = x.*S;
ynew = y.*S;
znew = z.*S;
return