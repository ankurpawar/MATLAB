function SurfaceCollection
% Collection of different type of surface
% get user input from command window
MAX_SURF = 15;
choice = getUserInput(['Enter a choice from 1 to ' num2str(MAX_SURF) ...
    '\n'] , 1, MAX_SURF);

switch choice
    case 1
        x = linspace(-pi,pi,100);
        [u,v] = meshgrid(x);
        surf(u,v,v.^2./(u.^2 + v.^2),'edgecolor','none');
        colormap autumn,
        alpha(0.9),
        shading interp,
    case 2
        x = linspace(-0.1,2*pi,100);
        [u,v] = meshgrid(x);
        surf(cos(u).*(-1 + 3*cos(v))...
            ,sin(u).*( 1 + 3*cos(v))...
            ,1.3* sin(v)...
            ,'edgecolor','none');
        camlight headlight
        camlight left
        camlight(-67,-90)
        shading interp
        material metal
        colormap(cool)
        view(-67,40)
    case 3
        [u,v] = meshgrid(-4:0.03:4,0:0.03:6.25);
        surf(u.*cos(v),u.*sin(v),v.*cos(u)...
            ,'facecolor',[0.6 0.9 0.7],'edgecolor','none');
        camlight headlight
        camlight left
        camlight(1,-90)
        material metal
        view(-11,30)
    case 4
        [u,v] = meshgrid(-pi:0.03:pi,-pi:0.03:pi);
        surf(0.3*u.*v.*sin(3*v),v,0.3*u.*v.*cos(3*v)...
            ,'facecolor',[0.8 0.7 0.2],'edgecolor','none');
        camlight headlight,
        camlight left,
        camlight(1,-90)
        material dull
        view(43,-46)
    case 5
        [a,b] = meshgrid(-0.1:0.03:2*pi,-0.1:0.03:pi);
        R = 5*cos(2*b).*sin(2*a);
        surf(R.*cos(b).*sin(a),R.*sin(b).*sin(a),R.*cos(a)...
            ,'facecolor',rand(1,3),'edgecolor','none');
        camlight headlight
        camlight left
        camlight(1,-90)
        material metal
        view(-14,22)
    case 6
        [a,b] = meshgrid(-0.1:0.03:2*pi,-0.1:0.03:pi);
        R = 8*cos(2*a).*sin(3*b);
        surf(R.*cos(b).*sin(a),R.*sin(b).*sin(a),R.*cos(a)...
            ,'facecolor',[0.84 0.63 0.75],'edgecolor','none');
        camlight headlight
        camlight left
        material metal
    case 7
        [a,b] = meshgrid(-0.1:0.03:2*pi,-0.1:0.03:pi);
        R = 20*( 0.25*(5/pi).^(1/2) .*(1.5*cos(a).^2 - 0.5) );
        surf(R.*cos(b).*sin(a) , R.*sin(b).*sin(a) , R.*cos(a)...
            ,'facecolor',[0.85 0.9 0.34],'edgecolor','none');
        camlight headlight
        camlight left
        camlight(1,-90)
        material metal
    case 8 %Bohemian dome
        [u,v] = meshgrid(-2*pi:0.03:2*pi,-2*pi:0.03:pi);
        A = 0.5;
        B = 1.5;
        C = 1;
        surf(A*cos(u),B*cos(v)+A*sin(u),C*sin(v)...
            ,'facecolor',[0.5 0.9 0.8],'edgecolor','none');
        camlight headlight
        camlight left
        camlight(1,-90)
        material metal
        view(-126,22)
    case 9
        [u,v] = meshgrid(-2*pi:0.05:2*pi,-2*pi:0.05:2*pi);
        surf(cos(u).^3.*cos(v).^3,sin(u).^3.*cos(v).^3,sin(v).^3 ...
            ,'facecolor',[0.6 0.4 0.9],'edgecolor','none');
        lighting phong
        camlight headlight
        camlight left
        camlight(1,-90)
        material dull
    case 10 %Mobius Strip
        [u,v] = meshgrid(-0.1:0.03:2*pi,-3:0.03:3);
        surf(5*cos(u)+v.*cos(u/2).*cos(u)...
            ,5*sin(u)+v.*cos(u/2).*sin(u),2*v.*sin(u/2) ...
            ,'facecolor',rand(1,3),'edgecolor','none');
        camlight headlight
        camlight left
        camlight(1,-90)
        material metal
        view(-95,48)
    case 11
        [u,v] = meshgrid(linspace(0,2*pi,250),linspace(-0.8,0.8,50));
        t=3; % number of twist
        surf(sin(u).*(2-v.*sin(t*u/2)),cos(u).*(2-v.*sin(t*u/2))...
            ,v.*cos(t*u/2),u...
            ,'edgecolor','none','facecolor',[0.8 0.8 0.9]);
        camlight headlight
        camlight left
        camlight right
        material metal
        view(-56,34)
    case 12
        %Inner Twisted Wave
        [x,y] = meshgrid(linspace(-5,5,100));
        R = (x.*x+y.*y).^0.5;
        c = rand(1,3);
        h = surf(x,y,1./(1+R).*(x.*sin(4*R)+y.*cos(4*R))...
            ,'facecolor',[0.4 0.7 0.8],'edgecolor','none');
        lighting phong
        camlight headlight
        camlight left
        material dull
        view(-111,48);
    case 13 %Swallow Tail
        [u,v] = meshgrid(-2:0.03:2,-0.8:0.03:0.8);
        x = u.*v.^2 + 3*v.^4;
        y = -2.*u.*v - 4*v.^3;
        z = u;
        surf(x,y,z...
            ,'facecolor',[0.5 0.5 0.7],'edgecolor','none');
        camlight headlight
        camlight left
        camlight right
        material dull
        view(-132,12)
    case 14  %klein bottle
        [u,v] = meshgrid(0:0.05:2.01*pi,0:0.05:2.01*pi);
        r = 4*(1-cos(u)/2);
        x = 6*cos(u).*(1+sin(u))+r.*cos(v+pi);
        y = 16*sin(u);
        z = r.*sin(v);
        surf(x,y,z,'facecolor',[0.5 0.7 0.9],'edgecolor','none');
        camlight headlight
        camlight(1,-90)
        material shiny
        view(28,-50)
    case 15 %water drop
        [u,v] = meshgrid(linspace(0,2*pi,100),linspace(-5,4.4444,100));
        x = v.^2.*sqrt((4-0.9.*v)./2).*cos(u);
        y = v.^2.*sqrt((4-0.9.*v)./2).*sin(u);
        z = 5*v;
        surf(x,y,z,'edgecolor','none','facecolor',[0.3 0.5 0.9]);
        camlight headlight
        camlight(1,-90)
        material([0.7 0.4 0.6]);
        view(-84,20)
end
axis equal off
set(gcf,'color',[1 1 1]);
% export_fig function is available then save figure as png file
if exist('export_fig') > 0
    export_fig('png','-nocrop',['surface' num2str(choice)]);
end
end

function choice = getUserInput(promptStr, minNum, maxNum)
% return the user input and check the range of input
choice = input(promptStr);
if isempty(choice) || ~isnumeric(choice)
    error('enter a number');
elseif (choice < minNum) || (choice > maxNum)
    error(['enter a number between ' num2str(minNum) ' to ' num2str(maxNum)]);
elseif isfloat(choice)
    %if choice is floating point value then truncate the fractional part
    choice = choice - mod(choice,1);
end
end