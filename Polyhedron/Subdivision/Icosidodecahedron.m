function Icosidodecahedron
%projections of Icosidodecahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=[ 0         0    1.6180
    0         0   -1.6180
    0    1.6180         0
    0   -1.6180         0
    1.6180         0         0
    -1.6180         0         0
    0.5000    0.8090    1.3090
    0.5000    0.8090   -1.3090
    0.5000   -0.8090    1.3090
    0.5000   -0.8090   -1.3090
    -0.5000    0.8090    1.3090
    -0.5000    0.8090   -1.3090
    -0.5000   -0.8090    1.3090
    -0.5000   -0.8090   -1.3090
    0.8090    1.3090    0.5000
    0.8090    1.3090   -0.5000
    0.8090   -1.3090    0.5000
    0.8090   -1.3090   -0.5000
    -0.8090    1.3090    0.5000
    -0.8090    1.3090   -0.5000
    -0.8090   -1.3090    0.5000
    -0.8090   -1.3090   -0.5000
    1.3090    0.5000    0.8090
    1.3090    0.5000   -0.8090
    1.3090   -0.5000    0.8090
    1.3090   -0.5000   -0.8090
    -1.3090    0.5000    0.8090
    -1.3090    0.5000   -0.8090
    -1.3090   -0.5000    0.8090
    -1.3090   -0.5000   -0.8090];

face1=[1     7    11
    1     9    13
    2     8    12
    2    10    14
    3    15    16
    3    19    20
    4    17    18
    4    21    22
    5    23    25
    5    24    26
    6    27    29
    6    28    30
    7    15    23
    8    16    24
    9    17    25
    10    18    26
    11    19    27
    12    20    28
    13    21    29
    14    22    30];

face2=[25     9     1     7    23
    27    11     1    13    29
    10    26    24     8     2
    2    12    28    30    14
    15     7    11    19     3
    8    16     3    20    12
    4    21    13     9    17
    14    22     4    18    10
    24     5    23    15    16
    18    17    25     5    26
    20    19    27     6    28
    30     6    29    21    22];

c=[1 0 -0.5 -1];
offset=[-3 -0.75 1.5 3.75];
minZ=[-0.8507 -0.8507 -1.0000 -1.2146];
view(3)
[numFace1,ro]=size(face1);
origFace={face1;face2};


[numFace2,ro]=size(face2);
colors1=repmat([0.65 0.65 0.75],numFace1,1);
colors2=makeColorMap([0.84 0.25 0.16],[0.79 0.86 0.51],numFace2);
colors={colors1;colors2};

for ii=1:2
    [numFace,ro]=size(origFace{ii,1});
    modVert=cell(numFace,1);
    modFace=cell(numFace,1);
    face=origFace{ii,1};
    seq=(1:ro-2)';
    
    for n=1:numFace
        vertNew=vert(face(n,:),:);
        faceNew=[ones(ro-2,1) 1+seq 2+seq];
        for m=1:4
            [vertNew, faceNew] = subdivisionLinear3(vertNew, faceNew);
        end
        modVert{n,1}=vertNew;
        modFace{n,1}=faceNew;
        clear vertNew faceNew
    end
    
    for k=1:4
        
        for n=1:numFace
            vertNew=modVert{n,1};
            faceNew=modFace{n,1};
            [vertNew(:,1),vertNew(:,2),vertNew(:,3)]=onSphere(vertNew(:,1),vertNew(:,2),vertNew(:,3),c(k));
            if n==1
                dis=sqrt( sum((vertNew(1,:)).^2) );
            end
            vertNew=vertNew/dis;
            vertNew(:,1)=vertNew(:,1)+offset(k);
            h=patch('vertices',vertNew,'faces',faceNew,'facecolor','flat','facevertexcdata',colors{ii,1}(n,:),'edgecolor','none');
        end
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