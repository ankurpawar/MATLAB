%great dodeca2sunflow
load greatDodeca
gdVert=stellatedVert;
gdFace=stellatedFace;
count=0;
patch('faces',gdFace,'vertices',gdVert,'facecolor','c');
vert=gdVert;
K = convhulln(vert);
h=trisurf(K,vert(:,1),vert(:,2),vert(:,3),'facecolor','y');
faces=get(h,'faces');
spherePos=unique(faces);

clf
scfile=fopen('greatDodeca.sc','w');

shader2ScFile('diffuse','shaderHair',[0.7 0.7 0.7],scfile);
for n=1:length(faces)
    for m=1:2
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
for n=1:length(spherePos)
    primitive2ScFile('sphere','vertBallShader',vert(spherePos(n),:),0.07,scfile);
end

shader2ScFile('diffuse','dodecaShader',[0.2 0.5 0.8],scfile);
mesh2ScFile(gdVert,gdFace-1,'dodecaShader','dodecaMesh',scfile);
fclose(scfile);

patch('faces',gdFace,'vertices',gdVert,'facecolor','c');
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',{@camera2Sc,7,1});
axis equal

