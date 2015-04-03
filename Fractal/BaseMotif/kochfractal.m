angle = [0, -2/3*pi, -2/3*pi];

l = 1;
iters=4;

for i=1:iters
    l = l/3;
    angle1 = zeros([4*length(angle),1]);
    for j=1:length(angle)
        % insert the Koch generator here
        angle1(4*j-3:4*j) = [angle(j), pi/3, -2*pi/3, pi/3];
    end
    angle = angle1;
end

x = zeros([length(angle)+1, 1]);
y = zeros([length(angle)+1, 1]);

x(1) = 0; y(1) = 0;
phi=0;
for i=1:length(angle);
    phi = phi+angle(i);
    x(i+1) = x(i) + l * cos(phi);
    y(i+1) = y(i) + l * sin(phi);
end

% plot(x,y);
% t=zeros(length(x),1);
% verts = {[10*x 10*y t]};
% twistangle = {t};
% daspect([1 1 1])
% streamribbon(verts,twistangle);
% shading interp,axis tight off,colormap cool
% camlight left,material dull
%get(h)
%set(h,'Facecolor','interp','edgecolor','interp');



%figure
h=patch(x,y,sqrt(x.^2+y.^2), 'edgecolor','interp','facecolor','none');
axis square off,colormap hsv(256)