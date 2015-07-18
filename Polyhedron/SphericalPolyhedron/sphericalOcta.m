%sphericalOcta
choice=4;
phi=(1+sqrt(5))/2;
vertCell=cell(5,1);
faceCell=cell(5,1);
%switch choice
%   case 1  %tetra
vert=[+1 +1 +1
    -1 -1 +1
    -1 +1 -1
    +1 -1 -1];
face=[1 2 3
    2 3 4
    1 3 4
    1 2 4];
vertCell{1,1}=vert;
faceCell{1,1}=face;
%   case 2  %octa
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
vertCell{2,1}=vert;
faceCell{2,1}=face;
%    case 3   %icosa
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
vertCell{3,1}=vert;
faceCell{3,1}=face;
%    case 4
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
vertCell{4,1}=vert;
faceCell{4,1}=face;
%    case 5      %  cube
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
vertCell{5,1}=vert;
faceCell{5,1}=face;
%end
xoff=[-2.5 2.5 0 2.5 -2.5];
yoff=[-2.5 -2.5 0 2.5 2.5];
zoff=[0 0 0 0 0];
% scfile=fopen('sphereOct.sc','w');
count=0;
colors=hsv(5);
for m=1:5
    
    [pairs,tubeLineX,tubeLineY,tubeLineZ]=sphericalPolhedra(vertCell{m,1},faceCell{m,1});
    
    
    
    for n=1:length(pairs)
        
        tubeLines = {[tubeLineX(n,:)'+xoff(m) tubeLineY(n,:)'+yoff(m) tubeLineZ(n,:)'+zoff(m)]};
        daspect([1 1 1])
        
        h=streamtube(tubeLines,0.2);
        set(h,'facecolor',colors(m,:));
        x=get(h,'xdata');
        y=get(h,'ydata');
        z=get(h,'zdata');
        %shader2ScFile('glass',['edge' num2str(count) 'shade'],1.4,colors(m,:),scfile);
        %shader2ScFile('diffuse',['edge' num2str(count) 'shade'],colors(m,:),scfile);
        [v,f]=surf2tripatch(x,y,z);
        %     mesh2ScFile(v,f-1,['edge' num2str(count) 'shade'],['edge' num2str(count) 'tube'],scfile)
        count=count+1;
    end
    %     shader2ScFile('shiny',['vertBallShader' num2str(m)] ,[0.8 0.8 0.8],0.5,scfile);
    ve=vertCell{m,1};
    length(ve);
    for k=1:length(ve)
        sph=sqrt(1./(ve(k,1).^2+ve(k,2).^2+ve(k,3).^2));
        xsph=ve(k,1)*sph+xoff(m);
        ysph=ve(k,2)*sph+yoff(m);
        zsph=ve(k,3)*sph+zoff(m);
        %      primitive2ScFile('sphere',['vertBallShader' num2str(m)],[xsph ysph zsph],0.15,scfile);
    end
    
end
% fclose(scfile);
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,10,1});

%get(h)
%whos
axis equal
view(3);