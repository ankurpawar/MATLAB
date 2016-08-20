%sphericalOcta
choice = 2;
phi = (1+sqrt(5))/2;
switch choice
    case 1  %tetra
        vert=[+1 +1 +1
            -1 -1 +1
            -1 +1 -1
            +1 -1 -1];
        face=[1 2 3
            2 3 4
            1 3 4
            1 2 4];
    case 2  %octa
        vert=[1 0 0
            -1 0 0
            0 1 0
            0 -1 0
            0 0 1
            0 0 -1];
        face=[3 5 2
            5 3 1
            6 3 2
            3 6 1
            4 5 1
            5 4 2
            4 6 2
            6 4 1];
    case 3   %icosa
        vert=[0 1 phi;
            0 1 -phi;
            0 -1 phi;
            0 -1 -phi;
            1 phi 0;
            1 -phi 0;
            -1 phi 0;
            -1 -phi 0;
            phi 0 1;
            phi 0 -1;
            -phi 0 1;
            -phi 0 -1];
        face =[1     5     9
            6     3     9
            1     3    11
            3     1     9
            7     2     5
            7     1    11
            1     7     5
            10     6     9
            5    10     9
            2    10     5
            10     4     6
            4    10     2
            4     8     6
            3     8    11
            8     3     6
            7    12     2
            12     4     2
            12     7    11
            8    12    11
            12     8     4];
    case 4
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
        
        face=[1 13 2 18 17;
            1 9 5 15 13;
            13 15 6 10 2;
            2 10 12 4 18;
            18 17 3 14 4;
            1 9 11 3 17;
            5 9 11 7 19;
            15 5 19 20 6;
            6 20 8 12 10;
            20 19 7 16 8;
            8 12 4 14 16;
            11 7 16 14 3];
    case 5      %  cube
        vert=[1 1 1
            1 1 -1
            1 -1 1
            1 -1 -1
            -1 1 1
            -1 1 -1
            -1 -1 1
            -1 -1 -1];
        face=[1 2 4 3
            1 5 6 2
            5 6 8 7
            7 8 4 3
            1 3 7 5
            2 4 8 6];
    case 6
        vert1=[0 1 phi
            0 1 -phi
            0 -1 phi
            0 -1 -phi
            1 phi 0
            1 -phi 0
            -1 phi 0
            -1 -phi 0
            phi 0 1
            phi 0 -1
            -phi 0 1
            -phi 0 -1];
        
        vert2=[1 1 1
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
        [vert1(:,1),vert1(:,2)]=transform2d(vert1(:,1),vert1(:,2),0,0,90*pi/180,0,0);
        vert=[vert1;vert2];
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
    case 7 % Rhombododecahedron
        vert = [0 0 2;
            1 -1 1;
            1 1 1;
            -1 1 1;
            -1 -1 1;
            2 0 0;
            0 2 0;
            -2 0 0;
            0 -2 0;
            1 -1 -1;
            1 1 -1;
            -1 1 -1;
            -1 -1 -1;
            0 0 -2];
        face=[ 2     1     3     6
            9     5     1     2
            3     1     4     7
            4     1     5     8
            9     2     6    10
            6     3     7    11
            7     4     8    12
            8     5     9    13
            10     6    11    14
            14    11     7    12
            14    12     8    13
            13     9    10    14 ]    ;
end

[pairs,tubeLineX,tubeLineY,tubeLineZ]=sphericalPolhedra(vert,face);
colors = cool(length(pairs));
[x,y,z]=sphere(50);
[f,v,c]=surf2patch(x/10,y/10,z/10,z);

for n=1:length(pairs)
    index=pairs(n,:);
    tubeLines = {[vert(index,:)]};
    daspect([1 1 1])
    h=streamtube(tubeLines,0.1);
    set(h,'facecolor','interp','edgecolor','none');
end

ve=vert;
length(ve);
vnew=v;

for k=1:length(ve)
    xsph=ve(k,1);
    ysph=ve(k,2);
    zsph=ve(k,3);
    vnew(:,1)=v(:,1)+xsph;
    vnew(:,2)=v(:,2)+ysph;
    vnew(:,3)=v(:,3)+zsph;
    patch('faces',f,'vertices',vnew,'facecolor',[0.5 0.5 0.5],'edgecolor','none');
end

axis off
a = makeColorMap(rand(1,3),rand(1,3),rand(1,3));
colormap(a)

camlight headlight
lighting phong
set(gcf,'color',[1 1 1]);
axis equal
view(3);