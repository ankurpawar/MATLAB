function [x,y,z,r] = SphericalHarmonics1(shDegree,shOrder,shType,meshSize)
% [x,y,z,r] = SphericalHarmonics1(shDegree,shOrder,shType,meshSize)
% [x,y,z,r] = SphericalHarmonics1
% Function calculates spherical harmonics of given order ,degree and gives
% surface data.
%
% Input
% shDegree:degree of spherical harmonics a positive integer.
% shOrder:order of spherical harmonics a positive integer greater less than
%         equal to shDegree.
% shType:a string, it can be 'imag','real','abs'. This decides the which
%        part spherical harmonics will be returned. The basic formula of
%        spherical harmonics results in a complex value. This function
%        calculates all three parts i.e. real, imaginary and absolute part
%        but returns only one part that is specified by this string.
% meshSize:number of points in the mesh, value between 75 to 150 give good
%          output. Higher value takes more memory and time for calculation
%
% Output
% x:x component of spherical harmonics. An array of size 
%   meshSize X meshSize 
% y:y component of spherical harmonics. An array of size 
%   meshSize X meshSize 
% z:z component of spherical harmonics. An array of size 
%   meshSize X meshSize 
% r:component of spherical harmonics decided by the type string.
%   An array of size  meshSize X meshSize 
% If the function is called without any input arguments then default values
% are taken as shDegree = 3, shOrder = 2, shType = 'imag', meshSize = 100
if nargin == 0
    shDegree = 3;
    shOrder = 2;
    shType = 'imag';
    meshSize = 100;
end

if shDegree < 0 || shOrder < 0
    error('dgree and order cannot be negative');
end

if shOrder > shDegree
    error('order cannot be greater than degree');
end

if ~strcmp(shType,'imag') && ~strcmp(shType,'real') && ...
        ~strcmp(shType,'abs')
    error('type can be one of ''imag'', ''real'', ''abs''');
end

if meshSize > 150
    warning('meshSize > 150, try to keep it 150');
end

% azimuth
PHI_MIN = 0;
PHI_MAX = 2*pi;
% elevation
THETA_MIN = 0;
THETA_MAX = pi;

p = linspace(PHI_MIN, PHI_MAX, meshSize);
t = linspace(THETA_MIN, THETA_MAX, meshSize);
[phi, theta] = meshgrid(p,t);

% theta is same for all the columns so calculate legendre polynomial only
% for first column.
S = legendre(shDegree,cos(theta(:,1)));
SH = repmat(S(shOrder+1,:)',1,size(phi,2));
SH = SH.*(cos(shOrder*phi)+i*sin(shOrder*phi));

% keep value in the range of -1 to 1
SHmax = max(max(abs(SH)));

switch shType
    case 'real'
        r = abs(real(SH/SHmax));
    case 'imag'
        r = abs(imag(SH/SHmax));
    case 'abs'
        r = abs(SH/SHmax);
end

% spherical to cartesian
x = r.*sin(theta).*cos(phi);
y = r.*sin(theta).*sin(phi);
z = r.*cos(theta);
end