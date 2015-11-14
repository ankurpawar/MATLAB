function TruncatedIcosidodeahedron
%projections of TruncatedIcosidodeahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=perms([1/phi 1/phi 3+phi
    2/phi phi 1+2*phi
    1/phi phi^2 -1+3*phi
    -1+2*phi 2 2+phi
    phi 3 2*phi],'signs');

vert=perms(vert,'even');

face1=[13    19     7     1
    2    14    20     8
    3    15    21     9
    4    10    22    16
    17     5    11    23
    12    24    18     6
    49    25    73    97
    26    74    98    50
    99    51    27    75
    100    76    28    52
    77    29    53   101
    78    30    54   102
    31    55   103    79
    56   104    80    32
    81    33    57   105
    82   106    58    34
    107    59    35    83
    108    60    36    84
    109    85    37    61
    62   110    86    38
    63   111    87    39
    64    40    88   112
    113    65    41    89
    42    90   114    66
    91   115    67    43
    44    92   116    68
    45    93   117    69
    46    70   118    94
    95    47    71   119
    72   120    96    48];

face2=[61    37    13     1    25    49
    2    26    50    62    38    14
    51    63    39    15     3    27
    52    28     4    16    40    64
    53    29     5    17    41    65
    6    18    42    66    54    30
    19    43    67    55    31     7
    20    44    68    56    32     8
    9    21    45    69    57    33
    10    34    58    70    46    22
    71    47    23    11    35    59
    60    72    48    24    12    36
    74    97    73    99    75    98
    110    81   105    76   100    86
    79   103    77   101    87   111
    104    78   102    85   109    80
    117    93   113    89   106    82
    114    90   107    83   115    91
    92   112    88   108    84   116
    94   118    95   119    96   120];

face3=[25     1     7    31    79   111    63    51    99 73
    8    32    80   109    61    49    97    74    26 2
    50    98    75    27     3     9    33    81   110 62
    76   105    57    69   117    82    34    10     4 28
    67   115    83    35    11     5    29    77   103 55
    68   116    84    36    12     6    30    78   104 56
    85   102    54    66   114    91    43    19    13 37
    14    38    86   100    52    64   112    92    44 20
    15    39    87   101    53    65   113    93    45 21
    40    16    22    46    94   120    72    60   108 88
    58   106    89    41    17    23    47    95   118 70
    24    48    96   119    71    59   107    90    42 18];

c=[1 0 -0.5 -1];
offset=[-3 -0.75 1.5 3.75];
minZ=[-0.8507 -0.8507 -1.0000 -1.2146];
view(3)
[numFace1,ro]=size(face1);
[numFace2,ro]=size(face2);
[numFace3,ro]=size(face3);

origFace={face1;face2;face3};


%patch('vertices',vert,'faces',face2,'facecolor','r');

colors1=repmat([0.85 0.425 0.05],numFace1,1);
colors2=repmat([0.5 0.5 0.5],numFace2,1);
colors3=repmat([0.05 0.75 0.75],numFace3,1);
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


