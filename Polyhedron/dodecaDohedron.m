function dodecaDohedron
phi=(1+sqrt(5))/2;
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

set(gcf,'renderer','zbuffer');   
%patch('vertices',vert,'faces',faces,'facecolor','c');

colors=hsv(length(faces));
for n=1:length(faces)
    v=vert(faces(n,:),:);
    centroid=mean(v);
    [newV,centroid]=flatVert(v,centroid);
    newV=(phi^4)*newV;
    [v]=placeVert(newV,centroid);
    patch('vertices',v,'faces',[1 2 3 4 5],'facecolor',colors(n,:));
end
%phi*4.25

axis equal
view(3)

function [newV]=placeVert(vert,centroid);
      [cth,cphi,cr]=cart2sph(centroid(1),centroid(2),centroid(3));
      newV=vert;

      [newV(:,3),newV(:,1)]=transform2d(newV(:,3),newV(:,1),0,0,-pi/2-cphi,0,0);
      [newV(:,1),newV(:,2)]=transform2d(newV(:,1),newV(:,2),0,0,cth,0,0);
      
      newV(:,1)=newV(:,1)+centroid(1); 
      newV(:,2)=newV(:,2)+centroid(2); 
      newV(:,3)=newV(:,3)+centroid(3);
return

function [newV,centroid]=flatVert(vert,centroid);
      [cth,cphi,cr]=cart2sph(centroid(1),centroid(2),centroid(3));
      newV=vert;
      newV(:,1)=vert(:,1)-centroid(1); 
      newV(:,2)=vert(:,2)-centroid(2); 
      newV(:,3)=vert(:,3)-centroid(3); 
      if cr==0
      
      else
        [newV(:,1),newV(:,2)]=transform2d(newV(:,1),newV(:,2),0,0,-cth,0,0);
        [newV(:,3),newV(:,1)]=transform2d(newV(:,3),newV(:,1),0,0,pi/2+cphi,0,0);
      end
return

