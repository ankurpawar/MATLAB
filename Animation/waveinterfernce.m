%waveinterfernce
%Taken from website of Paul Nylander
%http://nylander.wordpress.com/category/physics/waves/
%This interference pattern is the superposition of two wave sources, such
%as light passing through two narrow slits.
total = 150; %size of grid
a = linspace(0,16,total);
b = linspace(-8,8,total); 
[x,y] = meshgrid(a,b);
%M = moviein(150);
cmap = colormap(gray);
t = 7;
U = 2*pi*sqrt(x.^2 + (y - 3).^2);
V = 2*pi*sqrt(x.^2 + (y + 3).^2);
while t >= 0
    zval = sin(U + 2*pi*t) + sin(V + 2*pi*t);
    h = pcolor(zval);
    shading interp
    axis square off
    drawnow
    %M(:,n)=getframe;
    t = t-0.1;
end

%movie2avi(M,'interfere.avi','quality',100,'compression','Indeo5')