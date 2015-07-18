function smallStellatedDodecaFractal
phi=(1+sqrt(5))/2; %golden ratio
load smallStellatedDodeca

vert=stellatedVert;
face=stellatedFace;

%patch('faces',face,'vertices',vert,'facecolor','y')

colors=summer(length(face));
%h=patch('faces',face,'vertices',vert);
%set(h,'facecolor','flat','facevertexcdata',colors);
K = convhulln(vert);
offPoints=vert(K,:);

drawFractal(vert,face,offPoints,1/phi,2)
axis equal
view(3)

function drawFractal(vert,face,offPoints,sca,n)

if n>0
    off2=offPoints*sca;
    v = vert*sca;
    vnew=v;
    
    for k=1:length(offPoints)
        vnew(:,1)=v(:,1)+offPoints(k,1);
        vnew(:,2)=v(:,2)+offPoints(k,2);
        vnew(:,3)=v(:,3)+offPoints(k,3);
        if n==1
            patch('vertices',vnew,'faces',face,'facecolor','r');
        end
        drawFractal(vnew,face,off2,sca,n-1);
    end
    
end
return