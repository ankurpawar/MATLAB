%3d attractor
% Xn+1 = a1 + a2Xn + a3Xn2 + a4XnYn + a5XnZn + a6Yn+ a7Yn2
%        + a8YnZn + a9Zn + a10Zn2
% Yn+1 = a11 + a12Xn + a13Xn2 + a14XnYn + a15XnZn + a16Yn+ a17Yn2
%        + a18YnZn + a19Zn + a20Zn2
% Zn+1 = a21 + a22Xn + a23Xn2 + a24XnYn + a25XnZn + a26Yn+ a27Yn2
%        + a28YnZn + a29Zn + a30Zn2
total=25000;
x=zeros(total,1);
y=zeros(total,1);
z=zeros(total,1);
liststr={'GHCMVFESUFJJGIUOHWFROOIGMGFBEC';
    'HESJWNBMQQEOYLGPPBXGNHTJTPNTUG';
    'IIQMSNRHWELIGAGIURCSRIWABJSESC';
    'IUWOTLCIVQNMKGLXCBGELWUUWUQKIT';
    'IXYMLIVIVWOAXXXLEHKDPICIGQUQGF';
    'JVSBDFVNDDWWNMDMHDOPCFNYRIYWIU';
    'JWWHJKPHMMKUVMKFSRHKJCYOISSQNB';
    'KUELCPYRWJFNDCNNRBVQKQREITYMIY';
    'LLMEVWJKOGMOIVHTISBKJGYYEFWSEK';
    'LOTMOQYJBPLDUWTSWJQDQJVAQLEDQF';
    'MNGCLHTMPFKYEQXNXVUETBDSSWOOGN';
    'NJWFGVSOPUNATNJMNRWDQMFKIGMRSB';
    'NKRCPBNOMEMVQQKSKYEIJOCQWEYOFP';
    'NLJYYNNEIORHAKLKJKOVJFTFGGSMQY';
    'NNRCKWREIASTBGRGPADGMGSHPKMPHU';
    'OCVGJFNYEVPTEQLASRSELPUHOTDBXP';
    'OGBGSHOUTDPTRFKCORFDLNKOSPNPHA';
    'PBMEFIUKEKPDTZEJMPXSJTUFZLFRJA';
    'PIIOOVNXNHPAUADBROXSSACJSXGMKX';
    'PNBJINWBKXSIISTQCVRQNUPKSCLTXS';
    'QETFNJNAHIINXFKUHXYHMTTBNJSIII';
    'QNBDVISXIPPLGVLRMKNCMORMJOCIHX';
    'RGOUVHFMIJQBAKEWDJOVQNUSGCNPDU';
    'RIVIMLQBPFVPSLIKHJNDSPMWMCBGMK';
    'UFPFQLVOLTUAVQYFLEVREPQLSNQRCD';
    'UIMPUSPSEJNDPKKENDVSEHCVWDVEGQ';
    'WUBBBVGSWOQFPMBKOPLQKUEIKHSVHM';
    'LURCEGOHOIQFJKBSNYHSNRUKKIKIHW';
    'MTISVBKHOIJFWSYEKEGYLWJKEOGVLM'};
xn=0;
yn=0;
zn=0;
[s,v] = listdlg('PromptString','Select any one ',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    an=double(liststr{s});
    coeff=(an-77)*0.1;
    
    yyn=0;
    xxn=0;
    k=0;
    xn=0;
    yn=0;
    for m=2:total
        %xn=x(m-1);
        %yn=y(m-1);
        xxn=coeff(1)+coeff(2)*xn+coeff(3)*xn^2+coeff(4)*xn*yn+...
            coeff(5)*xn*zn+coeff(6)*yn+coeff(7)*yn^2+coeff(8)*yn*zn+...
            coeff(9)*zn+coeff(10)*zn^2;
        yyn=coeff(11)+coeff(12)*xn+coeff(13)*xn^2+coeff(14)*xn*yn+...
            coeff(15)*xn*zn+coeff(16)*yn+coeff(17)*yn^2+coeff(18)*yn*zn+...
            coeff(19)*zn+coeff(20)*zn^2;
        zn=coeff(21)+coeff(22)*xn+coeff(23)*xn^2+coeff(24)*xn*yn+...
            coeff(25)*xn*zn+coeff(26)*yn+coeff(27)*yn^2+coeff(28)*yn*zn+...
            coeff(29)*zn+coeff(30)*zn^2;
        
        xn=xxn;
        yn=yyn;
        x(m)=xn;
        y(m)=yn;
        z(m)=zn;
        
    end
    %plot3(x,y,z,'.','markersize',1),hold on
    %scatter(x,y,1,z);
    maxz=max(z);
    z=z-min(z);
    scatter3(x,y,z,1,z),hold on
    colormap(hsv(64));
    %plot3((x-x)+min(x),y,z,'.','markersize',1,'color',[0 0 0]),hold on
    
    grid on
    axis equal
    %fid=fopen(['coeff' num2str(s) '.txt'],'w');
    %fprintf(fid,'%f,',coeff);
    %fclose(fid);
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