%newspiral3

%t  = pi-pi/4:0.501*pi:125*pi-0.5*pi; %square
% t  = pi-pi/4:0.251*pi:125*pi-0.5*pi; % hexagon
t  = pi-pi/4:0.334*pi:125*pi-0.5*pi; % pentagon
r = t;
[x,y]=pol2cart(t,r);
len_t=length(t);
colmap=hsv(len_t);
xn=0;yn=0;
for n=1:len_t
    plot([xn x(n)],[yn y(n)],'color',colmap(n,:),'linewidth',2),hold on
    xn=x(n);
    yn=y(n);
end
axis equal off
