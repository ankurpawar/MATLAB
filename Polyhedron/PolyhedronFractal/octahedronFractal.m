function octahedronFractal

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
level=4;%level of recursion

drawFractal(vert,face,sca,level)
axis off equal
set(gcf,'color',[1 1 1])
callbackStr='export_fig(''png'',''octa'')'; 
sld2Hndl=uicontrol( ...
          'Style','pushbutton', ...
          'Position',[10 10 40 20], ...
          'Callback',callbackStr);


view(3)   

function drawFractal(vert,face,sca,n)

if n>0
   vnew=vert;
   for k=1:length(vert)
       vnew(:,1)=vert(:,1)+vert(k,1);
       vnew(:,2)=vert(:,2)+vert(k,2);
       vnew(:,3)=vert(:,3)+vert(k,3);
       if n==1
          h=patch('vertices',vnew,'faces',face,'facecolor','flat');
          set(h,'facevertexcdata',pink(length(vert)));
       end
       drawFractal(vnew,face,sca,n-1);
   end
end
 
return