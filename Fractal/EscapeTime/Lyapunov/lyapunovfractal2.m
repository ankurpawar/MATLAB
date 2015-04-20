%lyapunov fractal
%for further reference visit these links
%http://en.wikipedia.org/wiki/Lyapunov_fractal
%http://pagesperso-orange.fr/charles.vassallo/en/lyap_art/lyapdoc.html
%this script takes about 7 seconds to generate the fractal
seq_list  = {'[1 1 0 1 0]'  ;'[1 1 1 0 0 0]';...
    '[1 0 1 0 0 1]';'[1 0 1 1 0 1]'};

[s,v]     = listdlg('PromptString','Select sequence:',...
    'SelectionMode','single',...
    'ListString',seq_list);

if v==1
    seq=str2num(seq_list{s});
    
    hell = [];
    N    = 150;
    for rough=1:90
        hell=[hell seq];          %repeat the sequence
    end
    seq = hell(1:N);    clear hell
    seq_len = length(seq);
    lambda  = 0;
    a    = linspace(3,4,500);  %image plane
    b    = linspace(3,4,500);  %image plane
    a0   = 0;
    b0   = 0;
    r    = 0;
    x    = 0;
    sum_log = 0;
    rough = 0;
    rough1 = 0;
    lena = length(a);
    lenb = length(b);
    zval = zeros(lena,lenb);
    c = zeros(lena,lenb);
    for n=1:lena
        c(n,:) = b(n)+i*a(:);
    end
    
    total  =lena*lenb;
    prod_deriv = 0;
    tic
    h_msg = msgbox(' Please Wait ',' ');
    for m=1:total
        x=0.5;
        b0=imag(c(m));
        a0=real(c(m));
        for rough=1:seq_len
            if seq(rough)==1
                r=a0;
            else
                r=b0;
            end
            x=1*r*x*(1-x);
        end
        sum_log=0;
        prod_deriv = 1;
        rough=1;
        while ((rough<=N)&&(prod_deriv<200))
            if seq(rough)==1
                r=a0;
            else
                r=b0;
            end
            x = r*x*(1-x);
            prod_deriv =prod_deriv*r*(1-2*x);
            sum_log=sum_log+log(0.00001+abs(prod_deriv));
            rough=rough+1;
        end
        lambda = sum_log / N;
        zval(m)=10+abs(lambda);
    end
    toc
    close(h_msg);
    %cmap=fliplr(colormap(hot));
    cmap=choosecmap;
    colormap(cmap);
    h=imagesc(b,a,zval);
    
    rgb=sc(zval,[min(get(gca,'CLim')) max(get(gca,'CLim'))],cmap);
    [X,map]=rgb2ind(rgb,64);
    %imwrite(X,map,'lyapunov4.png','png');
    %remove these comments to save the figure as an image
    %zval2=get(h,'cdata');
    %rgb=ind2rgb8(zval2,cmap);
    %imwrite(zval,cmap,'lyapunov3.png','png');
end