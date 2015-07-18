%dodeca2sunflow
load dodecahedron
dFace=face;
dVert=vert;
phi=(1+sqrt(5))/2;
count=0;
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

faces=[1 13 2 18 17;
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

scfile=fopen('dodecahedron.sc','w');
shader2ScFile('diffuse','shaderHair',[0.7 0.7 0.7],scfile);
for n=1:length(faces)
    for m=1:4
        findex1=faces(n,m);
        findex2=faces(n,m+1);
        points=[vert(findex1,:);vert(findex2,:)];
        %points2ScHair(points,scfile);
        %tubep = {points};
        %streamtube(tubep,[1 20]);
        [tx,ty,tz]=tubeplot([points(:,1)';points(:,2)';points(:,3)'],0.05,20);
        [tubev,tubef]=surf2tripatch(tx,ty,tz);
        patch('faces',tubef,'vertices',tubev,'facecolor','r');
        mesh2ScFile(tubev,tubef-1,'shaderHair',['tubeMesh' num2str(count)],scfile);
        count=count+1;
    end
    findex1=faces(n,1);
    findex2=faces(n,end);
    points=[vert(findex1,:);vert(findex2,:)];
    [tx,ty,tz]=tubeplot([points(:,1)';points(:,2)';points(:,3)'],0.05,20);
    [tubev,tubef]=surf2tripatch(tx,ty,tz);
    mesh2ScFile(tubev,tubef-1,'shaderHair',['tubeMesh' num2str(count)],scfile);
    count=count+1;
    
end

shader2ScFile('diffuse','vertBallShader',[0.2 0.5 0.8],scfile);
for n=1:length(vert)
    primitive2ScFile('sphere','vertBallShader',vert(n,:),0.09,scfile)
end

shader2ScFile('diffuse','dodecaShader',[0.2 0.5 0.8],scfile);
mesh2ScFile(dVert,dFace-1,'dodecaShader','dodecaMesh',scfile);
fclose(scfile);

patch('faces',dFace,'vertices',dVert,'facecolor','c');
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,5.5,1});
axis equal

for n=1:length(vert)
    %fprintf('%f %f %f \n',vert(n,:));
end