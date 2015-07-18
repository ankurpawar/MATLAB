x  =  linspace(-1.5,0.6,100);
y  =  linspace(-1.26,1.26,100);
iter = 64;
len_x =  length(x);
len_y =  length(y);
xnew =  0;
ynew =  0;
a =  0;
b =  0;
xn =  0;
yn =  0;
rough =  0;
c =  zeros(len_y,len_x);
zval =  zeros(len_y,len_x);
h_msg =  msgbox(' Please Wait ',' ');

for n=1:len_y
    
    c(n,:)=y(n)+i*x(:);
    
end


for m=1:len_x*len_y
    
    a = imag(c(m));
    b = real(c(m));
    xn = 0;
    yn = 0;
    k = 0;
    while (k<=iter)&&((xn^2+yn^2)<4)
        xnew = xn^2 - yn^2 + a;
        ynew = 2*xn*yn + b;
        xn = xnew;
        yn = ynew;
        k = k+1;
    end
    zval(m) = k;
    
end
zunique=unique(zval);
close(h_msg);
zUniqLen=length(zunique);
cmap = 1-jet(65);
colormap(cmap);
%image(x,y,zval)

gapx=x(2)-x(1);
gapy=y(2)-y(1);
px=[0 0 1 1]*gapx;
py=[0 1 1 0]*gapy;
pz=[0 0 0 0];

scfile=fopen('mandel.sc','w');

instCount=0;
for n=1:len_x
    for m=1:len_y
        a = imag(c(n,m));
        b = real(c(n,m));
        %cindex=find(zunique==z(n,m));
        patch(px+a,py+b,zval(n,m)/64+pz ,cmap(zval(n,m),:));
        writeInstance(scfile,[0 0 0],[a b zval(n,m)/64],[gapx gapy zval(n,m)/64+1],instCount,cmap(zval(n,m),:));
        %abs(z(n,m));
        instCount=instCount+1;
    end
end

callbackStr='get(gca,''CameraPosition''),get(gca,''CameraTarget''),get(gca,''CameraUpVector'')';
sld2Hndl=uicontrol( ...
    'Style','pushbutton', ...
    'Position',[10 10 40 20], ...
    'Callback',callbackStr);

fclose(scfile);

