function camera2Pov(src,eventdata,rad,povfile)
%whos
cpos=get(gca,'CameraPosition');
ctar=get(gca,'CameraTarget');
cupv=get(gca,'CameraUpVector');

%[t,p,r]=cart2sph(cpos(1),cpos(2),cpos(3));
%[cpos(1),cpos(2),cpos(3)]=sph2cart(t,p,rad);


camData=cell(3,1);
camData{1,1}=['location  <' num2str(cpos,'%g,') '>'];
camData{2,1}=['look_at     <' num2str(ctar,'%g,') '>'];
camData{3,1}=['sky    <' num2str(cupv,'%g,') '>'];
                           
fprintf('camera{\n')
fprintf('location <%g,%g,%g>\n',cpos);
fprintf('look_at  <%g,%g,%g>\n',ctar);
fprintf('sky  <%g,%g,%g>\n',cupv);
fprintf('angle 50\n');
fprintf('}\n');

