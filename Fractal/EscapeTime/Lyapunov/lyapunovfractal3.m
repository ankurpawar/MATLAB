function lyapunovfractal3
%lyapunov3

seq = [1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1];
seq =[1 1 1 0 0 0];
seq_length =length(seq);

amin = 3.4;
amax = 4.0;
bmin = 2.5;
bmax = 3.4;
asize = 200;
bsize = 200;
nmax = 100;                % number of rounds
a_arr=linspace(amin,amax,asize);
b_arr=linspace(bmin,bmax,bsize);
z=zeros(asize,bsize,3);
%/* for color generation; somewhat empirical, in order to match Wickerprint's original colors */
lambda_min = -2.55;
lambda_max = 0.3959;
rgb_f=zeros(1,3);
%ai, bi, n, m;
%a, b, lambda, sum_log_deriv, prod_deriv, r, x, rgb_f[3];
tic
for ai=1:asize
    a = a_arr(ai);
    for bi=1:bsize
        b = b_arr(bi);
        x = 0.5;
        for m =1:seq_length
            if seq(m)==1
                r =  b ;
            else
                r=   a ;
            end
            x = r*x*(1-x);
        end
        
        sum_log_deriv = 0;
        for n=1:nmax
            prod_deriv = 1;
            for m=1:seq_length
                if seq(m)==1
                    r = b ;
                else
                    r = a ;
                end
                prod_deriv =prod_deriv* r*(1-2*x);
                x = r*x*(1-x);
            end
            sum_log_deriv =sum_log_deriv+log(abs(prod_deriv));
        end
        lambda = sum_log_deriv / (nmax*seq_length);
        
        if (lambda > 0)
            rgb_f(1,3) = lambda/lambda_max;
            rgb_f(1,2) = 0;
            rgb_f(1,1) = 0;
        else
            rgb_f(1,1) = 1 - (lambda/lambda_min)^(0.6667);
            rgb_f(1,2) = 1 - (lambda/lambda_min)^(0.3333);
            rgb_f(1,3) = 0;
        end
        z(ai,bi,1) = clamp(rgb_f(1,1)*255);
        z(ai,bi,2) = clamp(rgb_f(1,2)*255);
        z(ai,bi,3) = clamp(rgb_f(1,3)*255);
    end
end
toc
imshow(uint8(z));


function  y=clamp(x)
if x>255
    y=255;
elseif x<0
    y=0;
else
    y=x;
end
