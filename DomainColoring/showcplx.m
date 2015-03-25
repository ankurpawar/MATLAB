function img = showcplx(X,Y,V,exponent)
%function img=showcplx(X,Y,Z,adjustment)   (adjustment is optional)
%
%Displays complex values of Z colored by hue=angle and luminescence
%depending on abs(Z). X and Y are assumed to be output of makegrid
%containg real and imag parts of the equally spaced grid, and Z
%the corresponding complex values to be plotted.
%
%In the coloring, cyan=positive real, red=neg real,
%pos imag is midway between blue and magenta, neg imag between
%green and yellow. This is the standard hexcode hue mapping of
%MATLAB's hsv color model.
%
%If adjustment=1 or is omitted, the luminescence is calculated
%from abs(Z) via a atan-type transform so that 0=white, inf=black,
%and abs(Z)=1 is pure color. If adjustment is a different positive
%number, abs(Z).^adjustment is used instead, so adjustment<1
%makes the pictue less black/white and adjustment>1 makes it more
%black/white
%
%If adjustment is negative, 0=black and inf=white and abs(adjustment)
%is used in the scaling as described above. If adjustment=0, abs(Z)
%is ignored and only hue=angle is plotted.
%
%BUGS/CONCERNS:
%Deceptive patterns may appear due to palette quantization
%Color model does not quite correspond to perception (eg. bright lines)
%Handling of infinities and NaNs needs fixing. Actual infinity is often
%white....
%
%Martin Pergler (c) 1999. Ver 0.1.2
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


    a=floor(20*angles);
    angles=a/20;

%s=sqrt(abs(V));
s=sqrt(1-l)./(1+sqrt(1+l));
%s=min(1,1-l);

    a=floor(10*s);
    s=a/10;

s = 1 -(1-s).^2; 

%angles=mod(angles,0.1);
s=s/max(max(s));

%s =min(1,1- mod(log(abs(V)),1));
v=min(1,(1+l));

    a=floor(10*v);
    v=a/10;

v = 1 -(1-v).^2; 

%v=min(1,1+l);
%v =min(1,1+ mod((log(abs(V))),1));
%Map angles to hue, saturation to 0=fully, 1=notatall
hsvmtx=reshape([angles,s,v],[size(angles),3]);

%kluge: draw as image, set axes to min and max
%THIS WILL ONLY WORK FOR meshgrid generated X,Y

image([min(X),max(X)],[min(Y),max(Y)],hsv2rgb(hsvmtx));
img=hsv2rgb(hsvmtx);
set(gca,'YDir','normal');

%img=image(hsvmtx)
%img=pcolor(X,Y,angle(V));
%set(img,'EdgeColor','none');
%colormap(hsv(256));
%shading('interp');

