%attractor2
%author:Ankur Pawar
%description:generating strange attractor using histogram
%            method.

xres=1000;
yres=1000;
liststr={'qdasbcynawre';'ixxalopubexk';'qoluaglqcqwl';
    'rouqvcksjqqe';'lcsavfiagfgy';'dlwcsogbyrqq';
    'rhapxmppmjub';'vmdtlegsbcul';'gsvnapufkomd';
    'doqqtwunwfvp';'specosqkkvii';'qwpcnjobunrd';
    'vdfwnqgwqomy';'cvmtwrjeqckn';'vtuyffmhirqu';
    'noiskwqhelxf';'ejvnpmsxdxme';'eovjltnsunsl';
    'lqgmmctcetgh';'lemuvyuhfxkc'};

[ss,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);

if v==1
    tic
    h_msg =  msgbox(' Please Wait ',' ');
    an=double(liststr{ss});
    coeff=(an-109)*-0.1;
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    xmin=0;xmax=0;ymin=0;ymax=0;
    for n=1:10000
        xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+...
            coeff(5)*yn+coeff(6)*yn^2;
        yn=coeff(7)+coeff(8)*xn+coeff(9)*xn^2+coeff(10)*xn*yn+...
            coeff(11)*yn+coeff(12)*yn^2;
        xn=xxn;
        xmin=min(xmin,xn);
        xmax=max(xmax,xn);
        ymin=min(ymin,yn);
        ymax=max(ymax,yn);
        xi=xn;
        yi=yn;
    end
    
    lim=1.05*[xmin xmax ymin ymax];
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    %x=linspace(lim(1),lim(2),xres);
    %y=linspace(lim(3),lim(4),yres);
    z=zeros(xres,yres,3);
    xdiff=1.05*((xmax)-(xmin))/xres;
    ydiff=1.05*((ymax)-(ymin))/yres;
    minx=1.05*xmin;
    miny=1.05*ymin;
    an=double(liststr{ss});
    sensitivity=0.02;
    xi=0;yi=0;xn=0;yn=0;
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    total=20;
    
    for m=1:total
        
        for n=1:1300000
            a=mod(xn,1);
            s=1;
            v=1;
            zo = floor(6*a);
            rough = (zo);
            f = a*6 - zo;
            p = v*(1-s);
            q = v*(1-s*f);
            t = v*(1-s*(1-f));
            
            switch (rough)
                case 0
                    r=v; g=t; b=p;
                case 1
                    r=q; g=v; b=p;
                case 2
                    r=p; g=v; b=t;
                case 3
                    r=p; g=q; b=v;
                case 4
                    r=t; g=p; b=v;
                case 5
                    r=v; g=p; b=q;
            end
            xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+...
                coeff(5)*yn+coeff(6)*yn^2;
            yn=coeff(7)+coeff(8)*xn+coeff(9)*xn^2+coeff(10)*xn*yn+...
                coeff(11)*yn+coeff(12)*yn^2;
            xn=xxn;
            xi=xn;
            yi=yn;
            
            indx=floor((xi-minx)/xdiff);
            indy=floor((yi-miny)/ydiff);
            z(indx,indy,1)=z(indx,indy,1)+r;
            z(indx,indy,2)=z(indx,indy,2)+g;
            z(indx,indy,3)=z(indx,indy,3)+b;
        end
    end
    %z=(1.0-exp(-sensitivity .*z)).*255;
    close(h_msg);
    h=0.5*fspecial('average',[2 2]);
    z=imfilter(z,h);
    toc
    %image(uint8(z))
    imwrite(uint8(256-z),['2attr' num2str(ss) '.png'],'png');
end
