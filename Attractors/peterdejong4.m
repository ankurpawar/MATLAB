%Peter de Jong
% xn+1 = sin(a yn) - cos(b xn)
% yn+1 = sin(c xn) - cos(d yn)
%execution time about 14 seconds
xres =1000;
yres =1000;      
N =300000;     %number of iterations


  liststr={'[2.01 -2.53  1.61 -0.33]';
           '[1.4  -2.3   2.4  -2.1]';
           '[-2.7 -0.09 -0.86 -2.2]';
           '[-2.24 0.43 -0.65 -2.43]'
           'pi*[0.854 0.252 0.22 0.396]';
           '[-1.5937 -1.7387 -1.0628 1.7324]';
           '[1.0702 1.7894 1.2532 1.6953]';
           '[-1.3754 1.7003 -1.1914 -1.9662]';
           '[1.2757 -1.7228 1.8227 -0.73065]';
           '[-0.56091 -1.9267 0.9791 3.882]';
           '[-3.0474 0.21557 3.0282 0.29154]'};
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
            xn =sin(a* y) - cos(b* x);
            yn =sin(c* x) - cos(d* y);
            x=xn;
            y=yn;
            xmin=min(xmin,xn);
            xmax=max(xmax,xn);
            ymin=min(ymin,yn);
            ymax=max(ymax,yn);
    end


    img=zeros(xres,yres,3);     %3D histogram array
    xdiff=1.1*((xmax)-(xmin))/xres;
    ydiff=1.1*((ymax)-(ymin))/yres;
    minx=1.1*xmin;
    miny=1.1*ymin;


    xn=0;yn=0;
    x=0;y=0;
    total=30;



    for nn=1:total
        for n=1:N
                xn =sin(a* y) - cos(b* x);
                yn =sin(c* x) - cos(d* y);
                x=xn;
                y=yn;
                
                aa=mod(xn/3,1);
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
                img(indy,indx,1)=img(indy,indx,1)+r;
                img(indy,indx,2)=img(indy,indx,2)+g;
                img(indy,indx,3)=img(indy,indx,3)+bb;
        end
    end
    h=fspecial('average',[2 2]);
    img=imfilter(2*img,h);
    image(uint8(256-img))
    toc
    imwrite(uint8(256-img),['peterdejong' num2str(ss) '.png'],'png');
end