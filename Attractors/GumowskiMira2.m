%GumowskiMira1
% xn+1 = sin(a yn) - cos(b xn)
% yn+1 = sin(c xn) - cos(d yn)
%execution time about 14 seconds
xres =1000;
yres =1000;
N =1000000;     %number of iterations


liststr={'[-0.23 1]';
    '[0.28617 1]';
    '[-0.70785 1]';
    '[0.31043  1]';
    '[-0.15022 1]';
    '[-0.4976  1]';
    '[0.30328  1]';
    '[-0.57802 1]';
    '[-0.53321 1]';
    '[-0.49442 1]';
    '[-0.74761 1]';
    '[0.3083   1]';
    '[-0.51618 1]';
    '[0.28943  1]';
    '[0.26925  1]'};
[ss,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    
    coeff=str2num(liststr{ss});
    a=coeff(1);
    b=coeff(2);
    
    
    xn=1;yn=1;
    x=0;y=0;
    xmin=0;xmax=0;ymin=0;ymax=0;
    for n=1:20000
        xn =  b*yn+a*x  +2*(x)^2 *(1 - a)/(1 + x^2);
        yn = -x   +a*xn +2*(xn)^2*(1 - a)/(1 +xn^2);
        x=xn;
        y=yn;
        xmin=min(xmin,xn);
        xmax=max(xmax,xn);
        ymin=min(ymin,yn);
        ymax=max(ymax,yn);
    end
    
    
    img=zeros(xres,yres,3);     %3D histogram array
    img2=zeros(xres,yres);     %2D histogram array
    xdiff=1.1*((xmax)-(xmin))/xres;
    ydiff=1.1*((ymax)-(ymin))/yres;
    minx=1.1*xmin;
    miny=1.1*ymin;
    
    
    xn=1;yn=1;
    x=0;y=0;
    total=1;
    r=0;g=0;bb=0;
    
    
    for nn=1:total
        for n=1:N
            xn =  b*yn+a*x +2*(x)^2 *(1 - a)/(1 + x^2);
            yn = -x   +a*xn+2*(xn)^2*(1 - a)/(1 +xn^2);
            x=xn;
            y=yn;
            
            aa=mod(atan2(yn,xn)/(2*pi),1);
            s=1;
            v=1;
            zo = floor(6*aa);
            rough = (zo);
            f = aa*6 - zo;
            p = v*(1-s);
            q = v*(1-s*f);
            t = v*(1-s*(1-f));
            
            switch (rough)
                case 0
                    r=v; g=t; bb=p;
                case 1
                    r=q; g=v; bb=p;
                case 2
                    r=p; g=v; bb=t;
                case 3
                    r=p; g=q; bb=v;
                case 4
                    r=t; g=p; bb=v;
                case 5
                    r=v; g=p; bb=q;
            end
            
            
            indx=floor((x-minx)/xdiff);
            indy=floor((y-miny)/ydiff);
            img2(indy,indx)=img2(indy,indx)+10;
            img(indy,indx,1)=img(indy,indx,1)+r;
            img(indy,indx,2)=img(indy,indx,2)+g;
            img(indy,indx,3)=img(indy,indx,3)+bb;
        end
    end
    h=0.5*fspecial('average',[2 2]);
    img=imfilter(img,h);
    %image(uint8(256*img))
    img2=255*img2/max(max(img2));
    h=0.5*fspecial('disk',2);
    img2=imfilter(img2,h);
    image((img2)),cmap=colormap(fliplr(1-bone));
    %imwrite(img2,cmap,['GumowskiMira' num2str(ss) '.png'],'png','source',num2str(coeff));
end