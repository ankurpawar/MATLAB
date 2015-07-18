function dodecahedronFractal2sc
global COUNT FILEID
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

scfile=fopen('dodecaFractal.sc','w');   
COUNT=0;   
FILEID=scfile;
sca=1/(2+phi);
level=2;
trans=[0 0 0];
drawFractal(vert,face,sca,trans,level);
axis equal
view(3)   
fclose(scfile);

sld2Hndl=uicontrol( ...
         'Style','pushbutton', ...
         'Position',[10 10 40 20], ...
         'Callback',{@camera2Sc,17,1});

function drawFractal(vert,face,sca,trans,n)
global COUNT FILEID
if n>0
   vert(:,1)=vert(:,1)+trans(1);
   vert(:,2)=vert(:,2)+trans(2);
   vert(:,3)=vert(:,3)+trans(3);
   vnew=vert*sca; 

   for k=1:length(vert)
       vnew(:,1)=vert(:,1)+[vert(k,1)]*1.618;
       vnew(:,2)=vert(:,2)+[vert(k,2)]*1.618;
       vnew(:,3)=vert(:,3)+[vert(k,3)]*1.618;
       if n==1
           %patch('vertices',vnew,'faces',face,'facecolor',rand(1,3));
           colors=getColor(vert(k,:));
           patch('vertices',vnew,'faces',face,'facecolor','r');
           writeInstance2(FILEID,[0 0 0],1.618*[vert(k,:)],sca/sca,COUNT,colors);
           COUNT=COUNT+1;
       end
       drawFractal(vert,face,sca*sca,[vert(k,:)]*1.618,n-1);
       
   end   
end
 
return

function colors=getColor(point)

[th,phi,r]=cart2sph(point(1),point(2),point(3));
colors=hsv2rgb([(th+pi)/(2*pi) 1 1]);

return