%lyapunov fractal
seq     = [1 1 0 1 0];
hell=[];
for rough=1:370
    hell=[hell seq];
end
N    = 150;
seq=hell(1:N);
clear hell
seq_len = length(seq);
lambda  = 0;
b    = linspace(3,4,500);
a    = linspace(3,4,500);
r    = 0;
x    = 0;
sum_log = 0;
rough = 0;
rough1 = 0;

lena  = length(a);
lenb = length(b);
zval = zeros(lena,lenb);
prod_deriv = 0;
tic

for m=1:lena
    for n=1:lenb
        x=0.5;
        for rough=1:seq_len
            if seq(rough)==1
                r=a(m);
            else
                r=b(n);
            end
            x=r*x*(1-x);
        end
        hell=x;
        sum_log=0;
        prod_deriv = 1;
        for rough=1:N
            if seq(rough)==1
                r=a(m);
            else
                r=b(n);
            end
            x = r*x*(1-x);
            prod_deriv =prod_deriv*r*(1-2*x);
            sum_log=sum_log+log(0.00001+abs(prod_deriv));
            if(prod_deriv>200),break;end
        end
        lambda = sum_log/N;
        zval(m,n)=10+(lambda);
    end
end
toc
ho=flipud(colormap(hot));
colormap(ho);
imagesc(b,a,zval);