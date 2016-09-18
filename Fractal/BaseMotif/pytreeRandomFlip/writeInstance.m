function writeInstance(scfile,rot,translate,sca,k,colors)
%writeInstance(scfile,rot,translate,sca,k,colors)
%write instance for Sunflow file
%rx 1 6 10 7 11 16
%ry  1 9  6  3 11 16
%rz  1 5  2 6 11 16
%t  1 13 6 14 11 15 16
%s 1 6 11 16
objectNum=k;

rx=rot(1);  ry=rot(2) ;  rz=rot(3);
x=translate(1);
y=translate(2);
z=translate(3);
sx=sca(1); sy=sca(2); sz=sca(3);

temp=zeros(4,4);

% transformRx=temp;
% transformRx([1 6 10 7 11 16])=[1 cos(rx) -sin(rx)  sin(rx)  cos(rx) 1];
%
% transformRy=temp;
% transformRy([1 9  6  3 11 16])=[cos(ry)  sin(ry) 1 -sin(ry)  cos(ry) 1];
%
% transformRz=temp;
% transformRz([1 5  2 6 11 16])=[cos(rz) -sin(rz) sin(rz)  cos(rz) 1 1];
%
% transformS=temp;
% transformS([1 6 11 16])=[sx sy sz 1];
%
transformT=temp;
transformT([1 13 6 14 11 15 16])=[0 x 0 y 0 z 0];

%transformMatrix=transformRx*transformRy*transformRz;
%transformMatrix=transformS*transformT;

transformMatrix=makehgtform('xrotate',rot(1),'yrotate',rot(2),'zrotate',rot(3)...
    ,'scale',sca);

transformMatrix=transformMatrix+transformT;
transformMatrixStr=num2str(reshape(transformMatrix,1,16),'%g ');

shaderData=cell(5,1);
shaderData{1,1}='shader {';
shaderData{2,1}=['   name BoxInstShader' num2str(k)];
shaderData{3,1}='   type diffuse';
shaderData{4,1}=['   diff  { "sRGB nonlinear" ' num2str(colors,'%g ') ' }'];
shaderData{5,1}='}';

[m,n]=size(shaderData);

for c=1:m
    fprintf(scfile,'%s',shaderData{c,1});
    fprintf(scfile,'\n');
end

fprintf(scfile,'\n');

instanceData=cell(6,1);
instanceData{1,1}='instance {';
instanceData{2,1}=['   name  BoxInst' num2str(k)];
instanceData{3,1}='   geometry box';
instanceData{4,1}=['   transform  col ' transformMatrixStr];
instanceData{5,1}=['   shader  BoxInstShader' num2str(k)];
instanceData{6,1}='}';

[m,n]=size(instanceData);

for c=1:m
    fprintf(scfile,'%s',instanceData{c,1});
    fprintf(scfile,'\n');
end

fprintf(scfile,'\n');
end