function MaurerRose
%Maurer rose
figure
n = 2;
d = 39;
k = (0:120)/180*pi;
[x,y] = pol2cart( k*d , sin(n*d*k) );
line(x,y);
axis equal off

figure
n = 3;
d = 47; 
k = (0:180)/180*pi;
[x,y] = pol2cart( k*d , sin(n*d*k) );
line(x,y);
axis equal off

figure
n = 2;
d = 29; 
k = (0:360)/180*pi;
[x,y] = pol2cart( k*d , sin(n*d*k) );
line(x,y);
axis equal off

figure
n = 3;
d = 17; 
k = (0:180)/180*pi;
[x,y] = pol2cart( k*d , sin(n*d*k) );
line(x,y);
axis equal off
end