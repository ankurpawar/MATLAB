%harmonogram
t=0:0.01:20*pi;

%f1=1 ; f2=2 ; f3=3; f4=4;
%p1=0.2*pi ; p2=0.1*pi ; p3=0.1*pi; p4=0.2*pi;
%d1=0.1 ; d2=0.1 ; d3=0.1; d4=0.1;
choice=1;
switch(choice)
    case 1
        f1=3.001; f2=2; f3=3; f4=2;
        d1=0.004; d2=0.0065; d3=0.008 ;d4=0.019;
        p1=0; p2=0 ;p3=pi/2; p4=3*pi/2;
    case 2
        f1=10; f2=3; f3=1; f4=2 ;
        d1=0.039 ;d2=0.006 ;d3=0; d4=0.0045 ;
        p1=0 ;p2=0 ;p3=pi/2; p4=0;
    case 3
        f1=4.0005; f2=5.0; f3=2.009; f4=3.00 ;
        d1=0.085 ;d2=0; d3=0.065; d4=0 ;
        p1=0; p2=7*pi/16; p3=0; p4=0;
    case 4
        f1=2; f2=6; f3=1.002; f4=3 ;
        d1=0.02; d2=0.0315; d3=0.02; d4=0.02 ;
        p1=pi/16; p2=3*pi/2; p3=13*pi/16; p4=pi;
    case 5
        f1=1*rand; f2=1*rand; f3=2*rand; f4=2*rand;
        d1=rand/10; d2=rand/10; d3=rand/10; d4=rand/10 ;
        p1=rand*pi; p2=rand*pi; p3=rand*pi; p4=rand*pi;
        %case 6
        %f1=1.5; f2=2.5; f3=2.5; f4=1.5 ;
        %d=0.0030    0.0019    0.0019    0.0068;
        %p=0.9512    1.7017    0.4740    2.1925;
end
%x(t) = Ax(t) sin(wx t + px) + As(t) sin(ws t + ps)
%y(t) = Ay(t) sin(wy t + py)
x=exp(-d1*t).*sin(t.*f1+p1) + exp(-d2*t).*sin(t*f2+p2);
y=exp(-d3*t).*sin(t.*f3+p3) + exp(-d4*t).*sin(t*f4+p4);

%x=[nan x];
%y=[nan y];
%patch(x,y,sqrt(x.^2+y.^2), 'edgecolor','interp','facecolor','none');
%axis square off,colormap hsv(128)
plot(x,y,'linewidth',2,'color',[0.3 0.5 0.8]);
%axis square off

[f1 f2 f3 f4 ];
[d1 d2 d3 d4 ];
[p1 p2 p3 p4 ];
