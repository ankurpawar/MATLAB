%SymChaos2

xres =1000;
yres =1000;
N =1500000;     %number of iterations


liststr={'[-1 2.36 -0.6]';
    '[-1 1.4115     -0.8104]';
    '[-1 1.4979    -0.74692]';
    '[-1 1.6169     0.75314]';
    '[-1 1.6114    -0.70243]';
    '[-1 1.4712     0.78305]';
    '[-1 1.0056      0.9605]';
    '[-1 1.6152    -0.73523]';
    '[-1 1.3645    -0.79285]';
    '[-0.060753  1.1584 -0.22429]';
    '[-1 2.5211      0.4829]';
    '[-1 1.3112     0.82818]';
    '[-1 2.5077     0.31219]';
    '[-1 1.6845     0.72979]'};
[ss,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    
    coeff=str2num(liststr{ss});
    alpha_o=coeff(1);
    lambda=coeff(2);
    gamma_o=coeff(3);
    
    
    xn=0;yn=0;
    x=0.5;y=0.5;
    xmin=0;xmax=0;ymin=0;ymax=0;
    z0=(1+i)/2;
    for n=1:2000
        zn=gamma_o*(conj(z0))^(2)+z0*(lambda+alpha_o*z0*conj(z0));
        %xn =gamma_o*(x^2-y^2)+lambda+alpha_o*x^3+alpha_o*x*y^2;
        %yn =gamma_o*2*x*y+lambda*y+alpha_o*x^2*y+alpha_o*y^3;
        z0=zn;
        x=real(zn);
        y=imag(zn);
        xmin=min(xmin,x);
        xmax=max(xmax,x);
        ymin=min(ymin,y);
        ymax=max(ymax,y);
    end
    
    
    img=zeros(xres,yres,3);     %3D histogram array
    xdiff=1.1*((xmax)-(xmin))/xres;
    ydiff=1.1*((ymax)-(ymin))/yres;
    minx=1.1*xmin;
    miny=1.1*ymin;
    
    
    xn=0;yn=0;
    x=0.5;y=0.5;
    total=4;
    r=0;g=0;bb=0;
    
    z0=(1+i)/2;
    for nn=1:total
        for n=1:N
            zn=gamma_o*(conj(z0))^(2)+z0*(lambda+alpha_o*z0*conj(z0));
            %xn =gamma_o*(x^2-y^2)+lambda+alpha_o*x^3+alpha_o*x*y^2;
            %yn =gamma_o*2*x*y+lambda*y+alpha_o*x^2*y+alpha_o*y^3;
            z0=zn;
            x=real(zn);
            y=imag(zn);
            if n<=10
                continue;
            end
            aa=mod(atan2(y,x)/(2*pi),1);
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
            if indx<xres && indy<yres && indx>0 && indy>0
                img(indy,indx,1)=img(indy,indx,1)+r;
                img(indy,indx,2)=img(indy,indx,2)+g;
                img(indy,indx,3)=img(indy,indx,3)+bb;
            end
        end
    end
    h=fspecial('average',[3 3]);
    img=imfilter(3*img,h);
    
    image(uint8(255-img))
    
    %imwrite(uint8(255-img),['SymmetricIcon' num2str(ss) '.png'],'png');
end