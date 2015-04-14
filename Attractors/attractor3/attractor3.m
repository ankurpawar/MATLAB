%attractor3
%author:Ankur Pawar
%description:generating strange attractor using histogram
%            method.
%missing number in liststr are not appropriate for this method
%54,53,52,51,50,49,48,47,46,45
xres=1000;
yres=1000;
load attractor_coeff

prompt = {'Enter choice:'};
dlg_title = '1 to 44';
num_lines = 1;
def = {'1'};
v=0;
answer = inputdlg(prompt,dlg_title,num_lines,def);
if ~isempty(answer)
    s=str2num(answer{1});
    v=1;
end

if v==1
    
    co = coeff(s,:);
    xn = 0; yn = 0; xi = 0; yi = 0; xxn = 0;
    roughxmin = 0;roughxmax = 0;roughymin = 0;roughymax = 0;
    h_msg =  msgbox(' Please Wait ',' ');
    for n=1:5000
        xxn=co(1)+co(2)*xn+co(3)*xn^2+co(4)*xn*yn+...
            co(5)*yn+co(6)*yn^2;
        yn=co(7)+co(8)*xn+co(9)*xn^2+co(10)*xn*yn+...
            co(11)*yn+co(12)*yn^2;
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
            xxn=co(1)+co(2)*xn+co(3)*xn^2+co(4)*xn*yn+...
                co(5)*yn+co(6)*yn^2;
            yn=co(7)+co(8)*xn+co(9)*xn^2+co(10)*xn*yn+...
                co(11)*yn+co(12)*yn^2;
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
    %imwrite(uint8(z),['3attr' num2str(s) '.png'],'png');
end