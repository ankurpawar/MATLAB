%Clifford attractor
%Equation
%x(n+1) =sin(a* y(n)) +c*cos(a*x(n));
%y(n+1) =sin(b* x(n)) +d*cos(b*y(n));
%
%author :Ankur Pawar
%execution time about 12 seconds
xres =700;
yres =700;
N =300000;%1300000


%a    %b   %c   %d
liststr={'[-1.4  1.6  1.0  0.7]';
    '[1.3  1.7  0.5  1.4 ]';
    '[1.7  1.7  0.06 1.2]';
    '[1.6 -0.6 -1.2 1.6]';
    '[1.1 -1.0  1.0  1.5 ]'};

[ss,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    tic
    coeff=str2num(liststr{ss});
    a=coeff(1);
    b=coeff(2);
    c=coeff(3);
    d=coeff(4);
    xn=0;yn=0;
    x=0;y=0;
    xmin=0;xmax=0;ymin=0;ymax=0;
    for n=1:2000
        xn =sin(a* y) +c*cos(a*x);
        yn =sin(b* x) +d*cos(b*y);
        x=xn;
        y=yn;
        xmin=min(xmin,xn);
        xmax=max(xmax,xn);
        ymin=min(ymin,yn);
        ymax=max(ymax,yn);
    end
    
    
    img=zeros(xres,yres,3);     %3D histogram array
    xdiff=1.05*((xmax)-(xmin))/xres;
    ydiff=1.05*((ymax)-(ymin))/yres;
    minx=1.05*xmin;
    miny=1.05*ymin;
    
    xn=0;yn=0;
    x=0;y=0;
    
    
    total=25;
    for k=1:total
        for n=1:N
            xn =sin(a* y) +c*cos(a*x);
            yn =sin(b* x) +d*cos(b*y);
            x=xn;
            y=yn;
            
            aa=mod(xn,1);
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
            
            img(indx,indy,1)=img(indx,indy,1)+r;
            img(indx,indy,2)=img(indx,indy,2)+g;
            img(indx,indy,3)=img(indx,indy,3)+bb;
            
            
        end
    end
    h=0.5*fspecial('average',[2 2]);
    img=imfilter(img,h);
    image(uint8(256-img))
    imwrite(uint8(256-img),['clifford' num2str(ss) '.png'],'png');
    toc
end