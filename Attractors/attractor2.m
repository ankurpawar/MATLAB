%attractor2
%author:Ankur Pawar
%description:generating strange attractor using histogram
%            method.
xres=1000;
yres=1000;
liststr={'qdasbcynawre';'ixxalopubexk';'qoluaglqcqwl';
    'rouqvcksjqqe';'lcsavfiagfgy';'dlwcsogbyrqq';
    'rhapxmppmjub';'vmdtlegsbcul';'gsvnapufkomd';
    'doqqtwunwfvp'};

[s,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);

if v==1
    h_msg =  msgbox(' Please Wait ',' ');
    an=double(liststr{s});
    coeff=(an-109)*-0.1;
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    roughxmin=0;roughxmax=0;roughymin=0;roughymax=0;
    for n=1:10000
        xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+...
            coeff(5)*yn+coeff(6)*yn^2;
        yn=coeff(7)+coeff(8)*xn+coeff(9)*xn^2+coeff(10)*xn*yn+...
            coeff(11)*yn+coeff(12)*yn^2;
        xn=xxn;
        roughxmin=min(roughxmin,xn);
        roughxmax=max(roughxmax,xn);
        roughymin=min(roughymin,yn);
        roughymax=max(roughymax,yn);
        xi=xn;
        yi=yn;
    end
    roughxmin=roughxmin-0.2;
    roughxmax=roughxmax+0.2;
    roughymin=roughymin-0.2;
    roughymax=roughymax+0.2;
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    x=linspace(roughxmin,roughxmax,xres);
    y=linspace(roughymin,roughymax,yres);
    z=zeros(length(x),length(y),3);
    xdiff=x(2)-x(1);
    ydiff=y(2)-y(1);
    minx=min(x);
    miny=min(y);
    an=double(liststr{s});
    sensitivity=0.02;
    xi=0;yi=0;xn=0;yn=0;
    curcol=zeros(1,3);
    total=1000;
    skip=10;
    for m=1:total
        p=m/total;
        h=p;
        h=h*6.0;
        hi=floor(h);
        hf=h-hi;
        switch (mod(hi,6))
            case 0
                curcol=[1     hf   0];
            case 1
                curcol=[1-hf  1    0];
            case 2
                curcol=[0     1    hf];
            case 3
                curcol=[0   1-hf   1];
            case 4
                curcol=[hf    0    1];
            case 5
                curcol=[1     0  1-hf];
        end
        for n=1:5000
            xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+...
                coeff(5)*yn+coeff(6)*yn^2;
            yn=coeff(7)+coeff(8)*xn+coeff(9)*xn^2+coeff(10)*xn*yn+...
                coeff(11)*yn+coeff(12)*yn^2;
            xn=xxn;
            xi=xn;
            yi=yn;
            if n<skip
                continue;
            end
            indx=floor((xi-minx)/xdiff);
            indy=floor((yi-miny)/ydiff);
            z(indx,indy,1)=z(indx,indy,1)+curcol(1,1);
            z(indx,indy,2)=z(indx,indy,2)+curcol(1,2);
            z(indx,indy,3)=z(indx,indy,3)+curcol(1,3);
        end
    end
    z=(1.0-exp(-sensitivity .*z)).*255;
    close(h_msg);
    image(uint8(z))
    %imwrite(uint8(z),['2attr' num2str(s) '.png'],'png');
end
