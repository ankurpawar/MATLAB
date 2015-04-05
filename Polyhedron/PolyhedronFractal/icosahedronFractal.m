function icosahedronFractal

phi=(1+sqrt(5))/2; %golden ratio
vert=[0 1 phi;
      0 1 -phi;
      0 -1 phi;
      0 -1 -phi;
      1 phi 0;
      1 -phi 0;
      -1 phi 0;
      -1 -phi 0;
       phi 0 1;
       phi 0 -1;
      -phi 0 1;
      -phi 0 -1];
  
face =[1     5     9
      6     3     9
      1     3    11
      3     1     9
      7     2     5
      7     1    11
      1     7     5
     10     6     9
      5    10     9
      2    10     5 
     10     4     6
      4    10     2
      4     8     6
      3     8    11
      8     3     6
      7    12     2
     12     4     2
     12     7    11
      8    12    11
     12     8     4];

   
colors=summer(length(face));
%h=patch('faces',face,'vertices',vert);
%set(h,'facecolor','flat','facevertexcdata',colors);
drawFractal(vert,face,1,2)
axis equal
view(3)   
lighting phong
camlight headlight
axis off 
set(gcf,'color',[1 1 1])

function drawFractal(vert,face,sca,n)

if n>0
   v=vert*sca; 
   vnew=v;
   offset=[0 0 0];
   for k=1:length(vert)
       [th,phi,r]=cart2sph(v(k,1),v(k,2),v(k,3));
       %[offset(1) offset(2) offset(3)]=sph2cart(th,phi,r*1.6180);
       [offset(1) offset(2) offset(3)]=sph2cart(th,phi,r*1.6180*0.618);
       vnew(:,1)=v(:,1)+offset(1);
       vnew(:,2)=v(:,2)+offset(2);
       vnew(:,3)=v(:,3)+offset(3);
       if n==1
       %patch('vertices',vnew,'faces',face,'facecolor',rand(1,3));
       patch('vertices',vnew,'faces',face,'facecolor','r');
       
       end
       drawFractal(vnew,face,sca,n-1);
   end
   %drawFractal(v,face,sca,n-1);
   %drawFractal(v,face,sca,n-1);
end
 
return