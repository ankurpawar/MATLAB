function img = showcplx1(X,Y,V)

angles=angle(V)/(2*pi)+0.5;

%Scale radii so 0 is 0, inf becomes 1
%radiiscaled=2*atan(abs(V))/pi;
radiiscaled=(4*atan(abs(V))/pi)-1;


%Map angles to hue, saturation to 0=fully, 1=notatall
hsvmtx=reshape([angles,1-radiiscaled,ones(size(angles))],[size(angles),3]);

%kluge: draw as image, set axes to min and max
%THIS WILL ONLY WORK FOR meshgrid generated X,Y
img=imagesc([min(X),max(X)],[min(Y),max(Y)],hsv2rgb(hsvmtx));
set(gca,'YDir','normal');

%img=pcolor(X,Y,angle(V));
%set(img,'EdgeColor','none');
%colormap(hsv(256));
%shading('interp');

