function tetrahedronFractal

vert=[+1 +1 +1
      -1 -1 +1
      -1 +1 -1
      +1 -1 -1];
face=[1 2 3
      2 3 4
      1 3 4
      1 2 4];
  
sca=1/2;%scale factor
level=4;%level of recursion
drawFractal(vert,face,sca,level)
axis off equal
set(gcf,'color',[1 1 1])
callbackStr='export_fig(''png'',''tetra'')'; 
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
          set(h,'facevertexcdata',summer(length(vert)));
       end
       drawFractal(vnew*sca,face,sca,n-1);
   end
   
end

return