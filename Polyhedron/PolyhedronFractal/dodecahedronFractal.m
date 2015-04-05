function dodecahedronFractal

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


drawFractal(vert,face,1/(2+phi),2)

axis equal
view(3)

function drawFractal(vert,face,sca,n)

if n>0
    vnew=vert;
    offset=[0 0 0];
    for k=1:length(vert)
        [th,phi,r]=cart2sph(vert(k,1),vert(k,2),vert(k,3));
        %[offset(1) offset(2) offset(3)]=sph2cart(th,phi,r*1.6180^2);
        [offset(1) offset(2) offset(3)]=sph2cart(th,phi,r*1.6180^2);
        vnew(:,1)=vert(:,1)+offset(1);
        vnew(:,2)=vert(:,2)+offset(2);
        vnew(:,3)=vert(:,3)+offset(3);
        if n==1
            h=patch('vertices',vnew,'faces',face,'facecolor','flat');
            set(h,'facevertexcdata',pink(length(vnew)));
        end
        drawFractal(vnew*sca,face,sca,n-1);
    end
    
end

return