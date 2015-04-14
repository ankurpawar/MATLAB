%atrractor with sine and cosine fucntions
%attractor2
%author:Ankur Pawar
%description:generating strange attractor using histogram
%            method.
%Execution time about 20 second
xres=1000;
yres=1000;
liststr={   'CDYVWGQYVUBQOBMVBD';
    'GHBBADGTAYVMKIBSLG';
    'HPBAJVWNASHWRJWBXM';
    'JEUALUVCWBLEXYCAVH';
    'RQYUANROUUDKJQSTKU';
    'TXBGOYYMWONUYGMBXX';
    'UMLPFJYBIWSRAAMOSKM';
    'WJPOONBLHLADVDVCCR'};

[ss,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);

if v==1
    tic
    h_msg =  msgbox(' Please Wait ',' ');
    an=double(liststr{ss});
    A=(an-77)*-0.1;
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    xmin=0;xmax=0;ymin=0;ymax=0;
    for n=1:10000
        %xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+coeff(5)*yn+coeff(6)*yn^2;
        xxn = A(1) + A(2) * xn + A(3) * yn + A(4) * sin(A(5) * xn + A(6))...
            + A(7) * sin(A(8) * yn + A(9));
        yn = A(10) + A(11) * xn + A(12) * yn + A(13) * sin(A(14) * xn + A(15))...
            + A(16)* sin(A(17) * xn + A(18));
        %yn=coeff(7)+coeff(8)*xn+coeff(9)*xn^2+coeff(10)*xn*yn+coeff(11)*yn+coeff(12)*yn^2;
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
    x=linspace(lim(1),lim(2),xres);
    y=linspace(lim(3),lim(4),yres);
    z=zeros(length(x),length(y));
    xdiff=x(2)-x(1);
    ydiff=y(2)-y(1);
    minx=min(x);
    miny=min(y);
    an=double(liststr{ss});
    sensitivity=0.02;
    xi=0;yi=0;xn=0;yn=0;
    curcol=zeros(1,3);
    total=10;
    
    for m=1:total
        
        for n=1:1900000
            
            xxn = A(1) + A(2) * xn + A(3) * yn + A(4) * sin(A(5) * xn + A(6))...
                + A(7) * sin(A(8) * yn + A(9));
            yn = A(10) + A(11) * xn + A(12) * yn + A(13) * sin(A(14) * xn + A(15))...
                + A(16)* sin(A(17) * xn + A(18));
            xn=xxn;
            xi=xn;
            yi=yn;
            
            indx=floor((xi-minx)/xdiff);
            indy=floor((yi-miny)/ydiff);
            z(indx,indy)=z(indx,indy)+1;
            %z(indx,indy,2)=z(indx,indy,2)+g;
            %z(indx,indy,3)=z(indx,indy,3)+b;
        end
    end
    %z=(1.0-exp(-sensitivity .*z)).*255;
    fact=50;overexposure=20;
    znew = log(fact * z + 1);
    scale_z = 255 * overexposure / max(max(znew));
    brightness = scale_z * znew;
    close(h_msg);
    %h=0.5*fspecial('average',[3 3]);
    %z=imfilter(z,h);
    toc
    imagesc((brightness))
    colormap(flipud(bone(128)))
    %imwrite(uint8(256-z),['sincosattr' num2str(ss) '.png'],'png');
end
