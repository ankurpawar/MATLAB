%4D attractor
% X = a1 + a2X + a3X2 + a4XY + a5XZ + a6XW + a7Y + a8Y2 + a9YZ + a10YW + a11Z + a12Z2 +
% a13ZW + a14W + a15W2
% Y = a16 + a17X + a18X2 + a19XY + a20XZ + a21XW + a22Y + a23Y2 + a24YZ + a25YW + a26Z +
% a27Z2 + a28ZW + a29W + a30W2
% Z = a31 + a32X + a33X2 + a34XY + a35XZ + a36XW + a37Y + a38Y2 + a39YZ + a40YW + a41Z +
% a42Z2 + a43ZW + a44W + a45W2
% W = a46 + a47X + a48X2 + a49XY + a50XZ + a51XW + a52Y + a53Y2 + a54YZ + a55YW + a56Z +
% a57Z2 + a58ZW + a59W + a60W2

total=25000;
x=zeros(1,total);
y=zeros(1,total);
z=zeros(1,total);
w=zeros(1,total);

%X = coeff(1) + coeff(2)*X + coeff(3)*X^2 + coeff(4)*X*Y + coeff(5)*X*Z + coeff(6)*X*W + coeff(7)*Y + coeff(8)*Y^2 + coeff(9)*Y*Z + coeff(10)Y*W + coeff(11)*Z + coeff(12)*Z^2 +coeff(13)*Z*W + coeff(14)*W + coeff(15)*W^2;
%Y = coeff(16) + coeff(17)*X + coeff(18)*X^2 + coeff(19)*X*Y + coeff(20)*X*Z + coeff(21)*X*W + coeff(22)*Y + coeff(23)*Y^2 + coeff(24)*Y*Z + coeff(25)Y*W + coeff(26)*Z + coeff(27)*Z^2 +coeff(28)*Z*W + coeff(29)*W + coeff(30)*W^2;
%Z = coeff(31) + coeff(32)*X + coeff(33)*X^2 + coeff(34)*X*Y + coeff(35)*X*Z + coeff(36)*X*W + coeff(37)*Y + coeff(38)*Y^2 + coeff(39)*Y*Z + coeff(40)Y*W + coeff(41)*Z + coeff(42)*Z^2 +coeff(43)*Z*W + coeff(44)*W + coeff(45)*W^2;
%W = coeff(46) + coeff(47)*X + coeff(48)*X^2 + coeff(49)*X*Y + coeff(50)*X*Z + coeff(51)*X*W + coeff(52)*Y + coeff(53)*Y^2 + coeff(54)*Y*Z + coeff(55)Y*W + coeff(56)*Z + coeff(57)*Z^2 +coeff(58)*Z*W + coeff(59)*W + coeff(60)*W^2;
liststr={'KWWFTQHWFFBKCFHMUSVFFFANCROGSSPPGOYTTCAONIULPGRITEAQVVQICBKK';
    'MDDKCBROKYJMXXQKPBMJSSMSURNIKSONBTWUCCOPRAGMFPNNTVGRNEQDQYNL';
    'NGFOFMKCYIFGJSSOVQKUYKUHTITJWEMUHNPXMFABUWXGAMQNQOXMGQTVJQOA'};
[s,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    an=double(liststr{s});
    coeff=(an-77)*0.1;
    
    yyn=0;
    xxn=0;
    zzn=0;
    k=0;
    X=0;
    Y=0;
    Z=0;
    W=0;
    x(1)=0.1;
    y(1)=0.1;
    z(1)=0.1;
    w(1)=0.1;
    for m=2:total
        
        xxn = coeff(1) + coeff(2)*X + coeff(3)*X^2 + coeff(4)*X*Y + coeff(5)*X*Z + coeff(6)*X*W + coeff(7)*Y + coeff(8)*Y^2 + coeff(9)*Y*Z + coeff(10)*Y*W + coeff(11)*Z + coeff(12)*Z^2 +coeff(13)*Z*W + coeff(14)*W + coeff(15)*W^2;
        
        yyn = coeff(16) + coeff(17)*X + coeff(18)*X^2 + coeff(19)*X*Y + coeff(20)*X*Z + coeff(21)*X*W + coeff(22)*Y + coeff(23)*Y^2 + coeff(24)*Y*Z + coeff(25)*Y*W + coeff(26)*Z + coeff(27)*Z^2 +coeff(28)*Z*W + coeff(29)*W + coeff(30)*W^2;
        
        zzn = coeff(31) + coeff(32)*X + coeff(33)*X^2 + coeff(34)*X*Y + coeff(35)*X*Z + coeff(36)*X*W + coeff(37)*Y + coeff(38)*Y^2 + coeff(39)*Y*Z + coeff(40)*Y*W + coeff(41)*Z + coeff(42)*Z^2 +coeff(43)*Z*W + coeff(44)*W + coeff(45)*W^2;
        
        W = coeff(46) + coeff(47)*X + coeff(48)*X^2 + coeff(49)*X*Y + coeff(50)*X*Z + coeff(51)*X*W + coeff(52)*Y + coeff(53)*Y^2 + coeff(54)*Y*Z + coeff(55)*Y*W + coeff(56)*Z + coeff(57)*Z^2 +coeff(58)*Z*W + coeff(59)*W + coeff(60)*W^2;
        X=xxn;
        Y=yyn;
        Z=zzn;
        x(m)=X;
        y(m)=Y;
        z(m)=Z;
        w(m)=W;
    end
    %plot3(x,y,z,'.','markersize',1),hold on
    %w=(w-min(w))/max(w-min(w));
    scatter3(x,y,z,2,w);
    %plot3(x,y,0*z,'.','markersize',1,'color',[0 0 0]);
    grid on
    axis equal
    % Xn+1 = a1 + a2Xn + a3Xn2 + a4XnYn + a5XnZn + a6Yn+ a7Yn2
    %        + a8YnZn + a9Zn + a10Zn2
    % Yn+1 = a11 + a12Xn + a13Xn2 + a14XnYn + a15XnZn + a16Yn+ a17Yn2
    %        + a18YnZn + a19Zn + a20Zn2
    % Zn+1 = a21 + a22Xn + a23Xn2 + a24XnYn + a25XnZn + a26Yn+ a27Yn2
    %        + a28YnZn + a29Zn + a30Zn2
    % scatter(x,y,1,x);
    % % rang=[min(x) max(x) min(y) max(y)]
    % title(liststr{s})
    % set(gcf,'color','white','name','Fractal Fern')
    % colormap(makeColorMap(rand(1,3),rand(1,3),rand(1,3),64));
    % axis off
    %saveas(gcf, liststr{s}, 'bmp');
end