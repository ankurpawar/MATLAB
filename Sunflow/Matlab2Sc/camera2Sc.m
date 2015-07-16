function camera2Sc(src,eventdata,rad,applyRad)
%camera2Sc(src,eventdata,rad,applyRad)
cpos=get(gca,'CameraPosition');
ctar=get(gca,'CameraTarget');
cupv=get(gca,'CameraUpVector');

if applyRad
[t,p,r]=cart2sph(cpos(1),cpos(2),cpos(3));
[cpos(1),cpos(2),cpos(3)]=sph2cart(t,p,rad);
end

camData=cell(3,1);
shaderData{1,1}=['eye  ' num2str(cpos,'%g ')];
shaderData{2,1}=['target     ' num2str(ctar,'%g ')];
shaderData{3,1}=['up    ' num2str(cupv,'%g ')];
                           
[m,n]=size(shaderData);

for c=1:m                  
    fprintf('%s',shaderData{c,1});
    fprintf('\n');
end