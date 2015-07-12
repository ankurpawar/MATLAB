%2D Quadratic attractor
%
%author:Ankur Pawar
%description:generating strange attractor using histogram method.
%execution time about 25 seconds
%Equation
%xn+1 = a0 + a1 xn + a2 xn^2 + a3 xn yn + a4 yn + a5 yn^2
%yn+1 = b0 + b1 xn + b2 xn^2 + b3 xn yn + b4 yn + b5 yn^2
%attractorcoeff.mat contains list of coefficients
%42,21
xres=1000;
yres=1000;
load attractor_coeff
prompt = {'Enter choice:'};
dlg_title = '1 to 44';
num_lines = 1;
def = {'1'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
v=0;
if ~isempty(answer)
    ss=str2num(answer{1});
    v=1;
end


if v==1
    maxdist=0;
    co = coeff(ss,:);
    xn = 0; yn = 0; xi = 0; yi = 0; xxn = 0;
    xmin=0;xmax=0;ymin=0;ymax=0;
    h_msg =  msgbox(' Please Wait ',' ');
    for n=1:5000               %loop to find min and max value of x and y
        xxn=co(1)+co(2)*xn+co(3)*xn^2+co(4)*xn*yn+...
            co(5)*yn+co(6)*yn^2;
        yn=co(7)+co(8)*xn+co(9)*xn^2+co(10)*xn*yn+...
            co(11)*yn+co(12)*yn^2;
        xn=xxn;
        maxdist=max(maxdist,sqrt((xn-xi)^2+(yn-yi)^2));
        xmin=min(xmin,xn);
        xmax=max(xmax,xn);
        ymin=min(ymin,yn);
        ymax=max(ymax,yn);
        xi=xn;
        yi=yn;
    end
    
    z=zeros(xres,yres,3);     %3D histogram array
    xdiff=1.05*((xmax)-(xmin))/xres;
    ydiff=1.05*((ymax)-(ymin))/yres;
    minx=1.05*xmin;
    miny=1.05*ymin;
    
    
    xn=0;yn=0;xi=0;yi=0;xxn=0;
    total=1;
    dist=0;
    tic
    
    for k=1:20
        for n=1:1350000
            
            xxn=co(1)+co(2)*xn+co(3)*xn^2+co(4)*xn*yn+...
                co(5)*yn+co(6)*yn^2;
            yn=co(7)+co(8)*xn+co(9)*xn^2+co(10)*xn*yn+...
                co(11)*yn+co(12)*yn^2;
            xn=xxn;
            a=sqrt((xn-xi)^2+(yn-yi)^2)/maxdist;
            %a=mod(xn,1);
            %a=(pi+atan2(yn-yi,xn-xi))/(2*pi);
            xi=xn;
            yi=yn;
            
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
    toc
    close(h_msg);
    h=0.5*fspecial('average',[2 2]);
    z=imfilter(z,h);
    %imwrite(uint8(255-z),['3attr' num2str(ss) '.png'],'png');
    image(uint8(255-z))
end