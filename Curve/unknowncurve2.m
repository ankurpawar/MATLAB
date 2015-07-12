%Unknown curve
%Select any one number from list to see that space curve
liststr={'1';'2';'3';'4';'5';'6';'7';'8';
    '9';'10';'11';'12';'13';'14';
    '15'};
[s,v] = listdlg('PromptString','Select any one',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    switch(s)
        case 1
            t=0:0.01:2*pi;
            plot3(1+cos(t),sin(t),2*sin(t/2));
            title('Vivani curve,[0 2\pi]');
        case 2
            t=-2*pi:0.01:2*pi;
            plot3(2.*cos(t).^4,4.*sin(t),cos(t./2));
            title('2cos(t)^4 , 4sin(t), cos(t/2) ,[-2\pi 2\pi]')
        case 3
            t=-2*pi:0.01:2*pi;
            plot3(cos(2*pi*t)./sqrt(1+4*t.^2),sin(2*pi*t)./sqrt(1+4*t.^2),-2*t./sqrt(1+t.^2));
            title('spherical spiral,cos(2\pit)/sqrt(1+4*t^2),sin(2\pit)/sqrt(1+4t^2),-2*t/sqrt(1+t^2),[-2\pi 2\pi]');
        case 4
            t=-pi:0.01:pi;
            plot3(cos(t),sin(1*t),sin(3*t));
            title('cos(t),sin(1*t),sin(3*t),[-pi pi]');
        case 5
            t=-1.5*pi:0.01:1.5*pi;
            plot3(cos(2*pi*t),sin(2*pi*t),cos(2*pi*t).*sin(pi*t));
            title('cos(2\pit),sin(2\pit),cos(2\pit)sin(\pit),[-1.5\pi 1.5\pi]');
        case 6
            t=-pi:0.01:pi;
            plot3(sin(2*pi*t),cos(2*pi*t),sin(2*pi*t).*sin(pi*t));
            title('sin(2\pit),cos(2\pit),sin(2\pit)sin(\pit),[-\pi \pi]');
        case 7
            t=-pi:0.01:pi;
            plot3(sin(2*pi*t),t,sin(pi*t));
            title('sin(2\pit),t,sin(\pit),[-\pi \pi]');
        case 8
            t=-2*pi:0.01:2*pi;
            plot3(t.*cos(2*pi*t),t.^2,t.^2.*sin(2*pi*t));
            title('tcos(2\pit),t^2,t^2sin(2\pit),[-2\pi 2\pi]');
        case 9
            t=-pi:0.01:pi;
            plot3(t.^2.*cos(2*pi*t),t.^4,t.^2.*sin(2*pi*t));
            title('t^2cos(2\pit),t^4,t^2sin(2\pit),[-\pi 1\pi]');
        case 10
            t=-2*pi:0.01:2*pi;
            plot3(t.*cos(2*pi*t),t.^3.*cos(2*pi*t),t.^2.*sin(2*pi*t));
            title('tcos(2\pit),t^3cos(2\pi*t),t^2sin(2\pi*t),[-2\pi 2\pi]');
        case 11
            t=-2*pi:0.01:2*pi;
            plot3(t.*cos(2*pi*t),t.^2,t.^2.*cos(2*pi*t));
            title('tcos(2\pit),tcos(2\pit),t^3cos(2\pit),[-2\pi 2\pi]');
        case 12
            t=-3*pi:0.01:3*pi;
            plot3(0.01*t.^2.*sin(2*pi*t),0.01*t.^2.*cos(2*pi*t),0.01*t.^3.*sin(2*pi*t));
            title('0.01t^2sin(2\pit),0.01t^2cos(2\pit),0.01t^3sin(2\pit),[-3\pi 3\pi]');
        case 13
            t=-8*pi:0.01:8*pi;
            plot3(0.1*t.*(cos(t)).^2,0.1*t.*cos(t),0.1*t.^2.*(sin(t)).^3);
            title('0.1tcos(t)^2,0.1tcos(t),0.1t^2sin(t)^3,[-8\pi 8\pi]');
        case 14
            t=-8*pi:0.01:8*pi;
            plot3(0.1*t.^3.*cos(t),0.1*t.*(cos(t)).^5,0.1*t.^2.*(sin(t)).^3);
            title('0.1t^3cos(t),0.1tcos(t)^5,0.1t^2sin(t)^3,[-8\pi 8\pi]');
        case 15
            t=-2*pi:0.01:2*pi;
            plot3(cos(4*pi*t)./sqrt(2+4*t.^6),sin(4*pi*t)./sqrt(2+4*t.^6),-2*t./sqrt(2+t.^6))
            title('cos(4\pit)/sqrt(2+4t^6),sin(4\pit)/sqrt(2+4t^6),-2t/sqrt(2+t^6),[-2\pi 2\pi]');
    end
end

axis equal