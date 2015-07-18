function dodecahedronFractal3
global scfile count COLORMAP
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
count=0;
face=convhulln(vert,{'Qt'});
scfile=fopen('dodecaFractal.sc','w');
COLORMAP=[1 1 1;1 0.75 0;0.6 0.8 0.64;0.2 0.65 0.87];
drawFractal(vert,face,1/(phi)^2,2)


%count
fclose(scfile);
axis equal
view(3)

function drawFractal(vert,face,sca,n)
global scfile count COLORMAP
if n>0
    vnew=vert*1;
    patch('vertices',vnew/sca*(1-0.0025*n),'faces',face,'facecolor',COLORMAP(n,:),'facealpha',0.5);
    shader2ScFile('diffuse',['shader' num2str(count)],COLORMAP(n,:),scfile);
    mesh2ScFile(vnew/sca*(1-0.01*n),face-1,['shader' num2str(count)],['mesh' num2str(count)],scfile);
    count=count+1;
    for k=1:length(vert)
        vnew(:,1)=vert(:,1)+1.618*vert(k,1);
        vnew(:,2)=vert(:,2)+1.618*vert(k,2);
        vnew(:,3)=vert(:,3)+1.618*vert(k,3);
        if n==1
            patch('vertices',vnew,'faces',face,'facecolor',COLORMAP(end,:));
            shader2ScFile('diffuse',['shader' num2str(count)],COLORMAP(end,:),scfile);
            mesh2ScFile(vnew,face-1,['shader' num2str(count)],['mesh' num2str(count)],scfile);
            count=count+1;
        end
        drawFractal(vnew*sca,face,sca,n-1);
    end
    
    
end

return