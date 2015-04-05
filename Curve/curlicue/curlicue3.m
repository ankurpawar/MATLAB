%% Curlicue Fractal
%MATLAB code to generate Curlicue Fractal
s=pi/2;
total=1400;
curx=zeros(1,total);
cury=zeros(1,total);
phi=0;
xn=0;
yn=0;

for k=1:total
    phi=mod(phi+2*pi*mod(7*k+41,163)*s,2*pi); 
    [x,y]=pol2cart(phi,1);
    xn=x+xn;
    yn=y+yn;
    curx(k)=xn;
    cury(k)=yn;
end

line(curx,cury,'linewidth',0.1,'color','k','linewidth',1)
axis equal off


set(gcf,'color',[1 1 1])
callbackStr='export_fig(''png'',''pcurl.png'',''-nocrop'',''-a4'')'; 
sld2Hndl=uicontrol( ...
         'Style','pushbutton', ...
         'Position',[10 10 40 20], ...
         'Callback',callbackStr);
