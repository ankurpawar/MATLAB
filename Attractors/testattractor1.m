%2D Quadratic attractor

%author:Ankur Pawar
%description:generating strange attractor using histogram method.
%execution time about 25 seconds,
%Equation
%xn+1 = a0 + a1 xn + a2 xn^2 + a3 xn yn + a4 yn + a5 yn^2
%yn+1 = b0 + b1 xn + b2 xn^2 + b3 xn yn + b4 yn + b5 yn^2
%liststr is list of coefficients from a0 to a5 and b0 to b5
%The coefficients are represented as A=-1.2,B=-1.1,C=-1.0.....,Z=1.2
xres=1000;
yres=1000;
liststr={'CVQKGHQTPHTE';'FIRCDERRPVLD';'GIIETPIQRRUL';
    'GLXOESFTTPSV';'GXQSNSKEECTX';'WXIKLDDNSJIH';
    'ILIBVPKJWGRR';'LUFBBFISGJYS';'MCRBIPOPHTBN';
    'MDVAIDOYHYEA';'ODGQCNXODNYA';'QFFVSLMJJGCR';
    'UWACXDQIGKHF';'CUWDDTSQSQWG';'JMRXWULBJFDA';
    'TCPGYTRGGFKJ';'YMKRWVACUTFL';'CWVAEQYHDDOM';
    'KWLCSAVFIAGF';'BCQAFMFVPXKQ';'DSYUECINGQNV';
    'ZPMSGCNFRENG';'IVYGXWALYCHU';'QBBYNKJEXUBO';
    'IKNEYSNIWICN';'HKEIDWOGPIIU';'NWGYDTQYSTSA';
    'VNCWGKSXAHII';'HRYJBMJJMPEX';'DMVFNUSGXWEN';
    'SGDLYJETOKMV';'VKIIFCELCTDJ';'GJUWKGIOODQQ';
    'ICJWLPKXELHV';'DVTCLISCIKMA';'WDMFCHPUIWOL';
    'DFEATTMRQHIE';'LKQGOCIRUNBT';'UPDLJMGBVBMU';
    'UKDPNFLGELGN';'NISMMWFWUFSR';'NUMEDAERTBOW';
    'ZPMSGCNFRENG';'UATWVBSHJIWR';'SYMDYDHXPFVL'};

[ss,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);
tic
if v==1
    h_msg =  msgbox(' Please Wait ',' ');
    an=double(liststr{ss});
    coeff=(an-77)*0.1;
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    xmin=0;xmax=0;ymin=0;ymax=0;
    for n=1:5000        %loop to find min and max value of x and y
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
    
    
    z=zeros(xres,yres,3);    %3D histogram array
    xdiff=1.05*((xmax)-(xmin))/xres;
    ydiff=1.05*((ymax)-(ymin))/yres;
    minx=1.05*xmin;
    miny=1.05*ymin;
    
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    total=20;
    for m=1:total
        for n=1:1350000
            xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+...
                coeff(5)*yn+coeff(6)*yn^2;
            yn=coeff(7)+coeff(8)*xn+coeff(9)*xn^2+coeff(10)*xn*yn+...
                coeff(11)*yn+coeff(12)*yn^2;
            xn=xxn;
            xi=xn;
            yi=yn;
            
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
            
            indx=floor((xi-minx)/xdiff);
            indy=floor((yi-miny)/ydiff);
            z(indx,indy,1)=z(indx,indy,1)+r;
            z(indx,indy,2)=z(indx,indy,2)+g;
            z(indx,indy,3)=z(indx,indy,3)+b;
        end
    end
    close(h_msg);
    h=0.5*fspecial('average',[2 2]);
    z=imfilter(z,h);
    toc
    imwrite(uint8(256-z),['1attr' num2str(ss) '.png'],'png');
    image(uint8(256-z))
end