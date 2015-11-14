function DodecahedronProjection
%projections of dodecahedron
phi=(1+sqrt(5))/2; %golden ratio

vert=[1 1 1
    1 1 -1
    1 -1 1
    1 -1 -1
    -1 1 1
    -1 1 -1
    -1 -1 1
    -1 -1 -1
    0 1/phi phi
    0 1/phi -phi
    0 -1/phi phi
    0 -1/phi -phi
    1/phi phi 0
    1/phi -phi 0
    -1/phi phi 0
    -1/phi -phi 0
    phi 0 1/phi
    phi 0 -1/phi
    -phi 0 1/phi
    -phi 0 -1/phi];

face=[1 13 2 18 17
    1 9 5 15 13
    13 15 6 10 2
    2 10 12 4 18
    18 17 3 14 4
    1 9 11 3 17
    5 9 11 7 19
    15 5 19 20 6
    6 20 8 12 10
    20 19 7 16 8
    8 12 4 14 16
    11 7 16 14 3];

edge=[1     3
    1     5
    1     7
    1     9
    1    11
    2     4
    2     5
    2     7
    2    10
    2    12
    3     6
    3     8
    3     9
    3    11
    4     6
    4     8
    4    10
    4    12
    5     7
    5     9
    5    10
    6     8
    6     9
    6    10
    7    11
    7    12
    8    11
    8    12
    9    10
    11    12];

face=convhulln(vert,{'Qt'});
length(face);
a=meshgrid(1:12,1:3);
numFace=length(face);
numVert=length(vert);
colors=makeColorMap([0.4 0.75 0.76],[0.8 0.8 0.8],[0.9 0.86 0.1],12);
cmap=colors(a(:),:);
modVert=cell(numFace,1);
modFace=cell(numFace,1);

for n=1:numFace
    vertNew=vert(face(n,:),:);
    faceNew=[1 2 3];
    
    for m=1:4
        [vertNew, faceNew] = subdivisionLinear3(vertNew, faceNew);
    end
    modVert{n,1} = vertNew;
    modFace{n,1} = faceNew;
    clear vertNew faceNew
end

c = [1 0 -0.5 -1];
offset = [-3 -1 1.15 3.75];
numS = ['1234'];
minZ = [-0.8507 -0.8507 -1.0000 -1.2146];
view(3)

%loop to place the projected dodecahedron in different positions
for k = 1:4
    num = numS(k);
    for n=1:numFace
        vertNew = modVert{n,1};
        faceNew = modFace{n,1};
        %calculate the projected coordinates for different value
        [vertNew(:,1),vertNew(:,2),vertNew(:,3)] = onSphere(vertNew(:,1),vertNew(:,2),vertNew(:,3),c(k));
        if n == 1
            dis = sqrt( sum((vertNew(1,:)).^2) );
        end
        vertNew = vertNew/dis;
        vertNew(:,1)=vertNew(:,1)+offset(k);
        h = patch('vertices',vertNew,...
                    'faces',faceNew,...
                    'facecolor',cmap(n,:),...
                    'edgecolor','none');        
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
callbackStr = 'export_fig(''png'',''poly.png'',''-nocrop'',''-a4'')';

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