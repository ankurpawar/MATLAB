function mtx = showcplxm(X,Y,V,exponent)
%function mtx=showcplx(X,Y,Z,adjustment)
%
%see showcplx
%This version returns matrix suitable for imwrite
%
%Martin Pergler (c) 1999. Ver 0.1.3
%
if (nargin<4)
   exponent=1;
end

angles=angle(V)/(2*pi)+0.5;

%Scale radii so 0 is 1, inf becomes -1, 1 becomes 0
l=1-(4*atan(abs(V).^abs(exponent))/pi);

%so far is pure atan model, now remap by powers so neg exponent changes w/b
l=sign(exponent).*sign(l).*abs(l);

%Compute saturation and value (l is luminescence in HLS model, from -1 to 1)
%s=min(1,1-l);
%v=min(1,1+l);

s = min(1,(1-l));
v = min(1,(1+l));



mtx=hsv2rgb(reshape([angles,s,v],[size(angles),3]));


