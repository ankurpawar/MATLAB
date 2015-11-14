function Rhombicosidodecahedron
%projections of Rhombicosidodecahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=[1.0000    1.0000    4.2361
    1.0000    1.0000   -4.2361
    1.0000   -1.0000    4.2361
    1.0000   -1.0000   -4.2361
    -1.0000    1.0000    4.2361
    -1.0000    1.0000   -4.2361
    -1.0000   -1.0000    4.2361
    -1.0000   -1.0000   -4.2361
    4.2361    1.0000    1.0000
    4.2361    1.0000   -1.0000
    4.2361   -1.0000    1.0000
    4.2361   -1.0000   -1.0000
    -4.2361    1.0000    1.0000
    -4.2361    1.0000   -1.0000
    -4.2361   -1.0000    1.0000
    -4.2361   -1.0000   -1.0000
    1.0000    4.2361    1.0000
    1.0000    4.2361   -1.0000
    1.0000   -4.2361    1.0000
    1.0000   -4.2361   -1.0000
    -1.0000    4.2361    1.0000
    -1.0000    4.2361   -1.0000
    -1.0000   -4.2361    1.0000
    -1.0000   -4.2361   -1.0000
    2.6180    1.6180    3.2361
    2.6180    1.6180   -3.2361
    2.6180   -1.6180    3.2361
    2.6180   -1.6180   -3.2361
    -2.6180    1.6180    3.2361
    -2.6180    1.6180   -3.2361
    -2.6180   -1.6180    3.2361
    -2.6180   -1.6180   -3.2361
    3.2361    2.6180    1.6180
    3.2361    2.6180   -1.6180
    3.2361   -2.6180    1.6180
    3.2361   -2.6180   -1.6180
    -3.2361    2.6180    1.6180
    -3.2361    2.6180   -1.6180
    -3.2361   -2.6180    1.6180
    -3.2361   -2.6180   -1.6180
    1.6180    3.2361    2.6180
    1.6180    3.2361   -2.6180
    1.6180   -3.2361    2.6180
    1.6180   -3.2361   -2.6180
    -1.6180    3.2361    2.6180
    -1.6180    3.2361   -2.6180
    -1.6180   -3.2361    2.6180
    -1.6180   -3.2361   -2.6180
    3.6180         0    2.6180
    3.6180         0   -2.6180
    -3.6180         0    2.6180
    -3.6180         0   -2.6180
    2.6180    3.6180         0
    2.6180   -3.6180         0
    -2.6180    3.6180         0
    -2.6180   -3.6180         0
    0    2.6180    3.6180
    0    2.6180   -3.6180
    0   -2.6180    3.6180
    0   -2.6180   -3.6180];

face1=[1     5    57
    2     6    58
    3     7    59
    4     8    60
    9    11    49
    10    12    50
    13    15    51
    14    16    52
    17    18    53
    19    20    54
    21    22    55
    23    24    56
    25    33    41
    26    34    42
    27    35    43
    28    36    44
    29    37    45
    30    38    46
    31    39    47
    32    40    48];

face2=[3     7     5     1
    25     1    57    41
    8     4     2     6
    2    26    42    58
    43    59     3    27
    60    44    28     4
    45    57     5    29
    58    46    30     6
    31     7    59    47
    8    32    48    60
    12    11     9    10
    9    49    25    33
    50    10    34    26
    35    27    49    11
    28    36    12    50
    14    13    15    16
    37    29    51    13
    30    38    14    52
    15    51    31    39
    52    16    40    32
    18    17    21    22
    53    33    41    17
    34    53    18    42
    24    23    19    20
    19    43    35    54
    44    20    54    36
    21    45    37    55
    46    22    55    38
    56    39    47    23
    40    56    24    48];

face3=[ 27     3     1    25    49
    4    28    50    26     2
    29     5     7    31    51
    6    30    52    32     8
    10     9    33    53    34
    36    54    35    11    12
    38    55    37    13    14
    16    15    39    56    40
    17    41    57    45    21
    58    42    18    22    46
    23    47    59    43    19
    48    24    20    44    60];



c=[1 0 -0.5 -1];
offset=[-3 -0.75 1.5 3.75];
minZ=[-0.8507 -0.8507 -1.0000 -1.2146];
view(3)
[numFace1,ro]=size(face1);
[numFace2,ro]=size(face2);
[numFace3,ro]=size(face3);
origFace={face1;face2;face3};



colors1=repmat([0.65 0.65 0.65],numFace1,1);
colors2=repmat([0.85 0.5 0.65],numFace2,1);
colors3=repmat([0.85 0.75 0.45],numFace3,1);
colors={colors1;colors2;colors3};

for ii=1:3
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