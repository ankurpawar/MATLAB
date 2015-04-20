%Julia set
%author:Ankur Pawar
%this script takes about 2 second
%to complete the fractal.
%Remove the comment in line 84 to 85
%to save the fractal as a png file


xres = 500;%x resolution
yres = 500;%y resolution
x = linspace(-1.5,1.5,xres);
y = linspace(-1.5,1.5,yres);
c = zeros(length(y),length(x));
xn= 0;
yn= 0;
xnew = 0;
ynew = 0;
lenx  = length(x);
leny  = length(y);
zval  = zeros(lenx,leny);
%array containing iterations for each julia set
iter_arr=[50 200 100 50  100 100 200 100 50 ...
    100 100 200 100 200 200 200 200 100 ...
    100 100 100 100 75  200 100 ];
%list of 23 constants for different julia set
liststr={'-0.7500-0.3500i';'-0.4000+0.6000i';
    '+0.2850+0.0100i';'+0.4500+0.1428i';
    '-0.7017+0.3842i';'-0.8350-0.2321i';
    '-0.8000+0.1560i';'-0.2365-0.6721i';
    '+0.2311+0.6068i';'-0.7322-0.2628i';
    '-0.79543+0.17308i';'-0.51251+0.52129i';
    '-0.81000-0.17950i';'0.36237+0.32i';
    '-0.4959345-0.52287731i';
    '-0.4942345+0.52287731i';
    '-0.11+0.6556999999999999i';
    '-0.7708-0.1363i';'-0.3420+0.6349i';
    '-0.0284-0.7145i';
    '0.28685134248957+0.48848536810956i';
    '0.37568367799540-0.30544619694366i';
    '-0.03802150108227+0.68253188890436i';
    '0.23712524838792+0.51713719804576i'};
[s,v] = listdlg('PromptString','Select any one',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    an=liststr{s};
    a = real(str2num(an));
    b = imag(str2num(an));
    
    h_msg = msgbox(' Please Wait ',' ');
    iter  = iter_arr(s);
    for n=1:leny
        
        c(n,:)=y(n)+i*x(:);
        
    end
    
    tic %timer on
    
    for n = 1:lenx*leny
        
        k  = 0;
        xn = real(c(n));
        yn = imag(c(n));
        while ((k < iter) &&((xn*xn + yn*yn)<4))
            xnew = xn*xn-yn*yn + a;
            ynew = 2*xn*yn + b;
            xn = xnew;
            yn = ynew;
            k = k+1;
        end
        zval(n)= k;
        
    end
    toc  %timer off
    close(h_msg);
    zval = zval';
    zmin=min(zval(:));
    zmax=max(zval(:));
    num=zmax-zmin;
    %you can also try any one of these colormaps
    %cmap = flipud(colormap(copper(iter)));
    %cmap = flipud(colormap(bone(iter)));
    %cmap = flipud(colormap(hot(iter)));
    cmap = (1-gray(num));
    %cmap = flipud(colormap(bone(iter)));
    %cmap = fliplr(flipud(hot(iter)));
    %cmap = flipud(colormap(pink(iter)));
    %cmap = fliplr(flipud(pink(iter)));
    %cmap = flipud(fliplr(bone(iter)));
    %colormap(cmap);
    %image(x,y,zval);
    %axis tight off
    %clear x y c
    imwrite(zval-1,cmap,['julia' an '.png'],'png','source','Computer generated');
end
