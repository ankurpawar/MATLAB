%small Stellated dodeca
load smallStellatedDodeca
ssdVert=stellatedVert;
ssdFace=stellatedFace;
count=0;
patch('faces',ssdFace,'vertices',ssdVert,'facecolor','c');

vert=ssdVert;
K = convhulln(vert);
h=trisurf(K,vert(:,1),vert(:,2),vert(:,3),'facecolor','y');
faces=get(h,'faces');
clf
spherePos=unique(faces);
scfile=fopen('smallStellatedDodeca.sc','w');

shader2ScFile('diffuse','shaderHair',[0.7 0.7 0.7],scfile);

for n=1:length(ssdFace)
    for m=1:2
        findex1=ssdFace(n,m);
        findex2=ssdFace(n,m+1);
        points=[vert(findex1,:);vert(findex2,:)];
        %points2ScHair(points,scfile);
        %tubep = {points};
        %streamtube(tubep,[1 20]);
        [tx,ty,tz]=tubeplot([points(:,1)';points(:,2)';points(:,3)'],0.05,25);
        [tubev,tubef]=surf2tripatch(tx,ty,tz);
        patch('faces',tubef,'vertices',tubev,'facecolor','r');
        mesh2ScFile(tubev,tubef-1,'shaderHair',['tubeMesh' num2str(count)],scfile);
        count=count+1;
    end
    findex1=ssdFace(n,1);
    findex2=ssdFace(n,end);
    points=[vert(findex1,:);vert(findex2,:)];
    [tx,ty,tz]=tubeplot([points(:,1)';points(:,2)';points(:,3)'],0.05,25);
    [tubev,tubef]=surf2tripatch(tx,ty,tz);
    patch('faces',tubef,'vertices',tubev,'facecolor','r');
    mesh2ScFile(tubev,tubef-1,'shaderHair',['tubeMesh' num2str(count)],scfile);
    count=count+1;
    
end

shader2ScFile('diffuse','vertBallShader',[0.2 0.5 0.8],scfile);
for n=1:length(spherePos)
    primitive2ScFile('sphere','vertBallShader',vert(spherePos(n),:),0.07,scfile);
end

shader2ScFile('diffuse','dodecaShader',[0.2 0.5 0.8],scfile);
mesh2ScFile(ssdVert,ssdFace-1,'dodecaShader','dodecaMesh',scfile);
fclose(scfile);

patch('faces',ssdFace,'vertices',ssdVert,'facecolor','c');
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,7,1});

axis equal
view(3)
