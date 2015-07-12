%Unknown curve

liststr={'1';'2';'3';'4';'5';'6';'7';'8';
    '9';'10';'11';'12';'13';'14';
    '15';'16';'17';'18';'19';'20';'21';'22';
    '23';'24';'25'};
[s,v] = listdlg('PromptString','Select any one',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    str1(1) = {'$ \mathsf{Latex \hspace{1ex} Hello} $'};
    switch(s)
        case 1
            t=linspace(-2*pi,2*pi);
            hold on
            
            %title('Vivani curve');
            [sx,sy,sz]=sphere(75);
            [cx,cy,cz]=cylinder(0.5,76);
            
            surf(2*sx,2*sy,2*sz,'facecolor',[0.6 0.8 0.8],'edgecolor','none','facealpha',0.4,'edgealpha',0.4);
            surf(2*cx+1,2*cy,4*cz-2,'facecolor',[0.8 0.8 0.8],'edgecolor','none','facealpha',0.4,'edgealpha',0.4);
            plot3(1+cos(t),sin(t),2*sin(t/2),'LineWidth',2,'Color',[.6 0 0]);
            hold off
            axis on ,axis equal
            
            str1(1) = {'$ \mathsf{Viviani \hspace{1ex} Curve} $'};
            str1(2) = {'$\mathsf{x=1+cos(t)}$'};
            str1(3) = {'$\mathsf{y=sin(t)} $'};
            str1(4) = {'$\mathsf{z=2sin(\frac{t}{2})} $'};
            str1(5) = {'$\mathsf{t=[-2\pi \hspace{1ex} 2\pi]} $'};
        case 2
            t=-2*pi:0.01:2*pi;
            plot3(2.*cos(t).^4,4.*sin(t),cos(t./2));
            title('2cos(t)^4 , 4sin(t), cos(t/2) ,[-2\pi 2\pi]')
        case 3
            t=-2*pi:0.01:2*pi;
            plot3(cos(2*pi*t)./sqrt(1+4*t.^2),sin(2*pi*t)./sqrt(1+4*t.^2),-2*t./sqrt(1+t.^2),'LineWidth',2,'Color',[.6 0.5 0.9]);
            %PLOT(X,Y,'LineWidth',2,'Color',[.6 0 0])
            %title('cos(2\pit)/sqrt(1+4t^2),sin(2\pit)/sqrt(1+4t^2),-2t/sqrt(1+t^2),[-2\pi 2\pi]');
            %legend('Spherical Spiral','boxoff')
            axis off square
            
            str1(1) = {'$ \mathsf{Spherical \hspace{1ex} Helix} $'};
            str1(2) = {'$\mathsf{x=\frac{cos(2\pi t)}{\sqrt(1+4t^{2})} }$'};
            str1(3) = {'$\mathsf{y=\frac{sin(2\pi t)}{\sqrt(1+4t^{2})} } $'};
            str1(4) = {'$\mathsf{z=\frac{-2t}{\sqrt(1+t^{2})}} $'};
            str1(5) = {'$\mathsf{t=[-2\pi \hspace{1ex} 2\pi]} $'};
        case 4
            t=-1.01*pi:0.01:pi;
            x=cos(t);y=sin(t);z=sin(2*t);
            %plot3(cos(t),sin(1*t),sin(3*t));
            title('cos(t),sin(1*t),sin(2*t),[-pi pi]');
            verts = {[x' y' z']};
            daspect([1 1 2])
            h=streamtube(verts,0.4);%twistangle);
            set(h,'FaceLighting','phong','FaceColor',[0.5 0.5 0.5]...
                ,'Edgecolor','none');
            camlight headlight
            %material(rand(1,4))
            set(gcf,'color',[1 1 1])
            axis off
            view(3)
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
            plot3(t.*cos(2*pi*t),t.^2,t.^2.*sin(2*pi*t),'LineWidth',2,'Color',[.6 0.6 0.5]);
            axis off
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
            plot3(0.01*t.^2.*sin(2*pi*t),0.01*t.^2.*cos(2*pi*t),0.01*t.^3.*sin(2*pi*t),'LineWidth',2,'Color',[.2 0.6 0.5]);
            title('0.01t^2sin(2\pit),0.01t^2cos(2\pit),0.01t^3sin(2\pit),[-3\pi 3\pi]');
            axis off
        case 13
            t=-8*pi:0.01:8*pi;
            plot3(0.1*t.*(cos(t)).^2,0.1*t.*cos(t),0.1*t.^2.*(sin(t)).^3);
            title('0.1tcos(t)^2,0.1tcos(t),0.1t^2sin(t)^3,[-8\pi 8\pi]');
        case 14
            t=-8*pi:0.01:8*pi;
            plot3(0.1*t.^3.*cos(t),0.1*t.*(cos(t)).^5,0.1*t.^2.*(sin(t)).^3);
            title('0.1t^3cos(t),0.1tcos(t)^5,0.1t^2sin(t)^3,[-8\pi 8\pi]');
        case 15
            %modified helix
            t=-2*pi:0.01:2*pi;
            plot3(cos(4*pi*t)./sqrt(2+4*t.^6),sin(4*pi*t)./sqrt(2+4*t.^6),t./sqrt(2+t.^6),'LineWidth',2,'Color',[.7 0.6 0.5])
            %title('cos(4\pit)/sqrt(2+4t^6),sin(4\pit)/sqrt(2+4t^6),-2t/sqrt(2+t^6),[-2\pi 2\pi]');
            axis off
            
            str1(1) = {'$ \mathsf{Modified \hspace{1ex} Helix} $'};
            str1(2) = {'$\mathsf{x=\frac{cos(4\pi t)}{\sqrt(2+4t^{6})} }$'};
            str1(3) = {'$\mathsf{y=\frac{sin(4\pi t)}{\sqrt(2+4t^{6})} } $'};
            str1(4) = {'$\mathsf{z=\frac{t}{\sqrt(2+t^{6})}} $'};
            str1(5) = {'$\mathsf{t=[-2\pi \hspace{1ex} 2\pi]} $'};
        case 16
            %Chrysanthemum
            u=linspace(0,21*pi,5000);
            r=5*(1+sin(11*u/5))-4*sin(17*u/3).^4.*sin(2*cos(3*u)-28*u).^8;
            x=r.*cos(u);
            y=r.*sin(u);
            z=(r/20+0.2).*sin(r*2*pi/7);
            %plot3(x,y,z,'LineWidth',1,'Color',[.5 0.2 0.5]);
            
            verts = {[x' y' z']};
            h=streamtube(verts,0.15);
            shading interp,colormap(makeColorMap([0.6 0.45 0.8],[0.74 0.85 0.54],[0.85 0.5 0.76],256))
            axis off equal,view(3)
            
            %set(gcf,'color',[1 1 1]);
            %set(gca,'position',[0 0 1.0 1.0])
            %set(gcf,'position',[0 0 800 800])
            sld2Hndl=uicontrol( ...
                'Style','pushbutton', ...
                'Position',[10 10 40 20], ...
                'Callback','hello');
            %export_fig png Chrysanthemum
        case 17
            t=0:0.01:2*pi;
            r=sin(2.^t)-1.7;
            x=r.*cos(t);y=r.*sin(t);
            plot(x,y,'LineWidth',2,'Color',[.8 0.6 0.7]);
            axis off square
        case 18
            %littus spiral
            t=linspace(0.1,14*pi,500);
            r=0.2./sqrt(t);
            x=r.*cos(t);y=r.*sin(t);
            %z=ones(size(t));
            plot(x,y);%daspect([1 1 1])
            str1(1) = {'$ \mathsf{Littus \hspace{1ex} Spiral} $'};
            str1(2) = {'$\mathsf{r(\theta)=\frac{0.2}{\sqrt{\theta}} }$'};
            str1(3) = {'$\mathsf{\theta=[0.1 \hspace{1ex} 4\pi]} $'};
        case 19
            h=ezplot('abs(x).^(1/2)+abs(y).^(2)-1',[-1 1],[-1 1]);
            axis([-1.5 1.5 -1.5 1.5]),daspect([1 1 1])
            set(h,'linewidth',2,'color',[0.4 0.3 0.7])
        case 20
            h=ezplot('abs(x).^(-2)-abs(y).^(1)-1',[-1 1],[-1 1]);
            axis([-1.5 1.5 -1.5 1.5]),daspect([1 1 1])
            set(h,'linewidth',2,'color',[0.4 0.3 0.7])
        case 21
            %fermats  spiral
            t1=linspace(-15*pi,0.1,1000);
            r1=sqrt(t1);
            x1=-r1.*cos(t1);
            y1=r1.*sin(t1);
            
            t2=linspace(0,15*pi,1000);
            r2=sqrt(t2);
            x2=r2.*cos(t2);
            y2=r2.*sin(t2);
            
            line(imag(x1),imag(y1),'linewidth',1,'color',[0.2 0.3 0.4])
            line(x2,y2,'linewidth',1,'color',[0.2 0.3 0.4])
            str1(1) = {'$ \mathsf{Fermats \hspace{1ex} Spiral} $'};
            str1(2) = {'$\mathsf{r(\theta)=\sqrt{\theta} }$'};
            str1(3) = {'$\mathsf{\theta=[-5\pi \hspace{1ex} 5\pi] }$'};
            axis([-8 8 -8 8])
            axis equal on
        case 22
            t1=-15*pi:0.02:0.1;
            t2=0:0.02:15*pi;
            r1=2*(t1);r2=2*(t2);
            x1=-r1.*cos(t1);x2=r2.*cos(t2);
            y1=r1.*sin(t1);y2=r2.*sin(t2);
            plot(imag(x1),imag(y1),'linewidth',2,'color',[0.2 0.3 0.4])
            hold on
            plot(x2,y2,'linewidth',2,'color',[0.2 0.3 0.4])
            hold off
            legend('r^2=t,t[-5pi 5pi]')
            axis square
        case 23
            theta=0:0.01:45*2*pi;
            rad = (0.8*theta./(2*pi)+3);
            r = rad.*(8 + sin(theta*6+rad./3));
            x = r.*cos(theta);
            y = r.*sin(theta);
            plot(x,y,'linewidth',1.5);
        case 24
            t=0:0.01:3.4*pi;
            x=sin(2*pi*t);
            y=sin(0.9*2*pi*t);
            z=ones(size(t));
            %plot(x,y);
            verts = {[x' y' z']};
            daspect([1 1 1]);twistangle={[t/20000]};
            h=streamribbon(verts,twistangle,0.2);
            shading interp
            %colormap(hsv)
            axis off
            view(3)
            axis([-2 2 -2 2])
        case 25
            theta=0:0.01:45*2*pi;
            rad = (0.8*theta./(2*pi)+1);
            r = rad.*(8 + sin(theta*7+rad./1.8));
            x = r.*cos(theta);
            y = r.*sin(theta);
            z=ones(size(x));
            %cline(x,y,theta);
            %patch(x,y,'r','edgecolor','none','facecolor',[0 0 0],'linewidth',2)
            colmap=colormap(hsv);
            %patch(x,y,'r','edgecolor',[1 0 1],'FaceVertexCData',colmap,'facecolor','none','linewidth',2);
            axis off square
            verts = {[x' y' z']};
            daspect([1 1 1]);twistangle={[theta/20000]};
            h=streamribbon(verts,twistangle,5);
    end
    
    if isvarname('str1')
        text('Interpreter','latex',...
            'String',str1,...
            'Position',[0 0],...
            'FontSize',10)
        %h=title('unknown');
        %get(h)
        %set(h,'Interpreter','latex','string',str1,'FontSize',10,'HorizontalAlignment','left');
    end
    
    axis equal
    axis on
    
    set(gcf,'color',[1 1 1]);%,'position',[50,50,700,700]);
    %callbackStr=['export_fig(''png'',''surf' num2str(s) ''',' '''nocrop'')'];
    callbackStr=['export_fig(''png'',''nocrop'',''a2'',''curve' num2str(s) ''')'];
    sld2Hndl=uicontrol( ...
        'Style','pushbutton', ...
        'Position',[10 10 40 20], ...
        'Callback',callbackStr);
    
end

