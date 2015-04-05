function rhombododecahedronFractal
phi=(1+sqrt(5))/2; %golden ratio
%Rhombododecahedron
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

colors=summer(length(face));
%h=patch('faces',face,'vertices',vert);
%set(h,'facecolor','flat','facevertexcdata',colors);
drawFractal(vert,face,0.5,2)
axis equal
view(3)

function drawFractal(vert,face,sca,n)

if n>0
    v=vert*sca;
    vnew=v;
    offset=[0 0 0];
    
    for k=1:length(vert)
        [th,phi,r]=cart2sph(v(k,1),v(k,2),v(k,3));
        [offset(1) offset(2) offset(3)]=sph2cart(th,phi,r*1.618*0.618*2);
        vnew(:,1)=v(:,1)+offset(1);
        vnew(:,2)=v(:,2)+offset(2);
        vnew(:,3)=v(:,3)+offset(3);
        if n==1
            %patch('vertices',vnew,'faces',face,'facecolor',rand(1,3));
            patch('vertices',vnew,'faces',face,'facecolor','r');
            %drawFractal(vnew,face,sca,n-1);
        end
        drawFractal(vnew,face,sca,n-1);
    end
    %drawFractal(v,face,sca,n-1);
    %drawFractal(v,face,sca,n-1);
end
return