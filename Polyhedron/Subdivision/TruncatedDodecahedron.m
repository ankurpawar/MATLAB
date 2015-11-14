function TruncatedDodecahedron
%projections of TruncatedDodecahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=perms([0 1/phi 2+phi,
    2+phi 0 1/phi,
    1/phi 2+phi 0,
    1/phi phi 2*phi,
    2*phi 1/phi phi,
    phi 2*phi 1/phi,
    phi 2 phi^2,
    phi^2 phi 2,
    2 phi^2 phi],'signs');
vert=unique(vert,'rows');
face1=[ 1     3     5
    2     4     6
    7    11    17
    8    12    18
    9    13    19
    10    14    20
    15    16    23
    21    22    28
    24    29    34
    25    30    35
    26    31    36
    27    32    37
    33    39    40
    38    45    46
    41    47    51
    42    48    52
    43    49    53
    44    50    54
    55    57    59
    56    58    60];

face2=[7     3     1     2     4     8    12    16    15 11
    9    13    21    22    14    10     6     2     1 5
    31    26    19     9     5     3     7    17    24 29
    6    10    20    27    32    30    25    18     8 4
    24    17    11    15    23    33    39    47    41 34
    23    16    12    18    25    35    42    48    40 33
    36    43    49    45    38    28    21    13    19 26
    38    46    50    44    37    27    20    14    22 28
    29    34    41    51    55    57    53    43    36 31
    56    52    42    35    30    32    37    44    54 58
    47    39    40    48    52    56    60    59    55 51
    57    59    60    58    54    50    46    45    49 53];
c=[1 0 -0.5 -1];
offset=[-3 -0.75 1.5 3.75];
minZ=[-0.8507 -0.8507 -1.0000 -1.2146];
view(3)
[numFace1,ro]=size(face1);
[numFace2,ro]=size(face2);

origFace={face1;face2};

colors1=repmat([0.65 0.65 0.65],numFace1,1);
colors2= makeColorMap([0.8 0.55 0.27],[0.43 0.58 0.94],numFace2);
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


axis equal
view(3)

function  [xnew,ynew,znew]=onSphere(x,y,z,c)
S = (x.^2+y.^2+z.^2).^(c);
xnew = x.*S;
ynew = y.*S;
znew = z.*S;
return