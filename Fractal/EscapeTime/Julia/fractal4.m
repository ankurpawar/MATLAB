%function juliafractal
%julia fractal 
%a and b can be 
%a=-0.835,b=-0.2321 
%a=-0.75 ,b=-0.35 
%a=0.285 ,b=0.01 
%a=0.45  ,b=0.1428
tic
x=(-1.7:0.007:1.7);
y=(-1.7:0.007:1.7);

a=0.6; b=-0.18;

xnew=0;ynew=0;
xn=0;yn=0;

img=zeros(length(x),length(y),3);
len_x=length(x);
len_y=length(y);
h_wait=waitbar(0,'Please  wait...');
for m=1:len_x
 for n=1:len_y
     xn=x(n);yn=y(m);k=1; 
     
     while (k<=30)&&((xn^2+yn^2)<4)
       xnew=xn^2 - yn^2 + a;
       ynew=2*xn*yn + b;  
       xn=xnew;yn=ynew; 
       k=k+1;
     end
    %k=mod(k+k+k,255);
    
    img(m,n,1)=k*8;
    img(m,n,2)=k*5;
    img(m,n,3)=k*2;
 end
waitbar(m/len_x,h_wait);
end
close(h_wait);
img8=uint8(img);
image(x,y,img8);
axis tight square
toc