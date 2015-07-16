function shader2ScFile(varargin)
%varargin sequence for diffuse shader 1.type,2.shader name,3.diff parameters,4.file ID
%                  for mirror shader 1.type,2.shader name,3.refl parameters,4.file ID
%                  for diffuseTexture shader 1.type,2.shader name,3.texture image path parameters,4.file ID
%                  for diffuseTexture shader 1.type,2.shader name,3.texture file,4.refl,5.file ID
length(varargin);
shaderType=varargin{1};


switch shaderType
    case 'diffuse'
        shaderData=cell(5,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type diffuse';
        shaderData{4,1}=['   diff  { "sRGB nonlinear" ' num2str(varargin{3},'%6.4f ') ' }'];
        shaderData{5,1}='}';
        ScFile=varargin{4};
    case 'diffuse_texture'
        shaderData=cell(5,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type diffuse';
        shaderData{4,1}=['   texture "' varargin{3} '"'];
        shaderData{5,1}='}';
        ScFile=varargin{4};
    case 'mirror'
        shaderData=cell(5,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type mirror';
        shaderData{4,1}=['   refl { "sRGB nonlinear" ' num2str(varargin{3},'%6.4f ') ' } '];
        shaderData{5,1}='}';
        ScFile=varargin{4};
    case 'shiny'
        shaderData=cell(6,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type shiny';
        shaderData{4,1}=['   diff { "sRGB nonlinear" ' num2str(varargin{3}) ' }'];
        shaderData{5,1}=['   refl ' num2str(varargin{4},'%6.4f ')];
        shaderData{6,1}='}';
        ScFile=varargin{5};
    case 'shiny_texture'
        shaderData=cell(6,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type shiny';
        shaderData{4,1}=['   texture "text\text' num2str(varargin{3}) '.png"'];
        shaderData{5,1}=['   refl ' num2str(varargin{4},'%6.4f ')];
        shaderData{6,1}='}';
        ScFile=varargin{5};
    case 'glass'
        shaderData=cell(8,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type glass';
        shaderData{4,1}=['   eta ' num2str(varargin{3})];
        shaderData{5,1}=['   color { "sRGB nonlinear" ' num2str(varargin{4},'%6.4f ') ' }'];
        shaderData{6,1}='   absorbtion.distance 5.0';
        shaderData{7,1}='   absorbtion.color { "sRGB nonlinear" 1.0 1.0 1.0 }';
        shaderData{8,1}='}';
        ScFile=varargin{5};
    case 'amb-occ'
        shaderData=cell(8,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type amb-occ';
        shaderData{4,1}=['   bright { "sRGB nonlinear" ' num2str(varargin{3},'%6.4f ') ' }'];
        shaderData{5,1}=['   dark { "sRGB nonlinear" ' num2str(varargin{4},'%6.4f ') ' }'];
        shaderData{6,1}='   samples 16';
        shaderData{7,1}='   dist 1.0';
        shaderData{8,1}='}';
        ScFile=varargin{5};
    case 'phong'
        shaderData=cell(8,1);
        shaderData{1,1}='shader {';
        shaderData{2,1}=['   name ' varargin{2}];
        shaderData{3,1}='   type phong';
        shaderData{4,1}=['   diff { "sRGB nonlinear" ' num2str(varargin{3},'%6.4f ') ' }'];
        shaderData{5,1}=['   spec { "sRGB nonlinear" ' num2str(varargin{4},'%6.4f ') ' } 50 '];
        shaderData{6,1}='   samples 4';
        shaderData{7,1}='}';
        ScFile=varargin{5};
        
        
end
[m,n]=size(shaderData);

for count=1:m
    fprintf(ScFile,'%s\n',shaderData{count,1});
end

fprintf(ScFile,'\n');