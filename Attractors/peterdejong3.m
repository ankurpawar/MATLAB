%peterdejong3
NY=1024;
NX=1024;
col=zeros(NY,NX,3);
col2=ones(NY,NX);
PTS=2200000;%PTS=12000000
ip=1/(2*pi);
sc=100; m=2*pi; n=pi;
img=zeros(NY,NY,3);

while(1)
    a=rand*m-n; b=rand*m-n; x=0; y=0;
    c=rand*m-n; d=rand*m-n; good=1;
    if (abs(a)<1) continue; end
    if (abs(b)<1) continue; end
    if (abs(c)<1) continue; end
    if (abs(d)<1) continue; end
    good=100;
    for ii=1:100
        nx=sin(a*y)-cos(b*x);
        ny=sin(c*x)-cos(d*y);
        v=((x-nx)^2 + (y-ny)^2);
        x=nx; y=ny;
        if (v<1e-7)
            good=good-1;
        end
    end
    if (good>0)
        break;
    end
end

cr=0; cg=0; cb=0; ar=0; ag=0; ab=0; maxz=1;
for ii=1:PTS
    nx=sin(a*y)-cos(b*x);
    ny=sin(c*x)-cos(d*y);
    v=sqrt((x-nx)^2+(y-ny)^2)*atan2(ny,nx)*ip;
    ar=(ar+abs(sin(v*pi*3.2-pi*.2)))*0.5;
    ag=(ag+abs(sin(v*pi*12.3+pi*1.5)*0.5+0.5))*0.5;
    ab=(ab+(sin(v*pi*3.84+pi/2-.6)*.5+.5))*0.5;
    x=nx; y=ny; nx=nx*sc+512; ny=ny*sc+512;
    
    ny=floor(ny);
    nx=floor(nx);
    col(ny,nx,1)=col(ny,nx,1)+ar;
    col(ny,nx,2)=col(ny,nx,2)+ag;
    col(ny,nx,3)=col(ny,nx,3)+ab;
    col2(ny,nx)=col2(ny,nx)+1;
    maxz=max(maxz,col2(ny,nx));
end
maxz=24/maxz;
for ii=1:NY
    for jj=1:NX
        nz=col2(ii,jj);
        g=256/nz;
        cr=col(ii,jj,1)*g;
        cg=col(ii,jj,2)*g;
        cb=col(ii,jj,3)*g;
        nz=2*(1-1/(nz*maxz+1));
        img(ii,jj,1)=cr*nz;
        img(ii,jj,2)=cg*nz;
        img(ii,jj,3)=cb*nz;
        %setcol(cr*nz,cg*nz,cb*nz);
        %setpix(tx+j,ty+i);
    end
end
%img=img/(max(max(max(img))));
image(uint8(img))

%imwrite(uint8(255*img),'retinal.png','png')