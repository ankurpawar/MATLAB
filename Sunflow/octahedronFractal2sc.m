function octahedronFractal2sc

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

sca=1/2;%scale factor
level=3;%level of recursion
trans=[0 0 0];%translation coordinates
drawFractal(vert,face,sca,trans,level)
axis equal
view(3)

function drawFractal(vert,face,sca,trans,n)

if n>0
    vert(:,1)=vert(:,1)+trans(1);
    vert(:,2)=vert(:,2)+trans(2);
    vert(:,3)=vert(:,3)+trans(3);
    vnew=vert*sca;
    for k=1:length(vert)
        vnew(:,1)=vert(:,1)+vert(k,1);
        vnew(:,2)=vert(:,2)+vert(k,2);
        vnew(:,3)=vert(:,3)+vert(k,3);
        if n==1
            patch('vertices',vnew,'faces',face,'facecolor',[0.7 0.7 0.7]);
            
        end
        drawFractal(vert,face,sca*sca,[vert(k,:)],n-1);
    end
end

return