%modified clifford
%Clifford attractor
%Equation
%x(n+1) =sin(a* y(n)) +c*cos(a*x(n));
%y(n+1) =sin(b* x(n)) +d*cos(b*y(n));
%
%
%execution time about 12 seconds
xres =700;
yres =700;
N =300000;%1300000


%a    %b   %c   %d
liststr={'[-1.7452      1.5009     -1.0128     -2.9896]';
    '[2.4807     -3.8906     -1.3926     -2.6058]';
    '[2.5629      1.9965     -3.0166      1.0742]';
    '[2.499     0.91425     -0.6874      2.2181]';
    '[-0.42347     -3.7297       1.762     -1.9152]';
    '[3.682      1.4091    -0.21299      1.6482]';
    '[-3.4057     -2.4541    -0.96317     -1.7885]';
    '[0.55584     -2.7259     0.75492     -1.3512]';
    '[-0.31124     0.54263      2.3537     -3.5265]';
    '[-2.3209     0.63988      3.8337    -0.26302]';
    '[0.24331     -2.5793      3.1761      2.4797]'};
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
    maxdist=0;
    for n=1:2000
        xn =sin(d-x^2+y-a)-cos(c+x^2-y-d);
        yn =cos(c+x-y^2-b)+sin(a-x+y^2-b);
        maxdist=max(maxdist,sqrt((x-xn)^2+(y-yn)^2));
        x=xn;
        y=yn;
        xmin=min(xmin,xn);
        xmax=max(xmax,xn);
        ymin=min(ymin,yn);
        ymax=max(ymax,yn);
    end
    
    
    img=zeros(xres,yres,3);     %3D histogram array
    xdiff=1.8*((xmax)-(xmin))/xres;
    ydiff=1.8*((ymax)-(ymin))/yres;
    minx=1.8*xmin;
    miny=1.8*ymin;
    
    xn=0;yn=0;
    x=0;y=0;
    
    
    total=25;
    for k=1:total
        for n=1:N
            xn =sin(d-x^2+y-a)-cos(c+x^2-y-d);
            yn =cos(c+x-y^2-b)+sin(a-x+y^2-b);
            aa=sqrt((xn-x)^2+(yn-y)^2)/maxdist;
            x=xn;
            y=yn;
            
            %aa=mod(xn,1);
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
    %imwrite(uint8(256-img),['modifcliff' num2str(ss) '.png'],'png');
    toc
end