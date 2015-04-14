function strangeattractor3
%strange attractor with random coefficients from -1.2 to 1.2
%no input and output arguments
%attractorcoeff.mat contains the coefficients
load attractor_coeff
total=10000;
x=zeros(1,total);
y=zeros(1,total);
prompt = {'Enter choice:'};
dlg_title = '1 to 44';
num_lines = 1;
def = {'1'};
answer = inputdlg(prompt,dlg_title,num_lines,def);
v=0;
if ~isempty(answer)
    s=str2num(answer{1});
    v=1;
end

if v==1
    coeff=coeff(s,:);
    
    xxn=0;
    k=0;
    xn=0;
    yn=0;
    x(1)=0.0;
    y(1)=0.0;
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
    set(gcf,'color','white','name','Fractal Fern')
    axis off
    %saveas(gcf,['attractor' liststr{s}], 'bmp');
end