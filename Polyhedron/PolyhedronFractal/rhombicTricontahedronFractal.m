function rhombicTricontahedronFractal
phi=(1+sqrt(5))/2; %golden ratio
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
   %sprintf('%g %g %g\n',vert)   
   whos vert
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

getEdges(face)

drawFractal(vert,face,1/(2+phi),1);
axis equal
view(3)   

function drawFractal(vert,face,sca,n)

if n>0
   v=vert*sca; 
   vnew=v;
   offset=[0 0 0];
   
   for k=1:length(vert)
       [th,phi,r]=cart2sph(v(k,1),v(k,2),v(k,3));
       [offset(1) offset(2) offset(3)]=sph2cart(th,phi,r*1.6180*2);
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
