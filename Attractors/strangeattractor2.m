function strangeattractor2
%strange attractor
%15 different attractor
%a,b,c..y are 25 coefficients denoting 1.2:0.1:-1.2
%a=1.2,b=1.1,c=1.0,d=0.9.....y=-1.2
%no input and output arguments
%run the script and select any one from the listbox
total=10000;
x=zeros(1,total);
y=zeros(1,total);
liststr={'qdasbcynawre';'ixxalopubexk';'kpmfwnpbiydc';
    'rouqvcksjqqe';'lcsavfiagfgy';'dlwcsogbyrqq';
    'jmyigonemmvu';'vmdtlegsbcul';'mpxfyvpfwdyp';
    'jigmlulmfooq';'igyeaaplonug';'gsvnapufkomd';
    'qoluaglqcqwl';'rhapxmppmjub';'doqqtwunwfvp'};
xn=0;
yn=0;
[s,v] = listdlg('PromptString','Select any one',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    an=double(liststr{s});
    coeff=(an-109)*-0.1;
    
    xxn=0;
    k=0;
    xn=0;
    yn=0;
    x(1)=0.10;
    y(1)=0.10;
    for m=2:total
        xn=x(m-1);
        yn=y(m-1);
        xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+...
            coeff(5)*yn+coeff(6)*yn^2;
        yn=coeff(7)+coeff(8)*xn+coeff(9)*xn^2+coeff(10)*xn*yn+...
            coeff(11)*yn+coeff(12)*yn^2;
        xn=xxn;
        x(m)=xn;
        y(m)=yn;
        
    end
    scatter(x,y,1,x);
    colormap(makeColorMap(rand(1,3),rand(1,3),rand(1,3),64))
    set(gcf,'color','white')
    axis on
    title(liststr{s})
    %saveas(gcf, liststr{s}, 'bmp');
end