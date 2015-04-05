%s=2  ;%seed
d=4.66920160910299067185320382046620  ;%seed
s=d;
s=sqrt(2)*0.0153;%0.0153;%0.7468;0.0196;0.6813;0.7095;0.6979;0.5341;0.7271
%s=sqrt(2);
s=exp(1)*0.7446;%0.0118;0.3798;0.0150;0.7266;0.7446
%golden=1.618;s=golden
%s=pi;
%eulers = 0.577215664901532860606512;
%s=log(2)*0.0153;%0.0185,0.0099,0.0153

theta=0;
phi=0;
total=15000;
curx=zeros(1,total);
cury=zeros(1,total);
dist=zeros(1,total);
xn=0;
yn=0;
for k=1:total
    theta=mod(theta+2*pi*s,2*pi);
    phi=mod(phi,2*pi)+theta;
    [x,y]=pol2cart(phi,1);
    dist(k)=sqrt((x-xn).^2+(y-yn).^2);
    xn=x+xn;
    yn=y+yn;
    curx(k)=xn;
    cury(k)=yn;
end
line(curx,cury,'linewidth',1,'color','k')
%axis equal

%patch([curx nan],[cury nan],[dist nan], 'edgecolor','flat','facecolor','none');
%colormap summer
axis equal off
set(gcf,'color',[1 1 1])
callbackStr='export_fig(''png'',''pcurl.png'',''-nocrop'',''-a4'')'; 
sld2Hndl=uicontrol( ...
         'Style','pushbutton', ...
         'Position',[10 10 40 20], ...
         'Callback',callbackStr);
