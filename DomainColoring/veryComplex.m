%Script to test domain coloring
IMGWIDTH = 500;
IMGHEIGHT = 500;
X = linspace(-pi,pi,IMGWIDTH);
Y = linspace(-pi,pi,IMGHEIGHT);
lenx = length(X);
leny = length(Y);
Z = zeros(length(X),length(Y));
colors = zeros(length(X),length(Y),3);
col = zeros(1,3);
for n = 1:lenx
    Z(n,:) = X(:)+i*Y(n);
end
img = zeros(IMGWIDTH,IMGHEIGHT,3);

%funcz = (1-Z)./(Z+1); type = 1;

%funcz = tan(Z); type = 2;
%funcz = Z.^Z; type = 2;
%funcz = Z.^2 - 1./Z; type = 2;

funcz = (Z-1)./(Z+1); type = 3;
%funcz = Z.^2 - 1./Z; type = 3;

%funcz = Z.^Z; type = 4;
%funcz = log(Z); type = 4;
%funcz = cot(Z); type = 4;
%funcz = Z.^2 - 1./Z; type = 4;
%funcz = Z.^3 - cos(Z); type = 4;

%funcz = 1./(Z.^3+i); type = 5;
%funcz = sqrt(Z).^Z; type = 5;
%funcz = 1./(Z).^4; type = 5;
%funcz = 1./sqrt(Z).^(5+2*i); type = 5;
%funcz = (Z.^3+i-1)./(Z.^3+i+1); type = 5;
%funcz = i./sqrt(Z)./log(Z); type = 5;

%funcz = (Z.^3+i-1)./(Z.^3+i+1); type = 6;
%funcz = Z-1./Z+sin(Z); type = 6;
%funcz = (Z-1)./(Z+1); type = 6;
%funcz = atanh(Z)-1./(1-Z+sin(Z)); type = 6;

%funcz = (1./Z)+sin(Z)+log(1./Z); type = 7;
%funcz = (Z-1)./(Z+1); type = 7;

%funcz = (1./Z)+tan(Z)+log(1./Z); type = 8;
%funcz = (Z)+Z.^2+1./Z; type = 9;
%funcz = tan(Z)+(1-Z)./(Z+1); type = 10;

%funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i); type = 11;
%funcz = (1./Z)+(Z.^i)+log(1./Z); type = 11;
%funcz = Z-1./Z-tan(Z); type = 11;
%funcz = (Z-2)./(1+Z); type = 11;

%funcz = (1./Z)+(Z./i)+log(1./i); type = 12;
%funcz = tan(Z)+(1./Z.^(i/exp(1))); type = 12;

%funcz = tanh(Z); type = 13;
%funcz = tan(Z); type = 14;
%funcz = (1./Z)+(Z./i)+log(1./i); type = 14;
%funcz = log(i-i./Z.^i)+i./Z; type = 15;
%funcz = sin(Z); type = 16;

%funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i); type = 17;
%funcz = (1+Z)./(1-Z); type = 17;
%funcz = (Z-1)./(Z+1); type = 17;
%funcz = (Z.^1-1).^((1.5*i)/(0.5*pi)-0.1)./(Z.^1+1).^((1.5*i)/(0.5*pi)-0.1);type = 17;

%funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i);; type = 18;
%funcz = (1+Z)./(1-Z); type = 18;
%funcz = (Z-1)./(Z+1); type = 18;
%funcz = Z ; type = 18;
%funcz = tan(1./i*Z)+1./(Z*0.5); type = 18;

%funcz = ((1-Z.^2)./(1+Z.^2-i)).^(2*i/(pi)+1); type = 19;
%funcz = ((1-Z.^2+i)./(1+Z.^2-i)).^(1./(pi)+1); type = 19;
%funcz = (Z.^(1.5*i/pi-1)); type = 19;
%funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i); type = 19;
%funcz = log(1-1./Z)./(sinh(Z)); type = 19;
%funcz = 1./(Z).^(1*i/(0.5*pi)-1); type = 19;
%funcz = tan(Z).^(1*i/(2*pi)-1); type = 19;
%funcz = (Z-1).^((1*i)/(0.5*pi)-1)./(Z+1).^((1*i)/(0.5*pi)-1); type = 19;

%funcz = tan(i.*(Z+1))+Z; type = 20;
%funcz = Z.^sqrt(Z); type = 20;
%funcz = (1-Z)./(1+Z); type = 20;
%funcz = 1./log(Z).^sqrt(Z); type = 20;
%funcz = 1./(Z); type = 20;

%funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i); type = 21;

%funcz = tan(2*Z+i)./(3*Z-i*3-1); type = 22 ;
%funcz = 1./(Z).^(1*i/(1*pi)-1); type = 22 ;
%funcz = (Z.^2-i)./(2*Z.^2+2*i); type = 22 ;
%funcz = tan(2.^Z)+tan(1./2.^Z); type = 22 ;
%funcz = (tan(Z-1).*(Z+1))./(tanh(Z+i)./(Z-i)); type = 22 ;
%funcz = -i./atan(Z); type = 22 ;

%funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i); type = 23;
%funcz = log(Z).^asin(Z); type = 23;
%funcz = (Z./(i+Z))-(1/pi); type = 23;
%funcz = (Z-1)./(Z+1); type = 23;
%funcz = tan(Z)-(1*i/(3*pi)-i); type = 23;

%funcz  = tan(Z)-(1*i/(3*pi)-1./Z); type = 24 ;
%funcz  =Z; type = 24 ;
%funcz  =(1-Z)./(Z+1); type = 24 ;
%funcz  =(Z-1)./(Z+1); type = 24 ;
%funcz  =(Z); type = 24 ;

%funcz = (Z.^2-1).*(Z-2*i).^2./(Z.^2+2+2*i); type = 25;
%funcz = (1+Z)./(1-Z); type = 25;
%funcz = (Z-1)./(Z+1); type = 25;
%funcz = Z; type = 25;

%funcz = Z; type = 26;
%funcz = 1./(Z); type = 26;
%funcz = 1./(cos(Z)-sinh(Z)); type = 26;
%funcz = Z./sqrt(Z)-Z./log(Z); type = 26;
%funcz = tan(Z+i)+((Z+i)./(Z-i)); type = 26;

%funcz = atan((1-Z)./(1+Z)); type = 27;
%funcz = (Z).^(i/(2*pi)-1); type = 27;
%funcz = 1./(cos(Z)-sinh(Z)); type = 27;
%funcz = sqrt(Z)./log(Z); type = 27;

%funcz = (1+Z)./(1-Z); type = 28;
%funcz = (i.*Z)-i./Z; type = 29;
%funcz = sin(pi+Z)+i; type = 30;

[img(:,:,1), img(:,:,2), img(:,:,3)] = domainColoring(funcz, type);

%convert HSV to RGB 
rgb=hsv2rgb(img);
imshow(rgb);
%imwrite(rgb,'domainColor40.png','png','Comment','sin(pi+Z)+i');