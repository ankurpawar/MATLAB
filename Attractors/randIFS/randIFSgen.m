function randIFSgen
%Random IFS generator
%This method is same as that for generating Barnsley's Fern.
%The only thing that differs is the value of the
%matrices which generate the fern.
%The mat file randIFSco contains the matrices
%This function has no INPUT and  OUTPUT arguments.
%Choose any one number from list dialog and wait for the
%figure to appear on screen.
liststr={'1';'2';'3';'4';'5';'6';'7';'8';
    '9';'10';'11';'12';'13';'14';
    '15';'16';'17';'18';'19';'20';
    '21';'22';'23';'24';'25';'26';'27'};
[s,v] = listdlg('PromptString','Select any one',...
    'SelectionMode','single',...
    'ListString',liststr);
if v==1
    
    k=1;
    res=50000;
    set(gcf,'color','white','name','Random IFS')
    pointsx=zeros(res,1);
    pointsy=zeros(res,1);
    x = [.5; .5];
    
    load randIFSco
    a1=A1([2*s-1 2*s],:); a2=A2([2*s-1 2*s],:) ;
    a3=A3([2*s-1 2*s],:) ;a4=A4([2*s-1 2*s],:) ;
    B1=b1([2*s-1 2*s]) ;  B2=b2([2*s-1 2*s]) ;
    B3=b3([2*s-1 2*s]) ;  P=p(s,:);
    
    while k<=res
        r = rand;
        if r < P(1)
            x = a1*x + B1;
        elseif r < P(2)
            x = a2*x + B2;
        elseif r < P(3)
            x = a3*x + B3;
        else
            x = a4*x;
        end
        pointsx(k)=x(2);
        pointsy(k)=x(1);
        k=k+1;
    end
    
    scatter(pointsx,pointsy,1.5,pointsx+pointsy),axis on
    colormap(makeColorMap(rand(1,3),rand(1,3),rand(1,3),64));
end