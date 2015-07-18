%knots

%t=pi*(-10:0.01:10);
choice=2;
switch choice
    case 1
        p=2;q=3 ;t=pi*(0:0.01:0.641395*p*pi);
        t=linspace(0,4*pi,200);
    case 2
        p=2;q=7 ;t=pi*(0:0.01:0.63825*p*pi);
        t=linspace(0,4*pi,200);
    case 3
        p=10;q=2 ;t=pi*(0:0.01:0.63825*p*pi);
        t=linspace(0,10*pi,200);
end
%t=pi*(0:0.01:0.641395*p*pi);
%t=pi*(0:0.01:0.65*p*pi);
%t=linspace(-1*pi,2*pi,200);
x=(2+cos(q/p*t)).*cos(t);
y=(2+cos(q/p*t)).*sin(t);
z=sin(q/p*t);

r=0.05*t.*sin(2*t);%.^(-1/2);
%ezpolar('0.2*t^(-1/2)')
%x=50*r.*cos(t);
%y=50*r.*sin(t);
%k=1;
%axis([-1 1 -1 1])
%z=ones(1,length(t));%streamtube streamribbon;

verts = {[x' y' z']};
twistangle = {t/1000};
daspect([1 1 1])
h=streamtube(verts,0.5);
[sx]=get(h,'xdata');
[sy]=get(h,'ydata');
[sz]=get(h,'zdata');
% get(h)
% [sx,sy,sz]=tubeplot([x;y;z],0.5,30);
%mesh(sx,sy,sz)
axis equal
%surf2OBJ(sx,sy,sz,'knot2');

